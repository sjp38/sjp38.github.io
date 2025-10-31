---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-01-06T07:20:18+01:00
lastmod: 2021-01-06T07:20:18+01:00
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

[PATCH] mm: vmscan: support complete shrinker reclaim (Sudarshan Rajagopalan)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/2d1f1dbb7e018ad02a9e7af36a8c86397a1598a7.1609892546.git.sudaraja@codeaurora.org

This patch makes caches can dropped even when those are smaller than the batch
size.


[PATCH 0/6] hugetlbfs: support free page reporting (Liang Li)
-------------------------------------------------------------

https://lkml.kernel.org/r/20210106034623.GA1128@open-light-1.localdomain

Because hugetlbfs is using reserved memory, it's not reported by the free page
reporting feature.  This patch makes it able to be reported.


Linux 5.11-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wizR7--Ub-rasYx2S5XURkooCQ63Sat23BpvTAuN0scQA@mail.gmail.com

The prediction of Linus for this release was wrong.  He thought this week would
be calm as people are coming back from their vacations, and it was calm at the
beginning of the week.  However, it finished as a big release.  Unless some
weird issue comes out, there will be no extra week for v5.11.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc3..v5.11-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-01-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc3-only.png)
