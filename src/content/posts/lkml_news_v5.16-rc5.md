---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-12-07T07:25:52+01:00
lastmod: 2021-12-07T07:25:52+01:00
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

[RFC] mm: introduce page pinner (Minchan Kim)
---------------------------------------------

https://lkml.kernel.org/r/20211206184730.858850-1-minchan@kernel.org

Page migrations commonly fails from temporal referenc count elevation.  Worse
yet, it's hard to know which kernel subsystem has made the temporal reference
count increase.  To tracking it available, Minchan is proposing a new feature
called page pinner.  It tracks page put operations for pages that migration
failed.


mmotm 2021-12-06-22-21 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211207062141.pMgbjXQXy%akpm@linux-foundation.org

mmotm based on v5.16-rc4 has uploaded.  14 new patches are added, 3 existign
patches modified, and 1 existing patch has dropped from the queue.  The queue
has 268 patches in total now.


[PATCH -V10 RESEND 0/6] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
--------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211207022757.2523359-1-ying.huang@intel.com

This patchset optimize the page placement on tiered memory system equipping
DRAM with PMEM.


[PATCH v4 1/3] mm: protect free_pgtables with mmap_lock write lock in exit_mmap (Suren Baghdasaryan)
----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211208212211.2860249-1-surenb@google.com

This patchset makes `exit_mmap` to hold `mmap_write_lock` to make locking from
oom-reaper and `process_mlrelease()` simpler.


[PATCH] mm/madvise: pageout under plugging (Minchan Kim)
--------------------------------------------------------

https://lkml.kernel.org/r/20211210003019.1481269-1-minchan@kernel.org

This commit makes `madvise(PAGEOUT)` to have the per-page memory block plugging
benefit (3da367c3e5fc, vmscan: add block plug for page reclaim).


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211210144539.663efee2c80d8450e6180230@linux-foundation.org

A pull request for mm fixes has sent to Linus Torvalds.  It contains DAMON fake
load fix and trivial fixups.


Linux 5.16-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wixe1NPqC0PmgUbV0Xoa8D0Pbyu7X_0sfABYMG+ocLdbQ@mail.gmail.com

Fifth release candidate for v5.16 is a bit bigger than usual, but no real
problem has found.  This might be due to people who trying to do works before
the holidays, and Linus is warning such people.  He also plans to have one more
release candidate for this cycle, to avoid opening merge window immediately in
the new year.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc3..v5.16-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-12-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc5-only.png)
