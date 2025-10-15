---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-02-09T07:18:37+01:00
lastmod: 2021-02-09T07:18:37+01:00
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

[PATCH v2] mm: cma: support sysfs (Minchan Kim)
-----------------------------------------------

https://lkml.kernel.org/r/20210208180142.2765456-1-minchan@kernel.org

This patch introduces sysfs interface for CMA that shows stats including number
of CMA allocation attempts and failures.


[PATCH v10 00/14] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20210211162427.618913-1-pasha.tatashin@soleen.com

The 10th version of the patchset making `ZONE_MOVABLE` really movable.


Linux 5.11 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wg8LpRi9+P2_V+ehJ2_EoJifNh2QmVf47aLXfkCd-1UAQ@mail.gmail.com

Nothing strange happened last week, so Linus released v5.11 as expected.  The
number of changes from the rc7 to this release is actually even smaller than
average.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc8..v5.11.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-02-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
