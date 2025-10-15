---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-11-16T07:09:53+01:00
lastmod: 2021-11-16T07:09:53+01:00
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

[PATCH -V10 0/6] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211116013522.140575-1-ying.huang@intel.com

This patchset optimizes the pages placement on tiered memory systems using DRAM
and PMEM.


[RFC 0/3] page table check (Pasha Tatashin)
-------------------------------------------

https://lkml.kernel.org/r/20211116220038.116484-1-pasha.tatashin@soleen.com

Pasha found broken page ref issue in 4.14 kernel.  The page was leaked into
another process, so they were able to find the issue by examining the page
tables.  This patchset tries to prevent this kind of memory corruption issues
by checking the page tables in time of inserting entries into user page tables.


[PATCH] MM: discard `__GFP_ATOMIC` (Neil Brown)
-----------------------------------------------

https://lkml.kernel.org/r/163712397076.13692.4727608274002939094@noble.neil.brown.name

Neil Brown couldn't find real useful case for `__GFP_ATOMIC`.  This patch
removes `__GFP_ATOMIC`, while leaving `GFP_ATOMIC` as is.


[PATCH v6] mm: Add PM_THP_MAPPED to /proc/pid/pagemap (Mina Almasry)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20211117194855.398455-1-almasrymina@google.com

This patch allows users know if a specific virtual address range of a process
is backed by THP or not, by examining the `/proc/pid/pagemap`.


mmotm 2021-11-18-15-47 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211118234743.-bgoWMQfK%akpm@linux-foundation.org

After the v5.16-rc1 release, mmotm has uploaded.  Rebased on v5.16-rc1, added
84 patches, modified 10 patches, and dropped 402 patches.  In total, 117
patches are in the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211119164248.50feee07c5d2cc6cc4addf97@linux-foundation.org

A pull request of 15 patches for fix of various subsystems including DAMON has
sent to Linus Torvalds.


[PATCH] mm: split thp synchronously on MADV_DONTNEED (Shakeel Butt)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20211120201230.920082-1-shakeelb@google.com

Because the kernel defers THP split and release until memory pressure, freeing
memory that backed by THP using `MADV_DONTNEED` is difficiult.  This patch
makes `madvise()` with `MADV_DONTNEED` split THP of the target memory regions
synchronously.


[PATCH v0.9 0/6] sched,mm,x86/uaccess: implement User Managed Concurrency Groups (Peter Oskolkov)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211121212040.8649-1-posk@google.com

This patchset implements user space managed m:n threading subsystem.


[RFC PATCH] mm: Promote slow memory in advance to improve performance (Baolin Wang)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/fc80ea7998a98274447cb3be84d5ef705438a3dc.1637571100.git.baolin.wang@linux.alibaba.com

This patchset makes data in slow memory be promoted into RAM based on the
spatial locality.


Linux 5.16-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgMLMKjQUFoAA+chpZqaLJgpnUHsOJtBzWgFepT_DEwSw@mail.gmail.com

Just a normal rc2 release having no noteworthy things.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc1..v5.16-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc2-only.png)
