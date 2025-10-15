---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-08-13T06:39:19-07:00
lastmod: 2024-08-13T06:39:19-07:00
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

[PATCH v3 0/6] mm: split underutilized THPs (Usama Arif)
--------------------------------------------------------

https://lore.kernel.org/20240813120328.1275952-1-usamaarif642@gmail.com

Usama posted the third version of THP split patch series.


[PATCH] Reenable NUMA policy support in the slab allocator (Christoph Lameter)
------------------------------------------------------------------------------

https://lore.kernel.org/20240812-numa_policy-v1-1-1732602b976c@gentwo.org

Christoph sent a patch that reverts previous commit that disabled the numa
policy support in the slab allocator.


[RFC PATCH v1 0/4] mm: ZSWAP swap-out of mTHP folios (Kanchan P Sridhar)
------------------------------------------------------------------------

https://lore.kernel.org/20240814062830.26833-1-kanchana.p.sridhar@intel.com

Kanchan sent an RFC patch series for enabling `zswap_store()` storing mTHP
folios.


[PATCH v2 0/4] memcg: initiate deprecation of v1 features (Shakeel Butt)
------------------------------------------------------------------------

https://lore.kernel.org/20240814220021.3208384-1-shakeel.butt@linux.dev

Shakeel sent a patch series for starting deprecation of memcg v1 features
following the dicsussion on last LSFMM+BPF.


[PATCH v3 0/7] mm: workingset reporting (Yuanchu Xie)
-----------------------------------------------------

https://lore.kernel.org/20240813165619.748102-1-yuanchu@google.com

Yuanchu sent the third version of the patchset for reporting workingset size of
the system.


[PATCH v3 0/4] mm: clarify nofail memory allocation (Barry Song)
----------------------------------------------------------------

https://lore.kernel.org/20240817062449.21164-1-21cnbao@gmail.com

Barry sent the third version of the patch series for clarifying `__GFP_NOFAIL`.


Linux 6.11-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgP=qzODR60Xxzem5LQi6sH+6EFCDMOApAgBy37SQ59hA@mail.gmail.com

Linus released the fourth v6.11 candidate.  The diffstat is a bit odd due to
x86 feature flag cleanup and bigger than either rc2 or rc3 were.  Nonetheless,
Torvalds says it looks normal.  Nonetheless, he hopes things to start calming
down for his upcoming travels.
