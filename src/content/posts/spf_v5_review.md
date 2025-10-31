+++
title = "Review of Speculative Page Faults patchset v5"
date = 2018-11-29T14:01:48+09:00
draft = true

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "patch", "review"]
categories = ["linux patch review"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

이 포스트는 `mmap_sem` 으로 인한 병렬성 문제를 해결하기 위해 제안된
`speculative page faults` 패치셋의 SRCU 를 사용한 마지막 버전인 [다섯번째
버전](https://lore.kernel.org/patchwork/cover/840046/) 을 리뷰합니다.


[Patch 01/22] x86/mm: Define CONFIG_SPF
--------------------------------------

`x86_64 && SMP` 에 의존해 CONFIG_SPF 라는 빌드 구성이 켜지게 합니다.  이
컨피규레이션이 켜진 채 빌드된 커널은 SPF 를 사용할 겁니다.


[Patch 02/22] powerpc/mm: Define CONFIG_SPF
------------------------------------------

Power PC 아키텍쳐에서도 CONFIG_SPF 빌드 구성이 존재하게 하며, 의존성은 x86 의
것과 같습니다.


[Patch 03/22] mm: Dont assume page_table invariance during faults
-----------------------------------------------------------------

SPF 는 `free_pgtable()` 과 동시에 수행되므로, free 시점에 타겟 페이지 테이블이
존재치 않을 수도 있습니다.  이 패치는 이를 반영합니다.

이를 위해, CONFIG_SPF 가 켜졌을 때에는 `pte_unmap_same()` 함수가 빌드되지 않고,
`cow_user_page()` 에서의 이 함수를 호출하는 부분도 삭제되게끔 합니다.


[Patch 04/22] mm: Prepare for FAULT_FLAG_SPECULATIVE
----------------------------------------------------

SPF 의 핵심은 vma 를 수정할 때마다 sequence count 를 변경시키고, page fault
handler 에서는 작업 전후에 타겟 vma sequence count 를 읽고 그 값이 바뀌었는지
확인해서 변경이 있으면 abort 하는 겁니다.  이 패치셋은 사실은 그저
`pte_offset_map_lock()` 의 wrapper 일 뿐이지만 미래에 구현이 완성될, 동시적 vma
변경이 있다면 `false` 를 리턴하게 될 `pte_map_lock()` 을 정의하고 이 함수를
대신 사용하게 코드를 변경 (`wp_page_copy()`, `do_wp_page()`, `do_swap_page()`,
`do_anonymous_page()`, `pte_alloc_one_map()`) 합니다.


[Patch 05/22] mm: Introduce pte_spinlock for FAULT_FLAG_SPECULATIVE
-------------------------------------------------------------------

SPF 에서는 pte lock 으로의 포인터를 가져오는 작업과 이 락을 잡는 일이 vma 변경
없는 사이에 원자적으로 이루어져야 합니다.  이걸 위한 코드 변경을 간단하게 하기
위해 이 패치는 이 두개의 작업을 해주는 함수, `pte_spinlock()` 을 정의하고 다른
코드 (`do_numa_page()`, `handle_pte_fault()`) 에서도 이 함수를 사용하도록
변경합니다.


[Patch 06/22] mm: VMA sequence count
------------------------------------

vma 를 수정하는 코드 중 일부가 해당 vma 의 sequence count 를 조정하도록 만드는
패치입니다.  이 sequence count 를 통해 SPF 는 동시의 vma 수정을 파악할 수
있습니다.

`struct vm_area_struct` 안에 `CONFIG_SPF` 가 정의되어 있으면 `seqcount_t
vm_sequence` 필드를 추가하고, `vm_write_begin(), vm_write_begin_nested(),
vm_write_end(), vm_raw_write_begin(), vm_raw_write_end()` 으로
`vma->vm_sequence` 에 `write_seqcount_begin()` 류의 함수를 호출하는 wrapper
함수들을 정의합니다.

`vm_raw_write*()` 류는 lockdep 의 경고를 피할 수 있기 때문에 쓰이는데, lockdep
의 false positive 를 피하기 위함입니다.

`unmap_page_ranges()` 에서 `vm_write_begin(), vm_write_end()` 를,
`__vma_adjust()` 에서 `vm_raw_write_begin(), vm_raw_write_end()` 를 호출합니다.


[Patch 07/22] mm: Protect VMA modifications using VMA sequence count
--------------------------------------------------------------------

앞의 패치와 유사하지만 다른 영역들도 sequence count 를 조정하게끔 추가로
변경하는 패치입니다.

`madvise(), mremap(), mpol_rebind_policy(), vma_replace_policy(),
change_prot_numa(), mlock(), munlock(), mprotect(), mmap_region(),
collapse_huge_page(), userfaultd` 관련 코드가 그것으로, 구체적으로 수정한
함수는 아래와 같습니다:

`clear_refs_write(), dup_userfaultfs(), userfaultfd_release(),
userfaultfd_register(), userfaultd_unregister(), collapse_huge_page(),
madvise_behavior(), madvise_free_page_ranges(), mpol_rebind_mm(),
change_prot_numa(), vma_replace_policy(), munlock_vma_pages_range(),
mlock_fixup(), __vma_adjust(), mmap_region(), expand_downwards(),
mprotect_fixup(), move_vma()`


[Patch 08/22] mm: RCU free VMAs
-------------------------------

SPF 에서는 vma tree (`mm_rb`) 를 SRCU 로 보호합니다.  이 패치는 VMA 관리를 SRCU
를 통해 하도록 만듭니다.  또한, RCU 를 사용하려면 업데이트 쓰레드간의 동기화는
별도로 제공해야 하는데, SPF 는 seqlock 을 사용하게 되었습니다.  또한, vmacache
는 사용하지 않습니다.

__데이터 구조 변경__

`struct vm_area_struct` 에 `struct rcu_head vm_rcu_head` 필드를 추가하고,
`struct mm_struct` 에 `seqlock_t mm_seq` 를 추가합니다.
`mm/mmap.c` 내에 `vma_srcu` 전역 srcu 객체도 만듭니다 (`DEFINE_SRCU()`).

`mm_init()` 내에서 `->mm_seq` 필드를 초기화 하고 (`seqlock_init()`)

__free__

`free_vma()` 를 정의하는데, `vma_src` 의 grace period 후에 `__free_vma()` 를
호출하도록 defer 하는 `call_srcu()` 호출의 wrapper 일 뿐입니다.
`__free_vma()` 는 기존 vma 메모리 해제 코드와 동일하게 `->vm_file`, 해당 vma 의
memory policy 를 put 하고 `vm_area_cachep` 캐시에 메모리를 반환합니다.

기존의 vma 정리 코드는 `free_vma()` 로 대체됩니다:
`remove_vma(), __vma_adjust()`

__read__

`find_vma()` 와 같지만 `vmacache` 를 뒤지지 않는 `__find_vma()` 함수를 새로
정의합니다.
`find_vma()` 에서는 `vmacache` 를 뒤진 후 `__find_vma()` 함수를 호출합니다.

`find_vma_srcu(mm, addr)` 함수를 정의합니다.
이 함수는 srcu read lock 이 잡혀 있을 것을 가정하고 수행되어, `mm->mm_seq` 의
read 권한 하에 `__find_vma()` 를 호출해 vma 를 찾습니다.

__update__

기존의 vma tree 수정 코드는 `mm->mm_seq` 로 크리티컬 섹션을 보호하게 합니다:
`__vma_rb_erase(), __vma_link_rb()`


[Patch 09/22] mm: Cache some VMA fields in the vm_fault structure
-----------------------------------------------------------------

SPF 에서는 page fault handler 가 vma 에 접근하고 있는 와중에도 vma 가 변경될 수
있으므로, 그 필드들을 모두 신뢰하기 어렵습니다.  이 패치는 `vma->vm_flags` 와
`vma->vm_page_prot` 필드를 `struct vm_fault` 에 미리 캐시해 둡니다.

`unsigned long vma_flags` 와 `pgprot_t vma_page_prot` 필드를 `struct vm_fault`
안에 추가합니다.

이 필드를 vma 의 것에서 복사합니다:
`hugetlb_no_page()`, `__collapse_huge_page_swapin()`, `__handle_mm_fault()`

`->vma_flags` 를 vma 에서가 아니라 앞서 복사해둔 vmf 에서 읽어 사용합니다:
`wp_page_copy()`, `do_wp_page()`, `do_swap_page()`, `do_anonymous_page()`,
`do_set_pmd()`, `alloc_set_pte()`, `finish_fault()`, `do_fault()`,
`do_numa_page()`, `wp_huge_pmd()`

`->vm_page_prot` 를 vma 에서가 아니라 앞서 복사해둔 vmf 에서 읽어 사용합니다:
`do_swap_page()`, `do_anonymous_page()`, `alloc_set_pte()`, `do_numa_page()`


[Patch 10/22] mm: Protect SPF handler against anon_vma_changes
--------------------------------------------------------------

`page_add_new_anon_rmap()` 이 SPF 와 동시에 수행되므로 이로 인한 레이스가
없게끔 조치를 취하는 패치입니다.

`free_pgtables()` 내에서 `unlink_anon_vmas()` 를 `vm_write_begin(vma),
vm_write_end(vma)` 로 감싸줍니다.


[Patch 11/22] mm/migrate: Pass vm_fault pointer to migrate_misplaced_page()
---------------------------------------------------------------------------

`migrate_misplaced_page()` 함수는 page fault 중에만 호출되므로, vma 대신
`struct vm_fault` 를 인자로 넘겨주는 패치입니다.

`do_numa_page()` 내에서의 `migrate_mispaced_page()` 호출 코드를 수정하고,
`migrate_misplaced_page()` 내에서도 `vmf->vma_flags` 를 사용하도록 수정합니다.


[Patch 12/22] mm: Introduce `__lru_cache_add_active_or_unevictable`
-------------------------------------------------------------------

SPF 경로에서 호출되는 `lru_cache_add_active_or_unevictable()` 함수는 vma 를
전달받고 여기서 `->vm_flags` 필드에 접근합니다.  하지만, SPF 수행 중 vma 변경이
가능하니, SPF 에서 이는 안전치 못하죠.  Therefore, this patch introduce
`__lru_cache_add_active_or_unevictable()` function, which is similar with the
`lru_cache_add_active_or_evictable()` but receives `unsinged long vma_flags` as
an argument.  Also, this patch change `lru_cache_add_active_or_unevictable()`
function to a simple wrapper to the `__lru_cache_add_active_or_unevictable()`
function.

Finally, this patch modifies `lru_cache_add_active_or_unevictable()` function
call from SPF path to call `__lru_cache_add_active_or_unevictable()` instead:
`wp_page_copy()`, `do_swap_page()`, `do_anonymous_page()`, `alloc_set_pte()`


[Patch 13/22] mm: Introduce `__maybe_mkwrite()`
-----------------------------------------------

Similar with patch 12.  Introduce `__maybe_mkwrite()`, which is similar with
`maybe_mkwrite()` but recieves the flags as value and modifies
`maybe_mkwrite()` to call `__maybe_mkwrite()`.

Code modified to call `__maybe_mkwrite()` instead of `maybe_mkwrite()` is as
below:
`wp_page_reuse()`, `wp_page_copy()`


[Patch 14/22] mm: Introduce `__vm_normal_page()`
------------------------------------------------

Similar with the patch 12, 13.  This time, for `_vm_normal_page()`.
Modified function calls are in:
`do_wp_page(), do_numa_page()`


[Patch 15/22] mm: Introduce `__page_add_new_anon_rmap()`
--------------------------------------------------------

Introduce `__page_add_new_anon_rmap()`, which is same with
`page_add_new_anon_rmap()` but does not check the `->vm_start` and `->vm_end`
of the vma against the target address.

`page_add_new_anon_rmap()` does the check and then calls the
`__page_add_new_anon_rmap()` now.

SPF path calls `__page_add_new_anon_rmap()` directly to skip the address range
check:
`wp_page_copy()`, `do_swap_page()`, `do_anonymous_page()`, `alloc_set_pte()`


[Patch 16/22] mm: Provide speculative fault infrastructure
----------------------------------------------------------

__structural changes__
- Add `unsigned int sequence` in `struct vm_fault`

__Functional changes__
- Use `READ_ONCE()` for `vma->vm_flags, vma->vm_start, vma->vm_pgoff` at `is_vm_hugetlb_page(), linear_page_index(), print_bad_pte() `
- Modify `pte_spinlock()` for `CONFIG_SPF`:
  * if the `vma->flags` has no `FAULT_FLAG_SPECULATIVE`, do as before (just
    find and lock the corresponding pte lock)
  * Else, disbale irq, check `vma_has_changed()`, lock the pte lock, check
    `vma_has_changed()` again, enable irq again.  If any change to the target
    vma was occurred, return false.
- Modify `pte_map_lock()` to work as expected rather than a wrapper for
  `pte_offset_map_lock()`
  * If the `vmf->flags` has no `FAULT_FLAG_SPECULATIVE`, call
    `pte_offset_map_lock()`, set `vmf->pte` as its return value, and return
    true as before
  * Disable irq, check vma change, get proper pte using
    `pte_offset_map_lock()`, check vma change (if change occurred, call
    `pte_unmap_unlock()` and abort), set `vmf->pte` and `vmf->ptl` as the pte
    and ptl, enable irq again, return true
- `do_anonymous_page()
  * Skip userfaultfd if `vmf->flags` has `FAULT_FLAG_SPECULATIVE`.
- `handle_pte_fault()`
  * if the vma is not anonymous area and the `vmf` has
    `FAULT_FLAG_SPECULATIVE`, just return `VM_FAULT_RETRY`
- `handle_mm_fault()`
  * Set `vmf.sequence as `vma->vm_seqeunce`

__New functions__
-  Define `vma_has_changed()`: Changed if target vma is removed from the
     `mm_rb` or vma's `->vm_seuquence` is different with `vmf->sequence`
- `handle_speculative_fault()
  * Define local variable `vmf`, set its address as received argument
  * Clear `FAULT_FLAG_ALLOW_RETRY and FAULT_FLAG_KILLABLE` and set
    `FAULT_FLAG_SPECULATIVE` to the flags that received
  * `srcu_read_lock(&vma_srcu)`
  * Find appropriate vma using `find_vma_srcu()`, abort if the vma not found
  * Check vma link in mm_rb, read `vma->vm_sequence`, abort if the vma is not
    in mm_rb or the sequence coutn is odd.
  * Abort if the `vma->vm_ops` is non-NULL, the vma is not for anonymous pages
  * Set `->vma_flags` and `->vma_page_prot` of the vmf as that of the vma.
  * Abort if the flag has `VM_UFFD_MISSING`, which means userfault.
  * Abort if it is NUMA and the policy is `MPOL_INTERLEAVE`
  * Abort if the vmf flag has `VM_GROWSDOWN` or `VM_GROWSUP`
  * Abort if faulting address is not in the vma
  * Abort and return `VM_FAULT_SIGSEGV` if the vma is not permitting the action
    in received flag
  * Abort and return `VM_FAULT_SIGSEGV` if the fault needs WRITE and the vma
    doesn't permit it
  * Abort and return `VM_FAULT_SIGSEGV` if the fault needs no `WRITE` and the
    vma doesn't allow read, exec, write.
  * Disable IRQ
  * Get the pgd entry using the faulting address, abort if the pgd entry is
    wrong
  * Get p4d entry using the pgde and address, abort if the p4d entry is wrong
  * Get pud entry using the p4d and address, abort if the entry is wrong
  * Abort if the pud entry says that is for THP
  * Get pmd entry using the pud andd address, abort if the entry is wrong
  * Abort if the pmd entry says that is for THP
  * Set `pmd` field of `vmf` as the address to the pmd entry
  * Set `vma, pgoff, fgp_mask, sequence, flags` of the vmf as necessary
  * Enable IRQ
  * Check `vma->vm_sequence` with the one we read before, abort if it changed
  * Call `handle_pte_fault() with the vmf
  * Call `srcu_read_unlock()`


[Patch 17/22] mm: Try spin lock in speculative path
---------------------------------------------------

한 CPU 가 speculativ page fault 를 수행하는 사이에 다른 CPU 가 `do_unmap()` 을
호출하면 데드락이 생길 수 있습니다.  Peter 의 기존 버전에서의 큰 문제 중 하나가
이거였죠.

데드락 걸린 경우의 스택 트레이스는 다음과 같습니다:

```
            CPU 0
            native_flush_tlb_others+0x7c/0x260
            flush_tlb_mm_range+0x6a/0x220
            tlb_flush_mmu_tlbonly+0x63/0xc0
            unmap_page_range+0x897/0x9d0
            ? unmap_single_vma+0x7d/0xe0
            ? release_pages+0x2b3/0x360
            unmap_single_vma+0x7d/0xe0
            unmap_vmas+0x51/0xa0
            unmap_region+0xbd/0x130
            do_munmap+0x279/0x460
            SyS_munmap+0x53/0x70

            CPU 1
            do_raw_spin_lock+0x14e/0x160
            _raw_spin_lock+0x5d/0x80
            ? pte_map_lock+0x169/0x1b0
            pte_map_lock+0x169/0x1b0
            handle_pte_fault+0xbf2/0xd80
            ? trace_hardirqs_on+0xd/0x10
            handle_speculative_fault+0x272/0x280
            handle_speculative_fault+0x5/0x280
            __do_page_fault+0x187/0x580
            trace_do_page_fault+0x52/0x260
            do_async_page_fault+0x19/0x70
            async_page_fault+0x28/0x30
```

`pte_spinlock()` 내에서 `vmf->ptl` 을 `spinlock()` 대신 `spin_trylock()` 으로
시도해보고 빠집니다.
`pte_map_lock()` 에서도 `pte_offset_map_lock()` 을 쪼개서 `pte_offset_map()` 과
`spin_trylock()` 으로 수행하고 try lock 에 실패하면 abort 합니다.


[Patch 18/22] mm: Adding speculative page fault failure trace events
--------------------------------------------------------------------

spf 의 디버깅을 위해 spf 가 실패하는 경우들을 위한 trace event 를 추가합니다.
`spf.spf_pte_lock, spf.spf_vma_changed, spf.spf_vma_dead, spf.spf_vma_noanona,
spf.spf_vma_notsup, spf.spf_vma_access` 로 여섯개 이벤트를 정의하고, 이
이벤트들을 코드 적재적소에서 발생시키게 합니다.


[Patch 19/22] mm: Add a speculative page fault sw event
-------------------------------------------------------

`enum perf_sw_ids` 에 `PERF_COUNT_SW_SPF` 를 추가해 줍니다.


[Patch 20/22] perf tools: Add support for the SPF perf event
------------------------------------------------------------

앞의 커밋에서 추가한 sw event 를 perf userspace tool 에서 카운트 할 수 있게끔
해줍니다.


[Patch 21/22] x86/mm: Add speculative pagefault handling
--------------------------------------------------------

앞의 커밋들로 speculative page fault 를 위한 준비가 끝났지만 최종적으로
시스템이 speculative page fault 를 하도록 되어 있진 않습니다.  이 마지막 단계를
이 커밋이 마무리 합니다.

`__do_page_fault()` 내에서 user page fault 의 경우 `handle_speculative_fault()`
를 통해 fault 를 처리하고, 성공하면 이걸로 마무리 짓습니다.


[Patch 22/22] powerpc/mm: Add speculative page fault
----------------------------------------------------

앞의 커밋과 동일한 일을 powerpc 전용 `__do_page_fault()` 내에서 해줍니다.


Summary of whole changes
========================


Data structural changes
-----------------------

- Define `FAULT_FLAG_SPECULATIVE` at `include/linux/mm.h`
- Add fields to `struct vm_fault` at `include/linux/mm.h`
	* `unsigned int sequence`: Cache read `vma->vm_sequence` value
	* `unsigned long vma_flags`
	* `pgprot_t vma_page_prot`
- Add a field to `struct vm_area_struct` at `include/linux/mm_types.h`
	* `seqcount_t vm_sequence`: Mark vma updates
- Add a field to `struct mm_struct` at `include/linux/mm_types.h`
	* `seqlock_t mm_seq`: Mark vma tree updates
- Define `vma_srcu` at `mm/mmap.c`


`vma_srcu` protected vma freeing
--------------------------------

- `__vma_adjust()` at `mm/mmap.c` calls `free_vma()`
- `remove_vma()` at `mm/mmap.c` calls `free_vma()`
- `remove_vma_list()` at `mm/mmap.c` calls `remove_vma()`
- `exit_mmap()` at `mm/mmap.c` calls `remove_vma()`


`vma_srcu` read-side critical sections
--------------------------------------

- `handle_speculative_fault()` entire path including `handle_pte_fault()` at
  `mm/memory.c`


Mark vma update with `vma->vm_sequence`
---------------------------------------

- `clear_refs_write()` at `fs/proc/task_mmu.c`
- `fs/userfaultd.c`
	* `dup_userfaultfd()`
	* `userfaultfd_release,register,unregister()`
- `collapse_huge_page()` at `mm/khugepaged.c`
- `madvise_behavior()`, `madvise_free_page_range()` at `mm/madvise.c`
- `free_pgtables()`, `unmap_page_range()` at `mm/memory.c`
- `mm/mempolicy.c`
	* `mpol_rebind_policy()`
	* `change_prot_numa()`
	* `vma_replace_policy()`
- `__munlock_pagevec_fill()` at `mm/mlock.c`
- `__vma_adjust()` at `mm/mmap.c`
- `mmap_region()` at `mm/mmap.c`
- `expand_downwards()` at `mm/mmap.c`
- `mprotect_fixup()` at `mm/mprotect.c`
- `move_vma()` at `mm/mremap.c`


Check concurrent vma updates with `vma->vm_seuqence`
----------------------------------------------------

- `mm/memory.c`
	* `pte_spinlock(vmf)`
	* `pte_map_lock(vmf)`
	* `wp_page_copy(vmf)` fails if `pte_map_lock()` fails
	* `finish_mkwrite_fault()` fails if `pte_map_lock()` fails
	* `do_wp_page(vmf)` fails if `pte_map_lock()` fails
	* `do_swap_page(vmf)` fails if `pte_map_lock()` fails
	* `do_anonymous_page(vmf)` fails if `pte_map_lock()` fails
	* `pte_alloc_one_map(vmf)` use `pte_map_lock(vmf)`
	* `do_numa_page(vmf)` uses `pte_spinlock()`
	* `handle_speculative_fault()`, check before `handle_pte_fault()` call


Mark vma tree updates with `mm->mm_seq`
---------------------------------------

- `mm/mmap.c`
	* `__vma_rb_erase()`: Also mark the vma as orphan
	* `__vma_link_rb()`: init `vma->vm_sequence`


Check vma tree updates with `mm->mm_seq`
----------------------------------------

- `find_vma_srcu(mm, addr)` at `mm/mmap.c` retry finding vma if `mm->mm_seq`
  says concurrent updates exist


Notes
=====

- `do_page_fault()` is registered as the page fault exception handler in each
  arch code.  It calls `__do_page_fault()`, which is arch dependent.
- `__do_page_fault()` for x86 and powerpc do speculative page fault.  If it
  fails, just do in traditional way.
- `__do_page_fault()` in traditional way read-lock `mmap_sem`, find appropriate
  vma, calls `__handle_mm_fault()`, and read-release the `mmap_sem`.
 * `__handle_mm_fault()` is similar with the `speculative_page_fault()`.
   Set the `struct vm_fault` local variable, find pgd, p4d, pud, pmd and set
   the `vmf.pmd` and `vmf.pud`, set `vmf.sequence` for SPF case, and finally call
   `handle_pte_fault(&vmf)`
  * `handle_pte_fault()` set `vmf->pte` and calls `do_anonymous_page(vmf)`,
    `do_fault()`, `do_swap_page()` (this function check this fault as major
    fault by returning `VM_FAULT_MAJOR`), `do_numa_page()`, as necessary, set
    pte as dirty or young as necessary, update mmu cache, and flush tlb as
    necessary, unlock pte.


Callstacks
==========

- Normal page fault path
```
do_page_fault(regs, error_code)
 __do_page_fault(regs, error_code, address)
  handle_mm_fault(vma, address, flags)
   __handle_mm_fault(vma, address, flags)
    handle_pte_fault(vmf)
```

- Speculative page fault path
```
do_page_fault(regs, error_code)
 __do_page_fault(regs, error_code, address)
  handle_speculative_fault(mm, address, flags)
   handle_pte_fault(vmf)
```

- Callstack after the `handle_pte_fault()
```
handle_pte_fault(vmf)
 do_anonymous_page(vmf) || do_fault(vmf)
 do_swap_page(vmf)
 do_numa_page(vmf)
 pte_spinlock()
 mk_pteyoung()
 pte_unmap_unlock()
```
