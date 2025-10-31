---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.17-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-08-19T06:53:57-07:00
lastmod: 2025-08-19T06:53:57-07:00
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

[RFC PATCH v5 mm-new 0/5] mm, bpf: BPF based THP order selection (Yafang Shao)
------------------------------------------------------------------------------

https://lore.kernel.org/20250818055510.968-1-laoar.shao@gmail.com

Yafang posted the fifth RFC patch series for BPF-based THP control.


[PATCH v1 00/14] mm: BPF OOM (Roman Guschin)
--------------------------------------------

https://lore.kernel.org/20250818170136.209169-1-roman.gushchin@linux.dev

Roman posted the first non-RFC patchset for BPF-based out of memory handling.


[RFC PATCH mm-next v2 00/12] mm/damon: support ARM32 with LPAE (Quanmin Yan)
----------------------------------------------------------------------------

https://lore.kernel.org/20250820080623.3799131-1-yanquanmin1@huawei.com

Quanmin posted second RFC version of patch series for extending DAMON to
support ARM32 with LPAE.


[GIT PULL] hotfixes for 6.17-rc3 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20250821182122.eb19072cafdbc6612e76ac8f@linux-foundation.org

Andrew sent a pull request for a group of hotfixes to Linus Torvalds.


Linux 3.17-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgKmy+gOftf32wT86F+mSvdq2=XZe8Tcb5m0NaQTZt-dg@mail.gmail.com

Linus released the third candidate for Linux 6.17.  Apparently the version
number of the mail subject has a typo, though.  This is bit larger rc3 than
usual, but it was expected due to the tiny size of rc2, and all changes look
normal, acoording to Linus.
