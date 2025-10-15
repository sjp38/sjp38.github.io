---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-10-10T06:40:48-07:00
lastmod: 2023-10-10T06:40:48-07:00
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

[RFC PATCH 0/5] hot page swap to zram, cold page swap to swapfile directly (Lincheng Yang)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231008095924.1165106-1-lincheng.yang@transsion.com

The team has made the kernel feature that swaps hot page to zram and cold pages
to swapfile, directly.  It aims to reduce zram compression/decompression
overhead under memory pressure on Android v4.19 linux kernel, and trying to
make it upstreamed due to the GKI limitation.


[RFC PATCH] zswap: add `writeback_time_threshold` interface to shrink zswap pool (Zhongkun He)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231011051117.2289518-1-hezhongkun.hzk@bytedance.com

A patch for giving users a knob to proactively shrink swap pool, namely
writeback time threshold, has sent.  The purpose is to avoid zswap's memory
waste due to it's non-awareness of access pattern of the objects.


[RFC PATCH v1 0/2] Swap-out small-sized THP without splitting (Ryan Roberts)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231010142111.3997780-1-ryan.roberts@arm.com

Small-sized THP is an upcoming feature for THP that smaller than the
traditional PMD-sized THP.  This RFC patch is for applying the swapout of THP
without split to it as the PMD-sized THP does.


[RFC PATCH v2 0/3] mm: mempolicy: Multi-tier weighted interleaving (Gregory Price)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231009204259.875232-1-gregory.price@memverge.com

This is revisiting of an RFC for tiered memory aware mempolicy improvement,
which authored by Ravi Shankar originally.  This version is collaborated with
the original author.


[RFC PATCH 1/1] mm: only use old generation and stable tier for madv_pageout (Zhaoyang Huang)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231013113028.2720996-1-zhaoyang.huang@unisoc.com

This RFC patch make `MADV_PAGEOUT` to skip paging hot pages or pages in stable
tier.


Linux 6.6-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whRt+O3rYh+0CxR7AbZVrEFgfTLubR9fLVxRpe9GGvB8g@mail.gmail.com

Things continue looking calm and normal.  Torvalds also shares a musical video
documentary (https://www.youtube.com/watch?v=WxnN05vOuSM).  Torvalds again says
everything goes normal, so we would have v6.6 as expected, after two weeks.
Torvalds says that's not ideal for him since he will have the v6.7 merge window
while he's off for vacation travel, but seems he will not delay v6.6 for the
reason.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc7..v6.6-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-10-16 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.6-rc6-only.png)
