---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-03-12T07:03:45-07:00
lastmod: 2024-03-12T07:03:45-07:00
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

[GIT PULL] slab updates for 6.9 (Vlastimil Babka)
-------------------------------------------------

https://lkml.kernel.org/r/c021631d-29e5-432f-bfcd-1d75ec28d065@suse.cz

Vlastimil sent the slab pull request for 6.9 to Linus Torvalds.


[PATCH v4 0/6] Swap-out mTHP without splitting (Ryan Roberts)
-------------------------------------------------------------

https://lkml.kernel.org/r/20240311150058.1122862-1-ryan.roberts@arm.com

Ryan sent the fourth version of the patchset to swap-out multi-sized THP
without splitting first.  The approach is similar to that for PMD-sized THP.


[PATCH] vmstat: Keep count of the maximum page reached by the kernel stack (Pasha Tatashin)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240313033417.447216-1-pasha.tatashin@soleen.com

Pasha sent a patch for extending `CONFIG_DEBUG_STACK_USAGE` to provide the
count of actual uses of each kernel stack pages.


[GIT PULL] MM updates for 6.9-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20240313200532.34e4cff216acd3db8def4637@linux-foundation.org

Andrew sent the memory mangement subsystem pull request for v6.9-rc1 to Linus
Torvalds.  Interesting changes for zswap, DAMON, huge pages, vmalloc lock
scalability, and heterogeneous memory are there.  The list of patch series in
the pull request are, to my humbel script,

```
mm-stable: 456 patches
    Patch series "mm/damon: fix quota status loss due to online tunings".
    Patch series "implement "memmap on memory" feature on s390".
    Patch series "Convert memcontrol charge moving to use folios".
    Patch series "mm: convert mm counter to take a folio", v3.
    Patch series "mm/zswap: optimize the scalability of zswap rb-tree", v2.
    Patch series "mm: zswap: simplify zswap_swapoff()", v2.
    Patch series "Add DAX ABI for memmap_on_memory", v7.
    Patch series "mm: zswap: cleanups".
    Patch series "mm/damon: make DAMON debugfs interface deprecation
    Patch series "mm/mempolicy: weighted interleave mempolicy and sysfs
    Patch series "mm: ptdump: Refactor CONFIG_DEBUG_WX and check_wx_pages
    Patch series "test_xarray: advanced API multi-index tests", v2.
    Patch series "conform tests to TAP format output", v2.
    Patch series "mm/memory: optimize fork() with PTE-mapped THP", v3.
    Patch series "mm/hugetlb: Restore the reservation", v2.
    Patch series "mm/zswap: optimize zswap lru list", v2.
    Patch series "selftests/damon: add more tests for core functionalities and
    Patch series "selftests/mm: Output cleanups for the compaction test".
    Patch series "mm/mglru: code cleanup and refactoring"
    Patch series "fix and extend zswap kselftests", v3.
    Patch series "mm/memory: optimize unmap/zap with PTE-mapped THP", v3.
    Patch series "Transparent Contiguous PTEs for User Mappings", v6.
    Patch series "Introduce cpu_dcache_is_aliasing() to fix DAX regression",
    Patch series "per-vma locks in userfaultfd", v7.
    Patch series "Docs/mm/damon: misc readability improvements".
    Patch series "page_owner: print stacks and their outstanding allocations",
    Patch series "Mitigate a vmap lock contention", v3.
    Patch series "Split crash out from kexec and clean up related config
    Patch series "mm/damon: let DAMOS feeds and tame/auto-tune itself".
    Patch series "mm/zsmalloc: fix and optimize objects/page migration".
    Patch series "mm/zsmalloc: some cleanup for get/set_zspage_mapping()".
    Patch series "Enable >0 order folio memory compaction", v7.
    Patch series "convert write_cache_pages() to an iterator", v8.
    Patch series "mm/zswap: optimize for dynamic zswap_pools", v3.
    Patch series "Handle hugetlb faults under the VMA lock", v2.
    Patch series "selftests/damon: misc fixes".
    Patch series "Address some contpte nits".
    Patch series "Split a folio to any lower order folios", v5.
    Patch series "mm: remove total_mapcount()", v2.
    Patch series "Rearrange batched folio freeing", v3.
    Patch series "hugetlb: parallelize hugetlb page init on boot", v6.
    Patch series "PageFlags cleanups".
    Patch series "minor fixes and supplement for ptdesc".
    Patch series "mm/treewide: Replace pXd_large() with pXd_leaf()", v3.
    Patch series "page_owner: Fixup and cleanup".
    Patch series "selftests/mm: Improve Hugepage Test Handling in MM
```

