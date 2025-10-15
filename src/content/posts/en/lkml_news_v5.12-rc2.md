---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-03-02T07:07:51+01:00
lastmod: 2021-03-02T07:07:51+01:00
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

[PATCH] mm: introduce clear all vm events counters (Pintu Kumar)
----------------------------------------------------------------

https://lkml.kernel.org/r/1614595766-7640-1-git-send-email-pintu@codeaurora.org

Because the vmstat data is only cumulated, users should calculate the diff
manually or just reboot.  This commit adds a procfs file that can be used to
clear all vmstat counters.


[PATCH 0/5] Introduce a bulk order-0 page allocator with two in-tree users (Mel Gorman)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210301161200.18852-1-mgorman@techsingularity.net

This patchset introduces a bulk order-0 page allocator.  It also makes the
sunrpc and the network page pool to use that.  Mel says current implementation
would not particularly efficient, but the performance report shows
improvements.


[PATCH v3 00/14] Introduced multi-preference mempolicy
------------------------------------------------------

https://lkml.kernel.org/r/1614766858-90344-1-git-send-email-feng.tang@intel.com

This patchset introduces a new NUMA memory placement policy called
`MPOL_PREFERRED_MANY`, which can be used for `set_mempolicy()` or `mbind()`
system calls.  It allows users to set preferred NUMA nodes as similar to
`MPOL_PREFERRED`, but it allows multiple nodes, unlike `MPOL_PREFERRED`.


Linux 5.12-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whH-stL2zLCf02HZaOeQgS4oGa7eEiHeYZGj-orK-PX0g@mail.gmail.com

It turned out the v5.12-rc1 has a nasty bug related to swap files and therefore
it removed from the mainline.  Therefore Linus has released the next rc two
days earlier than usual.  The swap file bug is fixed, and also contains more
fixes as usual.  Nothing special except it released earlier than expected.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc2..v5.12-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-06 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc2-only.png)
