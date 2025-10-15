---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-03-23T07:11:57+01:00
lastmod: 2021-03-23T07:11:57+01:00
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

[PATCH 0/3 v5] Introduce a bulk order-0 page allocator (Mel Gorman)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20210322091845.16437-1-mgorman@techsingularity.net

Fifth version of the order-0 pages bulk allocator.  In this version, the API
users are dropped from the patchset, because the callers are not confirmed if
they prefer an array or list interface.


[PATCH] mm: cma: add trace events for CMA alloc perf testing (Georgi Djakov)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210324160740.15901-1-georgi.djakov@linaro.org

This patch adds tracepoints for CMA and page migrations.  Those aims to be used
for performance debugging of CMA.


[PATCH 0/4] mm/page_reporting: Some knobs and fixes (Xunlei Pang)
-----------------------------------------------------------------

https://lkml.kernel.org/r/1616751898-58393-1-git-send-email-xlpang@linux.alibaba.com

This commit adds some counters for debugging and fix of a problem in the page
reporting feature.


Linux 5.12-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg89U6PLp1AGhaqUx4KAZtkvKS6kuNmb+zObQhf1jez+g@mail.gmail.com

Unlike previous week's release, rc5 is bigger than average.  It's not hitting
any record, though.  Torvalds says he doesn't overly worrying, but thinking
about rc8.  `io_uring` is pointed out as one of the sources of noises.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc4..v5.12-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc5-only.png)
