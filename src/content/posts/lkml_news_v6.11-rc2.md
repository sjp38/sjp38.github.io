---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-07-30T06:48:17-07:00
lastmod: 2024-07-30T06:48:17-07:00
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

[RFC 0/2] mm: introduce THP deferred setting (Nico Pache)
---------------------------------------------------------

https://lore.kernel.org/20240729222727.64319-1-npache@redhat.com

Nico found increased memory footprint from THP after their customers switching
from RHEL7 to RHEL8.  To mitigate the issue, Nico is proposing adding a new THP
configuration called `deferred`.  It is same to `madvise` but allows
`khugepaged` to do the work.


[PATCH v2 0/4] mm: clarify nofail memory allocation (Barry Song)
----------------------------------------------------------------

https://lore.kernel.org/20240731000155.109583-1-21cnbao@gmail.com

Barry posted the second version of their patchset for ``__GFP_NOFAIL``
clarification.  The patchset is now merged in mm tree.


[PATCH 0/6] mm: split underutilized THPs (Usama Arif)
-----------------------------------------------------

https://lore.kernel.org/20240730125346.1580150-1-usamaarif642@gmail.com

Usama reworks underutilized THPs split work for reducing memory overhead.


Race condition observed between page migration and page fault handling on arm64 machines (Dev Jain)
---------------------------------------------------------------------------------------------------

https://lore.kernel.org/20240801081657.1386743-1-dev.jain@arm.com

Dev Jain and Ryan found a race between page migration and fault handling with a
hacky fix.  Dev Jain further share it with the community to get feedback.


[PATCH v2 0/1] mm: introduce MADV_DEMOTE/MADV_PROMOTE (BiscuitOS Broiler)
-------------------------------------------------------------------------

https://lore.kernel.org/20240801075610.12351-1-zhang.renze@h3c.com

BiscuitOS Brolers proposes Scalable Tiered Memory Control (STMC) mechanism,
which let the application to do the promotion and demotion of memory.  For
this, they implement two new `madvise()` hints for promotion and demotion.


[PATCH v1 1/2] lib/htree: Implementation of new Hash Tree (JaeJoon Jung)
------------------------------------------------------------------------

https://lore.kernel.org/20240802051635.8179-1-rgbi3307@gmail.com

```
new Hash Tree Features
-------------------------------------------------------------------------------
* Very small hash tree structure. [16 Bytes]
* Dynamic memory allocation and free.
* Both 32-bit and 64-bit indexes are possible
* Generate hash keys uniformly based on the index.
* Hash trees are balanced by hash keys, and have no rotation costs.
* Standard deviation of hash key is 4 or less.
* Algorithm O(n) is depth(d) x nodes(c)
* Finding walks is (d x c), min:4, avg:12, max:20
* First hash table has smallest, largest index, algorithm O(1).
* The codes implementing of the algorithm is simple.
* Adjust hash tree depth according to system memory and index nr.
* Hash list nodes use include/linux/list.h, hlist as their base.
-------------------------------------------------------------------------------
```


[PATCH] Hitshield : Something new eviction process for MGLRU (Minwoo Jo)
------------------------------------------------------------------------

https://lore.kernel.org/20240802000546.322036-1-chminoo@g.cbnu.ac.kr

This patch introduces a way to improve page space occupancy issue based on the
finding that the current scheme is not accounting the state of the folio during
the eviction.


Linux 6.11-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wh01xPAWUT_=J1TehFOu3SST12UTNuB=QQTeRw+1N4pDQ@mail.gmail.com

Linus Torvalds releases the second candidate for Linux v6.11.  He mentions
small build or test failures on rc1, which were annoying but never been the
show stopper.
