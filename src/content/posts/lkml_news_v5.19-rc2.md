---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-06-07T07:26:24-07:00
lastmod: 2022-06-07T07:26:24-07:00
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

[PATCH v3 0/6] introduce mirrored memory support for arm64 (Wupeng Ma)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20220607093805.1354256-1-mawupeng1@huawei.com

This patchset adds memory mirroring support, which relies on UEFI and used to
separate memory into two separate channels, to arm64.


[PATCH] mm: mempolicy: N:M interleave policy for tiered memory nodes (Johannes Weiner)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220607171949.85796-1-hannes@cmpxchg.org

Current pages NUMA-interleaving policy is 1:1 mapping, 1 for CPU node, 1 for
remote note.  As more types of tiered memory systems having CPU-less memory
nodes are coming, this patchset introduces an N:M interleave policy, which N
pages are allocated from the top-tier node while M pages are allocated from
low-tier nodes.


[PATCH v2] mm/vmscan: don't try to reclaim freed folios (Miaohe Lin)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20220608141432.23258-1-linmiaohe@huawei.com

This patchset avoids reclaiming already freed folios for saving CPU cycles and
disk I/O.


[PATCH v6 00/13] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20220610135006.182507-1-aneesh.kumar@linux.ibm.com

Sixth version of the patchset for improving memory tier hierarchy
construction's flexibility.  This makes the creation of memory tiers explicit
under the control of the user space or device drivers.


[PATCH 0/2] Introduce CABA helper process tree (Pavel Tikhomirov)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20220610163214.49974-1-ptikhomirov@virtuozzo.com

This patchset adds CABA tree to `task_struct`.  Main usage would be CRIU,
though the author of the patchset says it's not the only usage.


[PATCH v4 0/6] introduce mirrored memory support for arm64 (Wupeng Ma)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20220613082147.183145-1-mawupeng1@huawei.com

Fourth version of the patchset for supporint mirrored memory of arm64.


Linux 5.19-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiLDbZ9ch9vSLxrYBdr-bBujr5sehH_HszWzSah54UiQw@mail.gmail.com

The second release candidate of Linux 5.19 has released.  There is nothing
unusual.  One thing to note is that Torvalds has updated his system and
encountered some issues with gcc update.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc2..v5.19-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-06-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.19-rc2-only.png)
