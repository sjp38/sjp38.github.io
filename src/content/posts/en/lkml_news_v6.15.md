---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-05-20T06:57:25-07:00
lastmod: 2025-05-20T06:57:25-07:00
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

[RFC PATCH v2 0/5] mm, bpf: BPF based THP adjustment (Yafang Shao)
------------------------------------------------------------------

https://lore.kernel.org/20250520060504.20251-1-laoar.shao@gmail.com

Yafang posted the second version of BPF-based THP policy adjustment patch
series.


[RFC PATCH 0/5] add process_madvise() flags to modify behaviour (Lorenzo Stoakes)
---------------------------------------------------------------------------------

https://lore.kernel.org/cover.1747686021.git.lorenzo.stoakes@oracle.com

Lorenzo posted an RFC series for extending `process_madvise()` behavior using
its flags option.


[RFC v2 PATCH 0/9] Intel RAR TLB invalidation (Rik van Riel)
------------------------------------------------------------

https://lore.kernel.org/20250520010350.1740223-1-riel@surriel.com

Rik posted the second version of his RFC patch series for Intel's h/w-based tlb
invalidation optimization.


[PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY (Usama Arif)
------------------------------------------------------------------

https://lore.kernel.org/20250519223307.3601786-1-usamaarif642@gmail.com

Usama posted third RFC version of the patch series for making process-level THP
policy control.


[RFC PATCH v0 0/2] Batch migration for NUMA balancing (Bharata B Rao)
---------------------------------------------------------------------

https://lore.kernel.org/20250521080238.209678-1-bharata@amd.com

Bharata posted an RFC patch series for batching NUMA balancing migrations.


Linux 6.15 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wiLRW8DN8-4jmeCZH0OpO8skXOC5e6FwMfsPwGMpQYmVQ@mail.gmail.com

Linus released the Linux v6.15 as expected on the Sunday.  Of course this means
the merge window for Linux 6.16 will be open.
