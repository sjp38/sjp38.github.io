---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-03-07T08:27:55+01:00
lastmod: 2022-03-07T08:27:55+01:00
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

mmotm 2022-03-06-20-33 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220307043435.251DBC340E9@smtp.kernel.org

The -mm tree has updated.  It's based on v5.17-rc6, added 19 patches, modified
6 patches, and dropped 19 patches.  In totla, 428 patches in the queue.


[PATCH v3] mm: add ztree - new allocator for use via zpool API (Ananda)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20220307142724.14519-1-a.badmaev@clicknet.pro

Third version of ztree, which is intended to be used for storing compressed
objects per ztree block.  Comparing to the previous version, compiler warnings
have fixed.


[LSF/MM/BPF BOF idea] CXL BOF discussion (Ira Weiny)
----------------------------------------------------

https://lkml.kernel.org/r/YiZ0Jmhyf515EJzD@iweiny-desk3

Ira is proposing a BPF for CXL.


[RFC PATCH 00/14] mm: userspace hugepage collapse (Zach O'Keefe)
----------------------------------------------------------------

https://lkml.kernel.org/r/20220308213417.1407042-1-zokeefe@google.com

This RFC patchset introduces a mechanism for user space to induce a turanparent
hugepages collapses, for more flexible THP usages.  Both `process_madivse()`
and `madvise()` are used.


[PATCH v9 00/14] Multi-Gen LRU Framework (Yu Zhao)
--------------------------------------------------

https://lkml.kernel.org/r/20220309021230.721028-1-yuzhao@google.com

A new revision of MGLRU patchset.  It removed `CONFIG_NR_LRU_GENS` and
`CONFIG_TIERS_PER_GEN` configs compared to the last version.


[RFC] Free up a page flag (Matthew Wilcox)
------------------------------------------

https://lkml.kernel.org/r/YikTHqjv4S6ZQ3Fv@casper.infradead.org

This RFC patch frees up a page flag for others to use.


mmotm 2022-03-10-21-38 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220311053937.E9658C340E9@smtp.kernel.org

Andrew updated mmotm and pushed.  Compared to the last update, it has rebased
on 5.17-rc7, added 34 new patches, modified 111 patches, and dropped 5 patches.
In total, 457 patches in the queue.


Linux 5.17-rc8 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiHa0vsZseZES=1T0rJ4Z_bC5cwHMUJfqFL9hVpvB283g@mail.gmail.com

Unlike the expectation, Linus Torvalds has released another release candidate.
This is the fourth -rc8 since v5.9-rc8, which was released at 2020-10-04.  This
was due to the embargoed patches for spectre variants, which has not tested
widely enough with variable automation tests which might have untested
combinations.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc7..v5.17-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-03-14 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc8-only.png)
