---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-09-12T06:46:02-07:00
lastmod: 2023-09-12T06:46:02-07:00
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

[syzbot] Monthly mm report (Sep 2023)
-------------------------------------

https://lkml.kernel.org/r/000000000000c06b600605127cb3@google.com

Syzbot posted its mm subsystem report for last 31 days.  For the period, seven
new issues were found and two among those were fixed.  In total, 43/232 issues
are still open.


[PATCH 0/2] workload-specific and memory pressure-driven zswap writeback (Nhat Pham)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230911164024.2541401-1-nphamcs@gmail.com

Zswap has only single LRU list and shrinks under user-defined limit.  This
patch series seperates the LRU list out to per-memcg and per-NUMA, and perform
workload-specific writeback under memory pressure.


[PATCH 0/3] memcg: more sophisticated stats flushing (Yosry Ahmed)
------------------------------------------------------------------

https://lkml.kernel.org/r/20230913073846.1528938-1-yosryahmed@google.com

Current memcg stat flushing works in single flusher, so having good efficiency
but bad accuracy interms of freshness.  This patchset provides a better
tradeoff between the accuracy and the performance.


[PATCH 0/3] userfaultfd remap option (Suren Baghdasaryan)
---------------------------------------------------------

https://lkml.kernel.org/r/20230914152620.2743033-1-surenb@google.com

This patchset introduces a new feature for userfaultfd, namely `UFFDIO_REMAP`,
which was maintained by Andrea in his local tree for long time.


[RFC PATCH 00/14] Prevent cross-cache attacks in the SLUB allocator (Matteo Rizzo)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230915105933.495735-1-matteorizzo@google.com

Cross-cache attack is making SLUB returns the page containing a victim object
to the page allocator and then make it uses the same page for different slab
cache or other objects.  This patchset prevents it by making sure a virtual
address that used for a slab cache isn't reused for anything except other slabs
in that cache.


Linux 6.6-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whW=fV2tnAreSbtPVpJxq++pyBZa3g+cxX8_V__WSZzCg@mail.gmail.com

Exactly after 32 years from the Linux 0.01 release, Linus Torvalds released
v6.6-rc2 of Linux.  Other than the random date thing, nothing special changes
but usual rc2 fixes spareading over.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc3..v6.6-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-09-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.6-rc2-only.png)
