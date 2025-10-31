---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-09-18T08:35:46-07:00
lastmod: 2022-09-18T08:35:46-07:00
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

[PATCH mm-unstable v15 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220918080010.2920238-1-yuzhao@google.com

A new version of MGLRU patchset has posted.  Among the changes in this new
version, fix of long-tailed direct reclaim latency looks interesting.


Linux 6.0-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi=gtuSO8Yz8LDubkMk7TiMsZxpypt9S10jeZRkyaBFnA@mail.gmail.com

The sixth release candidate for Linux v6.0 has out.  Maybe due to the LPC/OSS
EU/Maintainers summit which all were held in last week, this release is quite
small.  Torvalds says it might mean that seventh release will be bigger than
usual and therefore it might need one more week for v6.0 release.  But, let's
see what happens.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc7..v6.0-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-09-19 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.0-rc6-only.png)
