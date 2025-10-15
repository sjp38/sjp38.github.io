---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-11-29T08:00:17-08:00
lastmod: 2022-11-29T08:00:17-08:00
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

[PATCH 1/2] lockdep: allow instrumenting lockdep.c with KMSAN (Alexander Potapenko)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221128094541.2645890-1-glider@google.com

Lockdep and KMSAN are known to work together nowadays, though it could make
kernel run slower.  This patch fixes KMSAN's false positives on
`wq_head->lock->dep_map`.


[PATCH] mm/huge_memory: add TRANSPARENT_HUGEPAGE_NEVER for THP (ye xingchen)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/202211301651462590168@zte.com.cn

This patch adds a new kernel config called `TRANSPARENT_HUGEPAGE_NEVER`, which
will set the value of `/sys/kernel/mm/transparent_hugepage/enabled` `[never]`.


[RFC PATCH v2] mm: Add nodes= arg to memory.reclaim (Mina Almasry)
------------------------------------------------------------------

https://lkml.kernel.org/r/20221130020328.1009347-1-almasrymina@google.com

This RFC patch adds `nodes=` argument to memory cgroup's `memory.reclaim` for
specifying memory node to reclaim.


[RFC] Improving userfaultfd scalability for live migration (James Houghton)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/CADrL8HVDB3u2EOhXHCrAgJNLwHkj2Lka1B_kkNb0dNwiWiAN_Q@mail.gmail.com

James is suggesting some ways for improving userfaultfd performance for
post-copy live migration.


Linux 6.1-rc8 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgyXu4D44b8wQU9dpTYUft6WhZ0wr3nV1fziy6k0GwCCw@mail.gmail.com

As expected, Linus released the eighth release candidate of Linux v6.1.
Fortunately, it started calming down.  If this week is also quiet or even
quieter, we will show Linux 6.1 next Sunday.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10..v6.1-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-12-05 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc8 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.1-rc8-only.png)
