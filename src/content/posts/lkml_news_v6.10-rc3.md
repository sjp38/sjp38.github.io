---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-06-04T06:36:02-07:00
lastmod: 2024-06-04T06:36:02-07:00
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

[PATCH v2 0/8] mm: workingset reporting (Yuanchu Xie)
-----------------------------------------------------

https://lore.kernel.org/20240604020549.1017540-1-yuanchu@google.com

Yuanchu posted second version of the MGLRU-based workingset reporting patchset.


[PATCH 0/2] mm/pstore: Reserve named unspecified memory across boots (Steven Rostedt)
-------------------------------------------------------------------------------------

https://lore.kernel.org/20240603233330.801075898@goodmis.org

Steven posted a patch for reserving part of memory for pstore, which is
currently being reserved via firmware, via a new kernel command line parameter,
`reserve_mem`.


[PATCH v4 00/11] riscv: Memory Hot(Un)Plug support (Björn Töpel)
----------------------------------------------------------------

https://lore.kernel.org/20240605114100.315918-1-bjorn@kernel.org

Björn posted the fourth version of the patchset for supporting memory
hot-[un]plugging and `ZONE_DEVICE` support on `RISC-V`.


[RFC] ML infrastructure in Linux kernel (Viacheslav Dubeyko)
------------------------------------------------------------

https://lore.kernel.org/20240605110219.7356-1-slava@dubeyko.com

Viacheslav initiates a discussion about unified infrastructure for ML workloads
and user-space drivers.


[PATCH] mm: introduce pmd|pte_need_soft_dirty_wp helpers for softdirty write-protect (Barry Song)
-------------------------------------------------------------------------------------------------

https://lore.kernel.org/20240606034016.82559-1-21cnbao@gmail.com

Barry posted a patch for improving the code readability of soft-dirty pages by
introducing two helpers for determining if write protection is needed, namely
`p{te,md}_need_soft_dirty_wp`.


[PATCH v13] mm: report per-page metadata information (Sourav Panda)
-------------------------------------------------------------------

https://lore.kernel.org/20240605222751.1406125-1-souravpanda@google.com

Sourav posted the 13th version of the patch for reporting per-page metadata
infomration.


[PATCH 6.6.y] mm: ratelimit stat flush from workingset shrinker (Jesper Dangaard Brouer)
----------------------------------------------------------------------------------------

https://lore.kernel.org/171776806121.384105.7980809581420394573.stgit@firesoul

Jesper is asking this Shakeel's patch to be merged in 6.6.y to resolve a
regression from Linux v6.6.


Unifying page table walkers (Matthew Wilcox)
--------------------------------------------

https://lore.kernel.org/ZmIAAjiO4AEd8-Jb@casper.infradead.org

Matthew shares his idea on unifying page table walkers for THP and hugetlb and
asking more opinions.


[PATCH] x86: add 'runtime constant' infrastructure (Linus Torvalds)
-------------------------------------------------------------------

https://lore.kernel.org/20240608193504.429644-2-torvalds@linux-foundation.org

Linus Torvalds posted a patch for implementing runtime constant infrastructure
on x86.


Linus 6.10-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiK75SY+r3W5hx+Tt_bjhcSKPLdji-Zf_8HjikRPbn9wg@mail.gmail.com

After the week of 6.10-rc2, Linus Torvalds released the third release candidate
of Linux v6.10.  He says the last week was normal and the water is warm, and
asks people to test.
