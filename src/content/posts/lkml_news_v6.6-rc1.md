---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-08-28T06:47:38-07:00
lastmod: 2023-08-28T06:47:38-07:00
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

[GIT PULL] MM updates for 6.6-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20230828184251.bfbc164280503903eacf498c@linux-foundation.org

Andrew sent the mm subsystem pull request for v6.6-rc1 to Linus Torvalds.  And,
it pulled.


[PATCH 1/2] mm/vmalloc: Add a safer version of find_vm_area() for debug (Joel Fernendes)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230830110402.386898-1-joel@joelfernandes.org

A patchset implementing safe trylock version of vmalloc dump function.


[PATCH v2 0/6] Introduce `__mt_dup()` to improve the performance of fork() (Peng Zhang)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230830125654.21257-1-zhangpeng.00@bytedance.com

When doing `fork()`, vma of the parent should be inserted into the maple tree
of the child.  It is done one by one, doing rebalancing of the maple tree
multiple times.  Since maple tree's rebalancing is slower than red-black tree,
this could show performance issue.  This patch introduces a new maple tree
function for handling this case.


[PATCH 0/2] zram: support for specific numa node for zram (Ze Zuo)
------------------------------------------------------------------

https://lkml.kernel.org/r/20230901071942.207010-1-zuoze1@huawei.com

This patch makes zram to be able to use memory in a specific numa node.


[PATCH] mm/khugepaged: make reserved memory adaptivel (wolfgang huang)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20230902052611.144972-1-wolfgang9277@126.com

This patchset makes THP reserved memory to be adaptable to reduce memory usage
from it when THP is not much used.


[PATCH v6 0/7] Optimize mremap during mutual alignment within PMD (Joel Fernandes)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230903151328.2981432-1-joel@joelfernandes.org

Joel posted hopefully final version of his mremap optimization patch.  Only
second and sixth patches of the patchset needs more tags.


[GIT PULL] remaining MM updates for 6.6-rc1 (Andrew Morton)
-----------------------------------------------------------

https://lkml.kernel.org/r/20230904140819.b49a4ff6366047ddcb2d9b1f@linux-foundation.org

Andrew sent yet another small mm subsystem pull request to Linus.


[GIT PULL] hotfixes for 6.6-rc1 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230905115619.0df37e92cd7384252d1aa4ee@linux-foundation.org

Andrew sent some mm hotfixes for 6.6-rc1.


[Invitation] Linux MM Alignment Session on Large Anon Folios on Wednesday (David Rientjes)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAE-26VACpgBHVwD+e3a9-ZOqew7eYbnqLAQU+AHR00Q-0A+6BQ@mail.gmail.com

David has hosted yet another Linux MM alignment session for Large Anon Folios.


[PATCH] zswap: change zswap's default allocator to zsmalloc (Nhat Pham)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230908235115.2943486-1-nphamcs@gmail.com

Zswap supports three different allocators including zsmalloc.  This patch
argues zsmalloc is the superior in terms of utilization and makes zswap to use
it by default.


[PATCH 0/7] riscv: ASID-related and UP-related TLB flush enhancements (Samuel Holland)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230909201727.10909-1-samuel@sholland.org

This patch resolves the prolblem that TLB flushing functions are mostly end up
as `flush_tlb_all()` when SMP is disabled.


[PATCH] mm: memcg: add THP swap out info for anonymous reclaim (Xin Hao)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20230909155242.22767-1-vernhao@tencent.com

This patch adds THP swap out per memcg counter.


Linux 6.6-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgfL1rwyvELk2VwJTtiLNpwxTFeFtStLeAQ-2rTRd34eQ@mail.gmail.com

After the two weeks of the merge window, Linus Torvalds released the first
release candidate for Linux v6.6.  It contains 12k+ commits from 1.7k+
developers.  All the stats are normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc2..v6.6-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-09-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.6-rc1-only.png)
