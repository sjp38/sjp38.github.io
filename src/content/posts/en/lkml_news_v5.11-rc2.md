---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-01-04T07:20:40+01:00
lastmod: 2021-01-04T07:20:40+01:00
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

Linux 5.11-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whS+rzNMSsU6vRoLMzrm0JPN-OVg+BxhybMet3NpqpR-Q@mail.gmail.com

Due to the holiday season, rc2 ends up fairly small.  Maybe we will see rc8 for
v5.11, but Torvalds just saying let's watch more.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc2..v5.11-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-01-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc2-only.png)
