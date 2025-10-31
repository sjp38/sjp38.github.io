---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-11-05T06:40:52-08:00
lastmod: 2024-11-05T06:40:52-08:00
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

[PATCH 0/3] Introduce acctmem (Matthew Wilcox)
----------------------------------------------

https://lore.kernel.org/20241104210602.374975-1-willy@infradead.org

Willy tries to split out `page->memcg_data` reference counting using a new
abstract, `acctmem`.


[linus:master] [mm, mmap]  d4148aeab4: will-it-scale.per_process_ops 3888.9% improvement (kernel test robot)
------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/202411072132.a8d2cf0f-oliver.sang@intel.com

Kernel test robot reports huge improvement on will-it-scale benchmark, coming
from commit d4148aeab412 ("mm, mmap: limit THP alignment of anonymous mappings
to PMD-aligned sizes").


Linux 6.12-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiWK-GCmFGNqknDZzWMZM-u58tmP=jZ9ooTo9b8NURvgQ@mail.gmail.com

Linus released the seventh candidate for Linux v6.12.  Linus says no big
surprises found, so he anticipates final 6.12 release next week.
