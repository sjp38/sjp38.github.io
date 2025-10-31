---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-08-26T18:49:02-07:00
lastmod: 2024-08-26T18:49:02-07:00
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

[RFC PATCH -next 0/3] fs: Introduce the scope-based resource management for folio_lock/unlock (Li Zetao)
--------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20240826071036.2445717-1-lizetao1@huawei.com

Li proposes scope-based resource management for folio locking.


[PATCH 0/2] get rid of PF_MEMALLOC_NORECLAIM (Michal Hocko)
-----------------------------------------------------------

https://lore.kernel.org/20240826085347.1152675-1-mhocko@kernel.org

Michal argues `PF_MEMALLOC_NORECLAIM` has merged even though MM people pushed
it back, and attempts to get rid of it by updating its users to use explicit
`GFP_NOWAIT` allocation context.


[PATCH] bcachefs: Switch to memalloc_flags_do() for vmalloc allocations (Kent Overstreet)
-----------------------------------------------------------------------------------------

https://lore.kernel.org/20240828140638.3204253-1-kent.overstreet@linux.dev

Kent tries to fix a potential deadlock from gfp usage of `vmalloc()`.  However
the similar approach was NAK-ed by MM people before.  The previous approach was
merged anyway by bcachefs.  So another discussion is started.


[PATCH v5 0/6] mm: split underused THPs (Usama Arif)
----------------------------------------------------

https://lore.kernel.org/20240830100438.3623486-1-usamaarif642@gmail.com

Usama sent the fifth version of the under-utilized THP split patch series.


Linux 6.11-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgumCUwjVkGREh1WwZ2ia5EqSjAQ_4wjUDw3-m0aT7KFA@mail.gmail.com

Linus releases the sixth candidate of Linux 6.11 about a half day earlier than
usual, since he was still in an unusual timezone.  He mentions things look
pretty normal though there are unusually many filesystem fixes.  Nothing
particularly odd, still, though.
