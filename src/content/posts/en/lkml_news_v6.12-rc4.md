---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-10-15T06:37:20-07:00
lastmod: 2024-10-15T06:37:20-07:00
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

[Invitation] bi-weekly guest_memfd upstream call on 2024-10-17 (David Hildenbrand)
----------------------------------------------------------------------------------

https://lore.kernel.org/df619e65-e65e-4856-b4ca-9938e8e08f18@redhat.com

David starts a bi-weekly call series for discussing `guest_memfd`.  The first
instance will be held on 2024-10-17 9am PT.


[Invitation] Linux MM Alignment Session on IOMMU(fd) persistence and Kexec Hand Over (KHO) on Wednesday (David Rientjes)
------------------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/c85a45fb-7b21-4f9f-568a-e86debbd001a@google.com

David invites people to next MM alignment session.  The topic will be Amazon's
kexec hand-over for making iommu persistent during live update of kernel.


[PATCH v3 0/5] page allocation tag compression (Suren Baghdasaryan)
-------------------------------------------------------------------

https://lore.kernel.org/20241014203646.1952505-1-surenb@google.com

Suren posted the third version of the patch series for reducing page allocation
profiling's memory overhead.


[RFC 0/2] rwsem: introduce upgrade_read interface (Li Zhe)
----------------------------------------------------------

https://lore.kernel.org/20241016043600.35139-1-lizhe.67@bytedance.com

Li sent an RFC patch for introducing new reader-writer semaphore feature for
upgrading it from read lock to write lock.  He mentions khugepaged as an
example that can get benefit from the new feature.  There are some questions
about the fundamental problem of the semantic though.


Pmemfs/guestmemfs discussion recap and open questions (David Rientjes)
----------------------------------------------------------------------

https://lore.kernel.org/f44f317a-2dcb-cfe2-013c-7508907ce3df@google.com

David shares a summary of yesterday's MM alignment session for live hypervisor
kernel upgrade using KHO, with open questions that not got aligned answers
yesterdasy.


[PATCH 0/1] memcg/hugetlb: Adding hugeTLB counters to memory controller (Joshua Hahn)
-------------------------------------------------------------------------------------

https://lore.kernel.org/20241017160438.3893293-1-joshua.hahnjy@gmail.com

Joshua posted a patch for adding hugetlb usage counter to memcg.


[RFC 0/4] mm: zswap: add support for zswapin of large folios (Usama Arif)
-------------------------------------------------------------------------

https://lore.kernel.org/20241018105026.2521366-1-usamaarif642@gmail.com

Usama posted an RFC patch series for supporting large folios swapin to zswap.


Linux 6.12-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wi4OfH8kHmsss97bRvUo=GUEcRSGTYFwqNUL-8x_h-ROA@mail.gmail.com

Linus released the fourth candidate for Linux v6.12.  It is the biggest rc4 of
6.x era, and Linus is not happy about the size.  He shows no real problematic
changes and guess it maybe due to just random timing, though.
