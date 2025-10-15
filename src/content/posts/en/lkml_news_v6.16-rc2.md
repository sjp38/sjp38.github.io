---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-06-10T06:52:11-07:00
lastmod: 2025-06-10T06:52:11-07:00
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

[PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE (Barry Song)
--------------------------------------------------------------------

https://lore.kernel.org/20250610055920.21323-1-21cnbao@gmail.com

Barry posted ano ther RFC for using per-vma lock for `MADV_FREE`.


[Invitation] Linux MM Alignment Session on SLUB Sheaves counters on Wednesday (David Rientjes)
----------------------------------------------------------------------------------------------

https://lore.kernel.org/7e833009-9eb7-cfbd-ee94-590035da84c0@google.com

David announces next Linux MM alignment session for SLUB sheaves, which will be
led by Vlastimil Babka.


[RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data across nodes (Bijan Tabatabai)
--------------------------------------------------------------------------------------------

https://lore.kernel.org/20250612181330.31236-1-bijan311@gmail.com

Bijan posted a patch series for utilizing DAMON to do dynamic memory
interleaving.


Linux 6.16-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjoSZFTv3kWKpcHoWJG723TS5KxfStvB40mYYjqVspgFw@mail.gmail.com

Linus released the second candidate for Linux 6.16.  Linus says it is common to
have small rc2, but this rc2 is unusually small.
