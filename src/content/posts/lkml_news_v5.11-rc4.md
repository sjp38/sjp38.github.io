---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-01-12T07:18:48+01:00
lastmod: 2021-01-12T07:18:48+01:00
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

[PATCH] mm: thp: introduce NR_PARTIAL_THPS (Bin Wang)
-----------------------------------------------------

https://lkml.kernel.org/r/20210112021208.1875-1-wangbin224@huawei.com

Because partially unmapped THP is not split, the memory stat becomes confusing.
This patch add another counter called `NR_PARTIAL_THPS` in `node_stat_item` to
reduce such confusions.


[PATCH v2 00/70] RFC mm: Introducing the Maple Tree (Liam R. Howlett)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20210112161240.2024684-1-Liam.Howlett@Oracle.com

Second RFC of the Maple tree.  It is an RCU-safe B-tree that aims to be used as
the vma tree with better scalability.


[PATCH] mm/debug: Improve memcg debugging (Matthew Wilcox)
----------------------------------------------------------

https://lkml.kernel.org/r/20210114190200.1894484-1-willy@infradead.org

This patch modifies ``__dump_page()`` to show memcg information better.


[PATCH v2 0/5] Add sysfs interface to collect reports from debugging tools (Alexander Potapenko)
------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210115130336.2520663-1-glider@google.com

This patch adds a library that can be used for error report from debugging
tools, and make KASAN and KFENCE to use the library for error report.  The
error report can be accessed from the user space via the sysfs.


Linux 5.11-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjGqX0BFV0eH9R=9m2Xezib0w8Ty2zEc6XDJ73zNRPuPQ@mail.gmail.com

The fourth release candidate for v5.11 is out with normal shape.  No big, no
small, just average.  This also includes NVIDIA ampere support.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc4..v5.11-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-01-18 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc4-only.png)
