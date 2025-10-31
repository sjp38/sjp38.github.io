---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-06-27T07:25:29-07:00
lastmod: 2025-06-27T07:25:29-07:00
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

[PATCH 0/3] mm: introduce snapshot_page() (Luiz Capitulino)
-----------------------------------------------------------

https://lore.kernel.org/cover.1750961812.git.luizcap@redhat.com

Luiz introduces a helper functions for creating a snapshot of a page and its
folio.


[PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are disabled (Baolin Wang)
---------------------------------------------------------------------------------

https://lore.kernel.org/cover.1750815384.git.baolin.wang@linux.alibaba.com

Baolin posted a patch series for making THP never means never.


Linux 6.16-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjqJeFHs_CsO2MeFLi-qceFM7_dVfKBMH4B7oVJaH6tHQ@mail.gmail.com

Linus released the fourth candidate for Linux 6.16.  Linus mentions things look
fairly normal despite of the large merge window.
