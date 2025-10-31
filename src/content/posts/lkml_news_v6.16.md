---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-07-22T06:39:23-07:00
lastmod: 2025-07-22T06:39:23-07:00
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

[PATCH POC] prctl: extend PR_SET_THP_DISABLE to optionally exclude VM_HUGEPAGE (David Hildenbrand)
--------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250721090942.274650-1-david@redhat.com

David posted a patch for extending `prctl()` for more fine-tuned control of THP
behaviors per processes with their childs.


[PATCH v2] MAINTAINERS: add MM MISC section, add missing files to MISC and CORE (Lorenzo Stoakes)
-------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250723095823.21940-1-lorenzo.stoakes@oracle.com

Lorenzo posted a patch for further making MM sections on MAINTAINERS file be
well organized.


[RFC][PATCH v2 00/29] introduce kmemdump (Eugen Hristev)
--------------------------------------------------------

https://lore.kernel.org/20250724135512.518487-1-eugen.hristev@linaro.org

Eugen posted a patch series for adding a new mechanism that allows the kernel
to mark specific memory areas for dumping or specific backend usage.


Linux 6.16 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wh0kuQE+tWMEPJqCR48F4Tip2EeYQU-mi+2Fx_Oa1Ehbw@mail.gmail.com

Linus released Linux 6.16, after the end of the release cycle.  Linus also
mentions he might delay 6.17-rc1, since he will have busy travels in August.
