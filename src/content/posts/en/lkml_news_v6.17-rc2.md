---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.17-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-08-12T07:15:20-07:00
lastmod: 2025-08-12T07:15:20-07:00
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

[PATCH v3 00/11] mm: `vm_normal_page*()` improvements (David Hildenbrand)
-------------------------------------------------------------------------

https://lore.kernel.org/20250811112631.759341-1-david@redhat.com

David posted third version of the patch series for improving
`vm_normal_page*()`.


[RFC PATCH v4 00/28] Cache aware load-balancing (Chen Yu)
---------------------------------------------------------

https://lore.kernel.org/cover.1754712565.git.tim.c.chen@linux.intel.com

Chen Yu posted a patch series for cache-aware scheduping, which was originally
proposed by Pter.


[PATCH 00/10] mm: make mm->flags a bitmap and 64-bit on all arches (Lorenzo Stoakes)
------------------------------------------------------------------------------------

https://lore.kernel.org/cover.1755012943.git.lorenzo.stoakes@oracle.com

Lorenzo posted a patch series for refactoring `mm->flags` for arch-indenpendent
and safe-to-use type.


[PATCH v4 0/7] prctl: extend PR_SET_THP_DISABLE to only provide THPs when advised (Usama Arif)
----------------------------------------------------------------------------------------------

https://lore.kernel.org/20250813135642.1986480-1-usamaarif642@gmail.com

Usama posted the fourth version of the patch series for making per-process
inheritant THP policy.


[RFC PATCH -next 00/16] mm/damon: support ARM32 with LPAE (Quanmin Yan)
-----------------------------------------------------------------------

https://lore.kernel.org/20250813050706.1564229-1-yanquanmin1@huawei.com

Quanmin posted an RFC patch series for supporting DAMON on ARM32 with LPAE.


[RFC PATCH v1 0/7] A subsystem for hot page detection and promotion (Bharata B Rao)
-----------------------------------------------------------------------------------

https://lore.kernel.org/20250814134826.154003-1-bharata@amd.com

Bharata posted RFC v1 for a subsystem that dedicated for hot pages detection
and promotion.


Linux 6.17-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiLHgdvJQkEW-pHcUuXOBJ9JOoKcZkzMaPSW60_-Mh90A@mail.gmail.com

Linus released the second candidate of Linux 6.17.  It is smaller than usual,
though.
