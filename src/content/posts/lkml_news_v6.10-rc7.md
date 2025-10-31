---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-07-05T08:20:44-07:00
lastmod: 2024-07-05T08:20:44-07:00
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

[RFC PATCH 0/4] Introduce PMC(PER-MEMCG-CACHE) (Huan Yang)
----------------------------------------------------------

https://lore.kernel.org/20240702084423.1717904-1-link@vivo.com

Huan posted an RFC for per-memcg-cache, which is for utilizing per-memcg cache
of certain rules.  The goal is allowing memory that released by an application
be allocated with high priority within the application, to improve locality and
performance while avoiding unnecessary memory reclamation.


[PATCH] mm: remove CONFIG_MEMCG_KMEM (Johannes Weiner)
------------------------------------------------------

https://lore.kernel.org/20240701153148.452230-1-hannes@cmpxchg.org

Since `CONFIG_MEMCG_KMEM` was default-enabled and equivalent to `CONFIG_MEMCG`
for almost a decade, Johannes tries to remove the config option.


[syzbot] Monthly mm report (Jul 2024) (syzbot)
----------------------------------------------

https://lore.kernel.org/000000000000608993061c2d0e8a@google.com

Syzbot found 5 new issues in last month.  No issue among those has fixed so
far.


[PATCH v2] slab, rust: extend kmalloc() alignment guarantees to remove Rust padding (Vlastimil Babka)
-----------------------------------------------------------------------------------------------------

https://lore.kernel.org/20240703072520.45837-2-vbabka@suse.cz

Vlastimil posted a patch for extending alignment guarantee of `kmalloc()` for
non-power-of-two size case to make Rust' allocator API more flexible and
efficient when slab debugging is active.


[PATCH 0/7] Make core VMA operations internal and testable (Lorenzo Stoakes)
----------------------------------------------------------------------------

https://lore.kernel.org/cover.1720006125.git.lorenzo.stoakes@oracle.com

Lorenzo sent a patch series for making vma operation code more moduled and
testable.


[GIT PULL] hotfixes for 6.10-rc7 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20240703222728.d5ef62a48ebf19260832ee73@linux-foundation.org

Andrew posted a pull request for hotfixes to Linus Torvalds, aiming to be
mergfed in 6.10-rc7.


[PATCH v2 0/2] Introduce tracepoint for hugetlbfs (Hongbo Li)
-------------------------------------------------------------

https://lore.kernel.org/20240704030704.2289667-1-lihongbo22@huawei.com

Hongbo sent the second version of the patchset for adding hugetlbfs
tracepoints.


[PATCH 00/45] hugetlb pagewalk unification (Oscar Salvador)
-----------------------------------------------------------

https://lore.kernel.org/20240704043132.28501-1-osalvador@suse.de

Based on the LSFMM session that led by Peter Xu, Oscar wrote this RFC patch
series for unifying the page table walk for both hugetlb and generic.


Tools for explaining memory mappings/usage/pressure (David Rientjes)
--------------------------------------------------------------------

https://lore.kernel.org/29c27dab-a590-5df2-c840-279bf9dff090@google.com

David shares Google's recent usage of some hacky scripts for understanding
memory behavior, and asks if there are open source tools that can be used
instead.


Linux 6.10-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjv_HoF-5Y5QuNqMfiumwMyNZt63ajO44uKce4dWOeU8Q@mail.gmail.com

Linus Torvalds released the seventh release candidate for Linux 6.10.  Linus
says things remain calm, though it might be due to the US holiday and Europe
vacation season start.
