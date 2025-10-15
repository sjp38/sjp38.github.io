---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.18-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-09-30T06:45:43-07:00
lastmod: 2025-09-30T06:45:43-07:00
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

[PATCH v6 00/23] mm/ksw: Introduce real-time KStackWatch debugging tool (Jinchao Wang)
--------------------------------------------------------------------------------------

https://lore.kernel.org/20250930024402.1043776-1-wangjinchao600@gmail.com

Jinchao Wang posted sixth versin of the kernel stack watching tool patchset.


[GIT PULL] slab updates for 6.18 (Vlastimil Babka)
--------------------------------------------------

https://lore.kernel.org/5dc1b53d-29fb-42f6-9fff-d6b42da17a7f@suse.cz

Vlastimil posted SLAB subsystem pull request for 6.18 to Linus Torvalds.  This
includes the SLAB sheves and re-entrant `kmalloc_nolock()`.


[GIT PULL] MM updates for 6.18-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20251001190218.f33f695b869696c2df9e841d@linux-foundation.org

Andrew posted memory management subsystem pull requests for 6.18-rc1 to Linus
Torvalds.  This includes virtual address space page level data access
monitoring and >4GiB memory access monitoring on 32bit arm devices.


[GIT PULL] additional MM updates for 6.18-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/20251005111538.3996dae46662e46054d46528@linux-foundation.org

Andrew posted a small and final batch of MM updates for 6.18-rc1 to Linus
Torvalds.


[PATCH 0/8] Guaranteed CMA (Suren Baghdasaryan)
-----------------------------------------------

https://lore.kernel.org/20251010011951.2136980-1-surenb@google.com

Suren posted a non-RFC patch series for GCMA, which he has posted the RFC
version for the last LSFMMBPF.


Linux 6.18-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whPJTtX5u1m47fPUD2g2Dc=Did_6OqCVj6OQPKFgfKn9g@mail.gmail.com

Linus released the first release candidate for Linux v6.18, after the two weeks
of the merge window.  Linus says it was fairly normal and good that it didn't
cause particular bisect-required problems and resulted in a normal size.
