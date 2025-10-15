---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-06-30T06:57:48+02:00
lastmod: 2020-06-30T06:57:48+02:00
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

[Ksummit-discuss] [TECH TOPIC] Inline Encryption Support and new related features (Satya Tangirala)
---------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200629092551.GA673684@google.com

Maybe the last kernel summit proposal.  The inline encryption work was
presented in the last year LPC and a part of it has merged in the v5.8, being
tested in Android.  The talk will discuss the todo list of the work.


[PATCH] mm: define pte_add_end for consistency (Wei Yang)
---------------------------------------------------------

https://lkml.kernel.org/r/20200630031852.45383-1-richard.weiyang@linux.alibaba.com

This patch adds a helper to get the address of the next boundary for pte level.


Linux 5.8-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whaNDpCRkeBGbdTOh84_mqfG7N1qPk8HZXJzbh8TOB_hA@mail.gmail.com

The fourth release candidate for the 5.8 is released.  Unlike the past week,
this week release was smaller than usual.  Maybe due to a fluctuation, or due
to a July 4th in US, Torvalds says.  Anyway, seems not a bad sign.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc5..v5.8-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-06-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc4-only.png)
