---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-02-16T07:17:38+01:00
lastmod: 2021-02-16T07:17:38+01:00
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

[PATCH v11 00/14] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20210215161349.246722-1-pasha.tatashin@soleen.com

The 11th version of the patchset making `ZONE_MOVABLE` really movable.  In this
version, a build error on i386 is fixed.


[RFC PATCH] mm, oom: introduce vm.sacrifice_hugepage_on_oom
-----------------------------------------------------------

https://lkml.kernel.org/r/20210216030713.79101-1-eiichi.tsukata@nutanix.com

This RFC patch introduces yet another sysctl knob called
`vm.sacrifice_hugepage_on_oom`.  When it is turned on, it tries to free
available hugepages before waking oom-killer up.


[RFC] Hugepage collapse in process context (David Rientjes)
-----------------------------------------------------------

https://lkml.kernel.org/r/d098c392-273a-36a4-1a29-59731cdf5d3d@google.com

When a THP request via `madvise()` is made, the system call only mark the
memory region as a candidate of the promotion but does not do the promotion
synchronously.  The THP daemon, khugepaged, scans virtual address spaces and
collapse regular pages of such regions to huge pages transparently.  However,
because the scanning works very slowly (at most 4096 pages every 10 seconds) to
not consume CPU resource too much, it doesn't show immediate effect to
short-living workloads.  My DAMOS-based efficient THP implementation also
showed this problem before.

In this mail, David is proposing making a synchronous compaction can be
requested from process context, via `madvise_process()` like system call.


[PATCH RFC] mm/madvise: introduce MADV_POPULATE to prefault/prealloc memory (David Hildenbrand)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210217154844.12392-1-david@redhat.com

Dynamic populactions and discards of memory is required in user space when it
needs to do sparse memory mappings management.  Hypervisors are the good
example.  Though the discardings are available using `MADV_DONTNEED` and
`FALLOC_FL_PUNCH_HOLE`, there is no appropriate way to do the pre-population.
`mmap()` with `MAP_POPULATE` might be used, but it is not applicable for the
dynamic remappings.  This patch introduces `MADV_POPULATE` for the purpose.


[PATCH] mm: vmstat: add cma statistics (Minchan Kim)
----------------------------------------------------

https://lkml.kernel.org/r/20210217170025.512704-1-minchan@kernel.org

This patch adds CMA statistics in vmstat, so people can more easily understand
how aggressively CMA is used and how much allocations fail.


Re: 5.10 LTS Kernel: 2 or 6 years? (Grep Korah-Hartman)
-------------------------------------------------------

https://lkml.kernel.org/r/YC+AEcuXhPXXtmRB@kroah.com

Greg told he wants to officially support v5.10.y for more than 2 years (maybe 6
years) if some company comes up and continuously use and support the versions.
Hanjun Guo from Huawei came up and told Huawei will support it by using the
kernel in their product, run tests continuously, and provide backporting of
upstream fixes.  Greg welcomes the reaction.  So v5.10.y might be officially
supported 6 years soon.


[PATCH v6 1/1] mm/page_alloc.c: refactor initialization of struct page for holes in memory layout (Mike Rapoport)
-----------------------------------------------------------------------------------------------------------------

In case of real memory bank is not a multiple of `SECTION_SIZE` or the
architecture does not register memory holes reserved by the firmware as
`memblock.memory`, there could be `struct page`s that are not backed by real
physical memory.

Those had proper links to proper zone and node before, but after commit
73a6e474cb37, it doesn't.  This patch makes those to have proper links to zone
and node again.


[PATCH v3 0/2] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210222135137.25717-1-osalvador@suse.de

This is third version of the patchset making CMA to be usable for HugeTLB.
Non-minor changes are mande from v2.


[RFC PATCH v3 00/49] 1GB PUD THP support on x86_64 (Zi Yan)
-----------------------------------------------------------

https://lkml.kernel.org/r/20210224223536.803765-1-zi.yan@sent.com

This RFC is for 1GB THP support on `x86_64`.  Nevertheless, Zi Yan posted only
the cover letter to discuss about his two concerns first.  The first concern is
how to allocate the 1GB memory.  Current implementation uses CMA.  This means
someone could wrongly tune the kernel so that too large or too small CMA area
could be configured.  Second concern is the large amount of code.  He tried to
make the code as small as possible for convenient review, but failed and
looking for a better way.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210225171452.713967e96554bb6a53e44a19@linux-foundation.org

The (maybe last) `mm` pull request for v5.12.  This includes the kfence
patchset and it merged in the mainline.


Linux 5.12-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjUzNbTuRCAv80vyD1dXEEaefdpRi23J+suSaognBoV8A@mail.gmail.com

After the two weeks of merge window, the first release candidate of v5.12 Linux
kernel is released.  Torvalds note that this release is partly small and he
suspects this is partly due to the electricity problem in Portland area.  As a
result, he even considered extending the merge window, but he didn't at the end
of the day.  Instead, he is now saying he could be more flexible about late
pull requests, though he still asks the maintainers to explain what was the
problem.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc1..v5.12-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc1-only.png)
