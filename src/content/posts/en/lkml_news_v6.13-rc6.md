---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-01-02T07:00:45-08:00
lastmod: 2025-01-02T07:00:45-08:00
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

[PATCH v3 00/12] AMD broadcast TLB invalidation (Rik van Riel)
--------------------------------------------------------------

https://lore.kernel.org/20241230175550.4046587-1-riel@surriel.com

Rik posted the third version of the patch series for AMD TLB invalidastion
broadcasting support.


[PATCH mm-unstable v4 0/7] mm/mglru: performance optimizations (Yu Zhao)
------------------------------------------------------------------------

https://lore.kernel.org/20241231043538.4075764-1-yuzhao@google.com

Yu posted the fourth version of MGLRU performance optimization, which fixes two
more regressions.


[RFC PATCH 0/9 v2] cgroup: separate per-subsystem rstat trees (JP Kobryn)
-------------------------------------------------------------------------

https://lore.kernel.org/20250103015020.78547-1-inwardvessel@gmail.com

JP posted second version of the RFC patch sereis that reduce per-subsystem stat
reading overhead by separating the data structure per subsystem.


[RFC PATCH 0/5] Accelerate page migration with batching and multi threads (Zi Yan)
----------------------------------------------------------------------------------

https://lore.kernel.org/20250103172419.4148674-1-ziy@nvidia.com

Zi Yan posted an RFC patch series for accelerating page migration using
batching and multi threads.  It also contains test results on Nvidia Grace
CPUs.


[GIT PULL] hotfixes for 6.13-rc6 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20250104180511.ec607c34f312c8cc759cffc2@linux-foundation.org

Andrew Morton posted hotfixes pull request for 6.13-rc6.


Linux 6.13-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgjfaLyhU2L84XbkY+Jj47hryY_f1SBxmnnZi4QOJKGaw@mail.gmail.com

Linus released the sixth candidaste for Linux v6.13.  As expected and hoped, it
is larger than the last two weeks, but still quiet.  He further expects things
will be more nomal.
