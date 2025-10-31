---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-10-18T07:57:23-07:00
lastmod: 2022-10-18T07:57:23-07:00
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

[RFC PATCH] mm: Introduce new MADV_NOMOVABLE behavior (Baolin Wang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/bc27af32b0418ed1138a1c3a41e46f54559025a5.1665991453.git.baolin.wang@linux.alibaba.com

This RFC patch introduces a new `madvise()` hint called `MADV_NOMOVABLE` for
long-term pinning of memory.


[PATCH 0/4] Add MADV_COLLAPSE documentation (Zach O'Keefe)
----------------------------------------------------------

https://lkml.kernel.org/r/20221017175523.2048887-1-zokeefe@google.com

This patchset adds documentation of `MADV_COLLAPSE`, which is a new `madvise()`
hint that merged in v6.1.


[PATCH v4 0/3] THP Shrinker (Alexander Zhu)
-------------------------------------------

https://lkml.kernel.org/r/cover.1666150565.git.alexlzhu@fb.com

Alexander posted the fourth version of THP shrinker, which aims to reduce the
THP memory inefficiency due to the THP internal fragmentation.


[PATCH v3 0/9] mm: introduce Designated Movable Blocks (Doug Berger)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20221020215318.4193269-1-opendmb@gmail.com

The monotonic zones layout avoids flexible movable pages layout on some systems
having multiple memory controllers.  This patchset introduces designated memory
blocks that ca help mitigating the situation.


Linux 6.1-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com

Second release candidate of Linux v6.1 has released.  Mainly due to a late pull
request for media tree, this release is unusually big.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc3..v6.0-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-08-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.0-rc2-only.png)
