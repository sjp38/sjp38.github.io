---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-02-25T06:40:30-08:00
lastmod: 2025-02-25T06:40:30-08:00
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

[RFC PATCH 0/3] sched/numa: Introduce per cgroup numa balance control (Chen Yu)
-------------------------------------------------------------------------------

https://lore.kernel.org/cover.1740483690.git.yu.c.chen@intel.com

Chen posted an RFC for cgroup based numa balancing control, following recent
[approach](https://lore.kernel.org/linux-mm/ZrukILyQhMAKWwTe@localhost.localhost/)
from Kaiyang Zhao.


[LSF/MM/BPF TOPIC] SLUB allocator, mainly the sheaves caching layer (Vlastimil Babka)
-------------------------------------------------------------------------------------

https://lore.kernel.org/14422cf1-4a63-4115-87cb-92685e7dd91b@suse.cz

Vlastimil proposes an LSFMMBPF topic for his SLUB sheaves patch series.


[RFC PATCH 0/2] SKSM: Synchronous Kernel Samepage Merging (Mathieu Desnoyers)
-----------------------------------------------------------------------------

https://lore.kernel.org/20250228023043.83726-1-mathieu.desnoyers@efficios.com

Matthieu proposes a variant of KSM that works in synchronous manner, unlike
KSM.


Linux 6.14-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiB9Pwwv--oDW_BURx9_F-tNGZFWNi7Lqfm3REGa7PcEw@mail.gmail.com

Linus released the fifthe candidaste of Linux v6.15.  Everything looks fairly
normal.
