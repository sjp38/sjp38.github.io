---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-05-07T07:33:52-07:00
lastmod: 2025-05-07T07:33:52-07:00
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

[PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order (Juan Yescas)
-----------------------------------------------------------------------------------

https://lore.kernel.org/20250506002319.513795-1-jyescas@google.com

As a followup of the LSFMMBPF discussion, Juan posted a patch for the CMA
alignment requirements issue on large page size configuration.


[RFC PATCH 0/9] Intel RAR TLB invalidation (Rik van Riel)
---------------------------------------------------------

https://lore.kernel.org/20250506003811.92405-1-riel@surriel.com

Rick posted an RFC patch series for reducing IPI for TLB invaludations on Intel
machines using its RAR feature.


[PATCH 0/1] prctl: allow overriding system THP policy to always (Usama Arif)
----------------------------------------------------------------------------

https://lore.kernel.org/20250507141132.2773275-1-usamaarif642@gmail.com

Usama posted a patch for allowing THP always enabled per process rather than
global.


[PATCH v3] memcg: introduce non-blocking limit setting option (Shakeel Butt)
----------------------------------------------------------------------------

https://lore.kernel.org/20250506232833.3109790-1-shakeel.butt@linux.dev

Shakeel posted a patch for letting memcg memory limit files writing
nonblocking, to make ease of use of the interface.


[PATCH 00/12] sysctl: Move sysctls to their respective subsystems (second batch) (Joel Granados)
------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250509-jag-mv_ctltables_iter2-v1-0-d0ad83f5f4c3@kernel.org

This patch series relocates sysctl tables from `kernl_table` to their
respective subsystems.


Linux 6.15-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgkt+h_UJKE7Lx=b=ixt=ryZ_fXRqMjJYURYVK-3g-k+g@mail.gmail.com

Linus released the sixth candidate for 6.15.  Linus mentions the number of
commits for rc6 is larger than that of rc5, but he is not worried since it
looks just a fluctuation of the timing and we have two more weeks for 6.15.
