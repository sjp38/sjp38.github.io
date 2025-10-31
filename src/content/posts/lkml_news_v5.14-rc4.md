---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-07-29T17:48:11+02:00
lastmod: 2021-07-29T17:48:11+02:00
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


mmotm 2021-07-28-18-24 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210729012524.S8-WP%akpm@linux-foundation.org

Andrew Morton is updating the -mm tree.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210729145259.24681c326dc3ed18194cf9e5@linux-foundation.org

Seven fixup patches from Andrew Morton.


[PATCH 0/3] mm: optimize thp for reclaim and migration (Yu Zhao)
----------------------------------------------------------------

https://lkml.kernel.org/r/20210731063938.1391602-1-yuzhao@google.com

This patch optimizes THP split for reclaim or migration by dropping subpages
that contain only zeroes.


Linux 5.14-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whv0g5YqoRXc8oxqJX3r+GP1dN3ia_Qg_V6UTjhi8vg8w@mail.gmail.com

After one week, entirely normal rc4 is released.  5.14 is not so far now.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc4..v5.14-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-08-02 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc4-only.png)
