---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-04-22T07:34:36-07:00
lastmod: 2025-04-22T07:34:36-07:00
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

[PATCH V4 0/4] add max arg to swappiness in memory.reclaim and lru_gen (Zhongkun He)
------------------------------------------------------------------------------------

https://lore.kernel.org/cover.1745225696.git.hezhongkun.hzk@bytedance.com

Zhongkun posted a patch series for fine tuning memory.reclaim and lru_gen for
reclaiminig only anonymous pages.


[PATCH] MAINTAINERS: add core mm section (Lorenzo Stoakes)
----------------------------------------------------------

https://lore.kernel.org/20250423123042.59082-1-lorenzo.stoakes@oracle.com

Lorenzo posted a patch for splitting MM section on MAINTAINER further, for the
core part.


[PATCH v3] tools/mm: Add script to display page state for a given PID and VADDR (Ye Liu)
----------------------------------------------------------------------------------------

https://lore.kernel.org/20250423014850.344501-1-ye.liu@linux.dev

Ye posted a drgn script for printing detailed state of a page for a virtual
address.


[PATCH] MAINTAINERS: add mm THP section (Lorenzo Stoakes)
---------------------------------------------------------

https://lore.kernel.org/20250424111632.103637-1-lorenzo.stoakes@oracle.com

Lorenzo posted a patch for splitting MM section on MAINTAINERS, for thp part
this time.


[PATCH 0/4] move all VMA allocation, freeing and duplication logic to mm (Lorenzo Stoakes)
------------------------------------------------------------------------------------------

https://lore.kernel.org/cover.1745528282.git.lorenzo.stoakes@oracle.com

Lorenzo moves vma logic in kernel.fork.c to mm/


Linux 6.15-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wg8VMvbaq6EECWxP7OcrGtUmauFQCjeLT24pXh-H=o-4Q@mail.gmail.com

Linus released the fourth candidate for Linux 6.15.  According to Linus,
openrisc updates and bcachefs case insensitivity patches standing out, but all
looks normal.
