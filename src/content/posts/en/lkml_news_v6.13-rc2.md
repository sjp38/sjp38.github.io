---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-12-09T07:18:30-08:00
lastmod: 2024-12-09T07:18:30-08:00
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

[PATCH] MAINTAINERS: group all VMA-related files into the VMA section (Lorenzo Stoakes)
---------------------------------------------------------------------------------------

https://lore.kernel.org/20241206191600.45119-1-lorenzo.stoakes@oracle.com

Lorenzo posted a patch adding more source files for VMA section of MAINTAINERS
file, to avoid people sending patches without Cc-ing VMA maintainers.


Linux 6.13-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgDe9JfGynY9KQ1exkL0DM-cyLYdeYdOxbCXNHm=qAgSQ@mail.gmail.com

Linus released the second candidate of Linux v6.13.  Some autoamted cleanup
changes made the diff bit noisy, and there are some real fixes for drivers,
networking and bpf.
