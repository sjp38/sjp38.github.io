---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-09-27T08:35:53-07:00
lastmod: 2022-09-27T08:35:53-07:00
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

[GIT PULL] hotfixes for 6.0[-rc8] (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20220926123721.2a1edc734b4fc516a9a350b8@linux-foundation.org

Andrew's mm hotfix patches pull request for Linux v6.0, or v6.0-rc8 has posted.


[RFC PATCH] mm: sort kmemleak object via backtrace (Zhaoyang Huang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/1664264570-3716-1-git-send-email-zhaoyang.huang@unisoc.com

This RFC patch introduces a set of method to sort objects in kmemleak output by
backtrace to make the report more easy to read.


[PATCH 0/3] THP Shrinker (Alexander Zhu)
----------------------------------------

https://lkml.kernel.org/r/cover.1664347167.git.alexlzhu@fb.com

This patchset introduces a sysfs files for measuring THP utilization and a
shrinker for splitting the under-utilized THPs.


[PATCH v2 0/9] mm: introduce Designated Movable Blocks (Doug Berger)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20220928223301.375229-1-opendmb@gmail.com

This patchset allows a block of memory to be designated as part of the
`ZONE_MOVABLE` zone, unlike the monotonic layout of zones in the current
kernel.


[GIT PULL] hotfixes for 6.0 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20220930185257.d02c928a322dfa727bed4cb3@linux-foundation.org

Andrew posted yet another hotfixes for Linux v6.0, and it has immediately
merged.


Linux 6.0 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wiaGf66EQOq1FwM6p9c3mGOjzm9stGeUTfC5Txx4yoxgg@mail.gmail.com

As expected, Linux v6.0 has released.  It means nothing but only long time has
passed since v5.0 release.  Nevertheless, this is one of the bigger than usual
release in terms of the number of commits.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9..v6.0.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-10-03 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
