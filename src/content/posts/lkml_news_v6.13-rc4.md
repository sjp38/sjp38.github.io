---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-12-17T06:49:17-08:00
lastmod: 2024-12-17T06:49:17-08:00
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

[RFC PATCH 00/12] khugepaged: Asynchronous mTHP collapse (Dev Jain)
-------------------------------------------------------------------

https://lore.kernel.org/20241216165105.56185-1-dev.jain@arm.com

Dev Jain posted an RFC patch series that makes khugepaged collapses multi-sized
THP.


[PATCH] mm/page_idle: Constify 'struct bin_attribute' (Thomas Weißschuh)
------------------------------------------------------------------------

https://lore.kernel.org/20241216-sysfs-const-bin_attr-page_idle-v1-1-cc01ecc55196@weissschuh.net

Thomas marks `struct bin_attribute` objects that used in `page_idle` to be
marked as `const`, since it is now supported.


Slow-tier Page Promotion discussion recap and open questions (David Rientjes)
-----------------------------------------------------------------------------

https://lore.kernel.org/6d582bb6-3ba5-1768-92f2-6025340a3cd4@google.com

David shares his summary of the discussions around asynchronous page promotion
approach from AMD that was held on last MM alignment session.


Linux 6.13-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wh+aZScT9-7ON58kfvuZiMdcvGRAWqM=J9BWfYDEOA99w@mail.gmail.com

Linus Torvalds released the fourth candidaste of Linux 6.13, which is bit
smaller than usual.  Torvalds thinks it is due to the holidays, and the
tendency will continue to rc5.
