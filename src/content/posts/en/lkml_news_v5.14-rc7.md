---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-08-17T07:07:40+02:00
lastmod: 2021-08-17T07:07:40+02:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

[PATCH v2 0/3] virtio-mem: disallow mapping virtio-mem memory via /dev/mem (David Hildenbrand)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210816142505.28359-1-david@redhat.com

Once the virtio-mem driver is plugging/unplugging memory of virtual machines,
accessing the memory region via `/dev/mem` from the user space makes no sense.
To avoid such insane use case, this patchset adds a basic infrastructure to
exclude some physical memory regions completely from `/dev/mem`.


[PATCH v2 00/61] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20210817154651.1570984-1-Liam.Howlett@oracle.com

This patchset introduces a new data structure called maple tree, which intended
to replace the rbtree for `vm_area_struct`.  Because this is a range based
B-tree, the author argues this can solve the locking scalability issue.


mmotm 2021-08-16-22-16 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210817051640.JSWSiyLWh%akpm@linux-foundation.org

mm of the moment queue updated.  10 patches dropped, 42 patches added, and 44
patches modified.

```
Dropped
-------

kasan-kmemleak-reset-tags-when-scanning-block.patch
kasan-slub-reset-tag-when-printing-address.patch
lib-use-pfn_phys-in-devmem_is_allowed.patch
linux-next-git-rejects.patch
linux-next-rejects-fix.patch
makefile-remove-stale-cc-option-checks.patch
mm-madvise-report-sigbus-as-efault-for-madv_populate_readwrite.patch
mm-memcg-fix-incorrect-flushing-of-lruvec-data-in-obj_stock.patch
mm-slub-fix-slub_debug-disablement-for-list-of-slabs.patch
slub-fix-kmalloc_pagealloc_invalid_free-unit-test.patch

Added
-----

all-replace-find_next_zero_bit-with-find_first_zero_bit-where-appropriate.patch
arch-remove-generic_find_first_bit-entirely.patch
bitmap-unify-find_bit-operations.patch
bitops-move-find_bit__le-functions-from-leh-to-findh.patch
bitops-protect-find_first_zero_bit-properly.patch
checkpatch-make-email-address-check-case-insensitive.patch
cpumask-replace-cpumask_next_-with-cpumask_first_-where-appropriate.patch
cpumask-use-find_first_and_bit.patch
devfreq-use-hz-macros.patch
find-micro-optimize-for_each_setclear_bit.patch
hwmon-drivers-mr75203-use-hz-macros.patch
i2c-drivers-ov02q10-use-hz-macros.patch
iio-drivers-as73211-use-hz-macros.patch
iio-drivers-hid-sensor-use-hz-macros.patch
include-linux-move-for_each_bit-macros-from-bitopsh-to-findh.patch
include-move-findh-from-asm_generic-to-linux.patch
lib-add-find_first_and_bit.patch
lib-bitmap-add-performance-test-for-bitmap_print_to_pagebuf.patch
memblock-make-memblock_find_in_range-method-private.patch
mm-add-kernel_misc_reclaimable-in-show_free_areas.patch
mm-gup-documentation-corrections-for-gup-pup.patch
mm-gup-remove-try_get_page-call-try_get_compound_head-directly.patch
mm-gup-small-refactoring-simplify-try_grab_page.patch
mm-hwpoison-change-argument-struct-page-hpagep-to-hpage.patch
mm-hwpoison-fix-potential-pte_unmap_unlock-pte-error.patch
mm-hwpoison-fix-some-obsolete-comments.patch
mm-hwpoison-remove-unneeded-variable-unmap_success.patch
mm-idle_page_tracking-make-pg_idle-reusable-fix-2.patch
mm-in_irq-cleanup.patch
mm-percpu-micro-optimize-pcpu_is_populated.patch
mm-slub-do-initial-checks-in-___slab_alloc-with-irqs-enabled-fix-fix.patch
mm-slub-do-initial-checks-in-___slab_alloc-with-irqs-enabled-fix.patch
mmflagsh-add-missing-__gfp_zerotags-and-__gfp_skip_kasan_poison-names.patch
mtd-drivers-nand-use-hz-macros.patch
phy-drivers-stm32-use-hz-macros.patch
replace-for_each__bit_from-with-for_each__bit-where-appropriate.patch
thermal-drivers-devfreq_cooling-use-hz-macros.patch
tools-rename-bitmap_alloc-to-bitmap_zalloc.patch
tools-sync-tools-bitmap-with-mother-linux.patch
units-add-the-hz-macros.patch
units-change-from-l-to-ul.patch
vsprintf-rework-bitmap_list_string.patch

Modified
--------

fix-zone_id-may-be-used-uninitialized-in-this-function-warning.patch
info-task-hung-in-generic_file_write_iter.patch
init-mainc-silence-some-wunused-parameter-warnings.patch
kconfigdebug-drop-selecting-non-existing-hardlockup_detector_arch.patch
lib-test-convert-test_sortc-to-use-kunit.patch
linux-next-rejects.patch
linux-next.patch
math-rational_kunit_test-should-depend-on-rational-instead-of-selecting-it.patch
memcg-enable-accounting-for-mnt_cache-entries.patch
memcg-enable-accounting-for-new-namesapces-and-struct-nsproxy.patch
mm-debug_vm_pgtable-fix-corrupted-page-flag.patch
mm-debug_vm_pgtable-introduce-struct-pgtable_debug_args.patch
mm-debug_vm_pgtable-remove-unused-code.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-basic-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-leaf-and-savewrite-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-migration-and-thp-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-pgd-and-p4d-modifying-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-pmd-modifying-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-protnone-and-devmap-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-pte-modifying-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-pud-modifying-tests.patch
mm-debug_vm_pgtable-use-struct-pgtable_debug_args-in-soft_dirty-and-swap-tests.patch
mm-delete-unused-get_kernel_page.patch
mm-introduce-memmap_alloc-to-unify-memory-map-allocation.patch
mm-migrate-enable-returning-precise-migrate_pages-success-count.patch
mm-move-kvmalloc-related-functions-to-slabh.patch
mm-numa-automatically-generate-node-migration-order.patch
mm-page_alloc-always-initialize-memory-map-for-the-holes.patch
mm-page_alloc-make-alloc_node_mem_map-__init-rather-than-__ref.patch
mm-remove-pfn_valid_within-and-config_holes_in_zone.patch
mm-remove-redundant-compound_head-calling.patch
mm-report-a-more-useful-address-for-reclaim-acquisition.patch
mm-rmap-convert-from-atomic_t-to-refcount_t-on-anon_vma-refcount.patch
mm-slub-convert-kmem_cpu_slab-protection-to-local_lock.patch
mm-slub-optionally-save-restore-irqs-in-slab_lock.patch
mm-slub-use-migrate_disable-on-preempt_rt.patch
mm-track-present-early-pages-per-zone.patch
mm-use-in_task-in-mm-page_allocc.patch
mm-workingset-correct-kernel-doc-notations.patch
mm.patch
origin.patch
proc-stop-using-seq_get_buf-in-proc_task_name.patch
shmem-use-raw_spinlock_t-for-stat_lock.patch
trap-cleanup-trap_init.patch

summary: 10 drop, 42 add, 44 modified
```


