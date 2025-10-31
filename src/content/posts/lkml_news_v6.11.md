---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-09-11T09:41:15-07:00
lastmod: 2024-09-11T09:41:15-07:00
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

[PATCH hotfix 6.11] minmax: reduce egregious min/max macro expansion (Lorenzo Stoakes)
--------------------------------------------------------------------------------------

https://lore.kernel.org/20240911153457.1005227-1-lorenzo.stoakes@oracle.com

Lorenzo sent a patch for resolving `min()/max()` expansions causing kernel
build time issue by fixing a few known-bad cases of nested macro usages.


[RFC PATCH 0/7] support for mm-local memory allocations and use it (Fares Mehanna)
----------------------------------------------------------------------------------

https://lore.kernel.org/20240911143421.85612-1-faresx@amazon.de

Fares posted an RFC patch series for mm-local memory allocations for pushing
those out of rach for possible speculation based cross-process attacks.


[PATCH] rust: shrinker: add shrinker abstraction (Alice Ryhl)
-------------------------------------------------------------

https://lore.kernel.org/20240912-shrinker-v1-1-18b7f1253553@google.com

Alice sent a patch for introducing shrinker Rust abstraction for Rust Binder.


[PATCH] mm: Compute mTHP order efficiently (Dev Jain)
-----------------------------------------------------

https://lore.kernel.org/20240913091902.1160520-1-dev.jain@arm.com

Dev Jain postd a patch for improving the efficiency of mTHP order calculation.


[GIT PULL] sched_ext: Initial pull request for v6.12 (Tejun Heo)
----------------------------------------------------------------

https://lore.kernel.org/ZuOULxlZmbvY1skN@slm.duckdns.org

Tejun posted the `sched_ext` pull request for Linux 6.12.


Linux 6.11 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=whVpSHw9+4ov=oLevfv8sPYbh59T_9VKif-6Vqkr41jQA@mail.gmail.com

Linus Torvalds released the Linux v6.11, following the normal schedule on
Vienna timezone.  So the merge window for Linux v6.12 is opened.  Linus is
still on the road, and many maintainers would also be, for the OSSEU, LPC, and
maintainers summit.  Linus says this may make the slow start of the merge
window, and ask maintainers to be patient.
