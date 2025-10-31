---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-09-28T07:31:38+02:00
lastmod: 2021-09-28T07:31:38+02:00
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

[RFC PATCH 0/8] mm/madvise: support process_madvise(MADV_DONTNEED) (Nadav Amit)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210926161259.238054-1-namit@vmware.com

This patchset makes `process_madvise()` to support `MADV_DONTNEED` hint.


mmotm 2021-09-28-19-05 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210929020604.DyNimbxao%akpm@linux-foundation.org

The mm-of-the-moment snapshot has been updated.  13 drop, 45 add, 37 modified.
184 patches in the broken/ in total.


[PATCH 1/2] memcg: flush stats only if updated (Shakeel Butt)
-------------------------------------------------------------

https://lkml.kernel.org/r/20210930044711.2892660-1-shakeelb@google.com

This patchset makes memcg stats updated only when needed, as it is currently
flushed on every refault and reclaim iteration.  For reading 8 GiB tmpfs file
on zram-based swap device configured system, 63% of read time has reduced.


[RFC] mm: Optimise `put_pages_list()` (Matthew Wilcox)
------------------------------------------------------

https://lkml.kernel.org/r/20210930163258.3114404-1-willy@infradead.org

This RFC optimizes `put_pages_list()` by doing the operations in batch.
Nevertheless, this is RFC mainly because the author didn't evaluated the
performance.


mmotm 2021-09-30-19-36 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211001023703.54h-iZdWT%akpm@linux-foundation.org

New mmotm is uploaded.  No patch dropped, 39 new patches added, 8 patches
modified.  223 patches in total.


[PATCH 0/7] Implement Data Access Monitoring-based Memory Operation Schemes (SeongJae Park)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211001125604.29660-1-sj@kernel.org

The DAMOS patchset has dropped its RFC tag, as DAMON has merged.  This patchset
allows users to manage their memory based on the real data access patterns.
The patchset has quickly merged in -mm tree
(https://lore.kernel.org/mm-commits/20211001233339.SV5JeiSqb%25akpm@linux-foundation.org/).


Linux 5.15-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wifo=ocAVFtoutuLQvqYyNz1r014uJD8TRPJKpVaPLrRQ@mail.gmail.com

There were hiccups due to the `-Werror` at the beginning of the v5.15
stabiliziation, but now seems it all stabled.  Normal rc4 release.  In this
release `set_fs()` has removed from `m68k`.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc3..v5.15-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-10-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v5.15-rc4-only.png)