[PATCH v4 00/11] Multigenerational LRU Framework (Yu Zhao)
----------------------------------------------------------

https://lkml.kernel.org/r/20210818063107.2696454-1-yuzhao@google.com

The fourth version of the multi-gen LRU.  Unclear what's the difference from
v3, though.


mmotm 2021-08-19-22-10 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210820051045.l7RIfLz4C%akpm@linux-foundation.org

mm of the moment queue updated.  0 patches dropped, 34 patches added, and 31
patches modified.

```
Added
-----

checkpatch-add-__alloc_size-to-known-attribute.patch
compiler-attributes-add-__alloc_size-for-better-bounds-checking.patch
doc-hwpoison-correct-the-support-for-hugepage.patch
huge-tmpfs-decide-statst_blksize-by-shmem_is_huge.patch
huge-tmpfs-fix-fallocatevanilla-advance-over-huge-pages.patch
huge-tmpfs-fix-split_huge_page-after-falloc_fl_keep_size.patch
huge-tmpfs-move-shmem_huge_enabled-upwards.patch
huge-tmpfs-remove-shrinklist-addition-from-shmem_setattr.patch
huge-tmpfs-revert-shmems-use-of-transhuge_vma_enabled.patch
huge-tmpfs-sgp_noalloc-to-stop-collapse_file-on-race.patch
huge-tmpfs-shmem_is_hugevma-inode-index.patch
hugetlb-dont-pass-page-cache-pages-to-restore_reserve_on_error.patch
ia64-fix-typo-in-a-comment.patch
kfence-fix-is_kfence_address-for-addresses-below-kfence_pool_size.patch
maintainers-update-clangbuiltlinux-irc-chat.patch
mm-bootmem_info-mark-__init-on-register_page_bootmem_info_section.patch
mm-hwpoison-dont-drop-slab-caches-for-offlining-non-lru-page.patch
mm-hwpoison-dump-page-for-unhandlable-page.patch
mm-hwpoison-retry-with-shake_page-for-unhandlable-pages.patch
mm-introduce-pageflags_mask-to-replace-1ul-nr_pageflags-1.patch
mm-memcontrol-fix-occasional-ooms-due-to-proportional-memorylow-reclaim.patch
mm-page_alloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
mm-remove-bogus-vm_bug_on.patch
mm-slub-convert-kmem_cpu_slab-protection-to-local_lock-fix-2.patch
mm-slub-convert-kmem_cpu_slab-protection-to-local_lock-fix.patch
mm-vmscan-fix-missing-psi-annotation-for-node_reclaim.patch
mm-vmscan-guarantee-drop_slab_node-termination.patch
ocfs2-quota_local-fix-possible-uninitialized-variable-access-in-ocfs2_local_read_info.patch
percpu-add-__alloc_size-attributes-for-better-bounds-checking.patch
remap_file_pages-use-vma_lookup-instead-of-find_vma.patch
shmem-shmem_writepage-split-unlikely-i915-thp.patch
slab-add-__alloc_size-attributes-for-better-bounds-checking.patch
slab-clean-up-function-declarations.patch
vsprintf-rework-bitmap_list_string-fix.patch

Modified
--------

info-task-hung-in-generic_file_write_iter.patch
init-mainc-silence-some-wunused-parameter-warnings.patch
init-move-usermodehelper_enable-to-populate_rootfs.patch
kconfigdebug-drop-selecting-non-existing-hardlockup_detector_arch.patch
lib-test-convert-test_sortc-to-use-kunit.patch
linux-next-rejects.patch
linux-next.patch
math-rational_kunit_test-should-depend-on-rational-instead-of-selecting-it.patch
mm-idle_page_tracking-make-pg_idle-reusable.patch
mm-migrate-enable-returning-precise-migrate_pages-success-count.patch
mm-slub-call-deactivate_slab-without-disabling-irqs.patch
mm-slub-check-new-pages-with-restored-irqs.patch
mm-slub-convert-kmem_cpu_slab-protection-to-local_lock.patch
mm-slub-do-initial-checks-in-___slab_alloc-with-irqs-enabled.patch
mm-slub-move-disabling-irqs-closer-to-get_partial-in-___slab_alloc.patch
mm-slub-move-flush_cpu_slab-invocations-__free_slab-invocations-out-of-irq-context-fix-2.patch
mm-slub-move-flush_cpu_slab-invocations-__free_slab-invocations-out-of-irq-context-fix.patch
mm-slub-move-reset-of-c-page-and-freelist-out-of-deactivate_slab.patch
mm-slub-optionally-save-restore-irqs-in-slab_lock.patch
mm-slub-restore-irqs-around-calling-new_slab.patch
mm-slub-stop-disabling-irqs-around-get_partial.patch
mm-slub-validate-slab-from-partial-list-or-page-allocator-before-making-it-cpu-slab.patch
mmflagsh-add-missing-__gfp_zerotags-and-__gfp_skip_kasan_poison-names.patch
origin.patch
selftests-vm-add-cow-time-test-for-ksm-pages.patch
selftests-vm-add-ksm-merge-test.patch
selftests-vm-add-ksm-merging-across-nodes-test.patch
selftests-vm-add-ksm-merging-time-test.patch
selftests-vm-add-ksm-unmerge-test.patch
selftests-vm-add-ksm-zero-page-merging-test.patch
trap-cleanup-trap_init.patch

summary: 0 drop, 34 add, 31 modified
```


[REMINDER] LSF/MM/BPF: 2021: Cancellation announcement (Josef Bacik)
--------------------------------------------------------------------

https://lkml.kernel.org/r/611ff5df.1c69fb81.43234.a478@mx.google.com

Unfortunately, LSF/MM/BPF for 2021 has canceled due to the COVID19 infection.
So sad, but hopefully this could be continued in 2022!


Linux 5.14-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgZ_W7ZF84Mtq6KRjF4FEoYh14dnw+Oc0avZz_6WrCkfw@mail.gmail.com

No strange things happened last week, so seventh rc is normal.  Unless we find
something special this week, we will show 5.14 next week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc7..v5.14-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-08-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc7-only.png)