[RFC] mm/vmstat: add a single value debugfs fragmentation metric (Luis Chamberlain)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240314005710.2964798-1-mcgrof@kernel.org

Luis posted an RFC patchset for exposing external fragmentation index per node
and per zone, per supported order via debugfs.


[RFC PATCH v2] mm: support multi-size THP numa balancing (Baolin Wang)
----------------------------------------------------------------------

https://lkml.kernel.org/r/903bf13fc3e68b8dc1f256570d78b55b2dd9c96f.1710493587.git.baolin.wang@linux.alibaba.com

Baolin sent the second version of the RFC patch for exclusive mTHP NUMA
balancing.


[PATCH] mm: Increase folio batch size (Matthew Wilcox)
------------------------------------------------------

https://lkml.kernel.org/r/20240315140823.2478146-1-willy@infradead.org

Intel reported 4.7% performance regression due to a commit reducing the folio
batch size from 32 to 15.  This patch increases the size from 15 to 31, and it
results in 12.5% performance increase.


[PATCH v2 0/3] mm/damon: Profiling enhancements for DAMON (Aravinda Prasad)
---------------------------------------------------------------------------

Aravianda sent the second version of patchset for improving DAMON profiling by
checking access in PMD level on huge machine.


[PATCH v2 00/14] mm/treewide: Remove pXd_huge() API (Peter Xu)
--------------------------------------------------------------

https://lkml.kernel.org/r/20240318200404.448346-1-peterx@redhat.com

As a continuation of the effort on removing arch-specific APIs like
pXd_large(), this patchset removes pXd_huge() API for hugetlb.


[syzbot] Monthly mm report (Mar 2024) (syzbot)
----------------------------------------------

https://lkml.kernel.org/r/000000000000c7e3a706140a512d@google.com

Syzbot shares the monthly mm subsystem status of syzbot-found issues.  Syzbot
found 8 new issues and 1 among those has fixed this month.


[RFC] A new per-cpu memory allocator for userspace in librseq (Mathieu Desnoyers)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/218bd8f1-d382-4024-a90f-59b5fef5184a@efficios.com

Mathieu proposes a new per-cpu memory allocator for making librseq a generally
usable project.


[PATCH] mm: remove CONFIG_MEMCG_KMEM (Johannes Weiner)
------------------------------------------------------

https://lkml.kernel.org/r/20240320202745.740843-1-hannes@cmpxchg.org

Johannes is replacing CONFIG_MEMCG_KMEM with CONFIG_MEMCG since it has
default-enabled and equivalent to CONFIG_MEMCG for almost a decade.


[PATCH v6 00/37] Memory allocation profiling (Suren Baghdasaryan)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20240321163705.3067592-1-surenb@google.com

Suren posted sixth version of the memory allocation profiling patchset.  And
this version of the patchset has added to the mm tree.


[WIP 0/3] Memory model and atomic API in Rust (Boqun Feng)
----------------------------------------------------------

https://lkml.kernel.org/r/20240322233838.868874-1-boqun.feng@gmail.com

Boqun concludes Rust should use Linux Kernel Memory Model rather than its own
one when it is executed in Linux kernel, and implementing atomic library.


Linux 6.9-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgOw_13JuuX4khpn4K+n09cRG3EBQWufAPBWoa0GLLQ0A@mail.gmail.com

After two weeks of the merge window, Linus Torvalds announced the first release
candidate of Linux 6.9.  He introduces timer rewrites and BH workqueue supports
as the meaningful core updates.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ ~/lazybox/git_helpers/relstat.py --since 2022-01-22 | \
            ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/linux_stat_v6.9-rc1-only.png)
