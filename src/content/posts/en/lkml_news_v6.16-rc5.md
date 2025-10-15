---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-07-01T07:13:24-07:00
lastmod: 2025-07-01T07:13:24-07:00
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

[PATCH v1 00/29] mm/migration: rework movable_ops page migration (part 1) (David Hildenbrand)
---------------------------------------------------------------------------------------------

David prepares the future that `struct page` and `struct folio` be decoupled
and hence `movable_ops` page became no folio.


[PATCH v8 00/15] khugepaged: mTHP support (Nico Pache)
------------------------------------------------------

https://lore.kernel.org/20250702055742.102808-1-npache@redhat.com

Nico Pache sent the eighth versin of his patch series for mTHP support on
khugepaged.


[RFC PATCH v3 00/13] mm/damon/vaddr: Allow interleaving in `migrate_{hot,cold}` actions (Bijan Tabatabai)
---------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250702201337.5780-1-bijan311@gmail.com

Bijan posted third RFC version of DAMOS-based memory interleaving patch series.


Linux 6.16-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjaAJX1zbHhiG3UWOgqauAwPZGbOv+_f64oUPAgS7Acvg@mail.gmail.com

Linus Torvalds released the fifth candidate for Linux 6.16.  Linus mentions
nothing odd is here.
