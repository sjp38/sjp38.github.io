---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-10-08T07:54:17-07:00
lastmod: 2024-10-08T07:54:17-07:00
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

[RFC PATCH v3 0/4] sched+mm: Track lazy active mm existence with hazard pointers (Mathew Desnoyers)
---------------------------------------------------------------------------------------------------

https://lore.kernel.org/20241008135034.1982519-1-mathieu.desnoyers@efficios.com

Mathiew Desnoyers posted the third version of his hazard pointer patch series
for optimizing `active_mm` tracking following comments from Peter Zijlstra and
Paul E. McKenney on the previous versions of the patch series.


[RFC PATCH 0/1] Buddy allocator like folio split (Zi Yan)
---------------------------------------------------------

https://lore.kernel.org/20241008223748.555845-1-ziy@nvidia.com

Zi Yan posted an RFC patch for making folio split behaves like the Buddy
allocator, to reduce total number of folios after splits.


Proposal: bi-weekly guest_memfd upstream call (David Hildenbrand)
-----------------------------------------------------------------

https://lore.kernel.org/4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com

David Hildenbrand proposes having a bi-weekly meeting for ongoing `guest_memfd`
development, for Thursday 9:00-10:00 PDT.


[GIT PULL] hotfixes for 6.12-rc3 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20241009155033.485bc6df1a01b6dfca93a9d9@linux-foundation.org

Andre posted the hotfixes for next Linux v6.12 release candidate.  It contains
Michal's `PF_MEMALLOC_NORECLAIM` revert series.


[PATCH] mm, slab: add kerneldocs for common `SLAB_` flags (Vlastimil Babka)
---------------------------------------------------------------------------

Vlastimil posted a patch adding kerneldoc comments for `SLAB_` flags.



Linux 6.12-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wg061j_0+a0wen8E-wxSzKx_TGCkKw-r1tvsp5fLeT0pA@mail.gmail.com

Linus Torvalds released the third candidate of Linux v6.12.  He notes the diff
looks odd for regenerated UTF table that was made due to an one-liner change.
It is ignorable, and no really abnormal things are there.
