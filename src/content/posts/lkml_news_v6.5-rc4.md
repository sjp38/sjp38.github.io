---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-07-25T07:06:09-07:00
lastmod: 2023-07-25T07:06:09-07:00
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

[PATCH v5 0/7] Add support for memmap on memory feature on ppc64 (Aneesh Kumar K.V)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230725100212.531277-1-aneesh.kumar@linux.ibm.com

Aneesh continues adding support of `memmap_on_memory` for more architectures.


[PATCH mm-unstable v7 00/31] Split ptdesc from struct page (Vishal Moola)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20230725042051.36691-1-vishal.moola@gmail.com

The seventh revision of the patchset for splitting page table tracking
information out of `struct page` for making it smaller.


[PATCH v3 00/49] use refcount+RCU method to implement lockless slab shrink (Qi Zheng)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230727080502.77895-1-zhengqi.arch@bytedance.com

There was an SRUC-based Slab lockless shrinking approach, but it was reverted
due to a regression under a stress test.  THis patch revisit it using a
refcount plus RCU approach.


[PATCH] Documentation/page_tables: Add info about MMU/TLB and Page Faults (Fabio M. De Francesco)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230728120054.12306-1-fmdefrancesco@gmail.com

This patch extends `page_tables.rst` by adding a section about the role of MMU
and TLB, to better explain the virtual address to physical address translation.


Linux 6.5-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wik9NO9Un-OU0rVeo1+dp=6vj=s=K0T=uBVEa+Aqkj66w@mail.gmail.com

Things continue to be fairly normal, and yet another boring fourth release
candidate is released by Linus Torvalds.  One interesting thing is this rc
release contains exactly 328 non-merge commits, which was same for the rc4 of
6.2, 6.3.  Probably just a coincidence, though.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc5..v6.5-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-07-31 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.5-rc4-only.png)
