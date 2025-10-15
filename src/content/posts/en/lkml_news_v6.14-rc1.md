---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-01-22T07:00:31-08:00
lastmod: 2025-01-22T07:00:31-08:00
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

[PATCH] mm: Optimize TLB flushes during page reclaim (Vinay Banakar)
--------------------------------------------------------------------

https://lore.kernel.org/CALf+9Yc3WjbG89uRWiDC_qYshJ5z_9WCrbEJe42Vbv+gJjs26g@mail.gmail.com

Vinay optimizes `shrink_folio_list()` to do TLB flush in batch instead of per
page being reclaimed.


[LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion based on PTE A bit scanning (Raghavendra K T)
-------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250123105721.424117-1-raghavendra.kt@amd.com

Raghavendra proposes an LSFMMBPF topic for discussions around multiple ways to
find hot pages, and possible future composition of those.


[LSF/MM/BPF TOPIC] Enhancements to Page Migration with Multi-threading and Batch Offloading to DMA (Shivank Garg)
-----------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/cf6fc05d-c0b0-4de3-985e-5403977aa3aa@amd.com

Shivank proposes an LSFMMBPF topic for multi-threading and batching based page
migration acceleration.


[RFC PATCH] Introduce generalized data temperature estimation framework (Viacheslav Dubeyko)
--------------------------------------------------------------------------------------------

https://lore.kernel.org/20250123202455.11338-1-slava@dubeyko.com

Viacheslav proposes a generalized data temperature estimation framework that
estimates temperature based on how long consistent update is made to a specific
file.  He also proposes an LSFMMBPF topic for that:
https://lore.kernel.org/20250123203319.11420-1-slava@dubeyko.com


[GIT PULL] MM updates for 6.14-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20250124162248.60104eec848619a187242392@linux-foundation.org

Andrew posted the MM pull request for 6.14-rc1.  It turned out it has a build
error, though.  Andrew posted another
[one](https://lore.kernel.org/20250126150532.2b75f7ac330cdde40d13d788@linux-foundation.org)
after removing the problematic patch, and the second take has merged.


[PATCH 00/27] hugetlb/CMA improvements for large systems (Frank van der Linden)
-------------------------------------------------------------------------------

https://lore.kernel.org/20250127232207.3888640-1-fvdl@google.com

Frank posted a patch series that improves hugetlb and CMA on large systems.


[PATCH v3 0/2] mm/compaction: allow more aggressive proactive compaction (Michal Clapinski)
-------------------------------------------------------------------------------------------

https://lore.kernel.org/20250127215020.4023545-1-mclapinski@google.com

Michal introduces their system uses free pages reporting-based VM memory
management, and posts this patch for making proactive compaction be more
aggressive.


[PATCH 0/2] mm: zswap: deprecate zbud and remove z3fold (Yosry Ahmed)
---------------------------------------------------------------------

https://lore.kernel.org/Z5gdlO5pOu9XeGce@google.com

Yosry completes deprecation of z3fold by removing it after the two cycles of
the deprecation, and start deprecation of zbud.


[LSF/MM/BPF TOPIC] persistent memory, tracing, KASLR, Oh my! (Steven Rostedt)
-----------------------------------------------------------------------------

https://lore.kernel.org/20250127150214.4d715cad@gandalf.local.home

Steven proposes an LSFMMBPF topic for tracing and generic pstore, which is
different from the kexec hand over topic.


[LSF/MM/BPF TOPIC] Page allocation for ASI (Brendan Jackman)
------------------------------------------------------------

https://lore.kernel.org/20250129124034.2612562-1-jackmanb@google.com

Brendan proposes an LSFMMBPF topic for discussing how ASI can be integrated
into the page allocator.


LSF/MM/BPF TOPIC] Improve KSM for code patching use-cases (Mathieu Desnoyers)
-----------------------------------------------------------------------------

https://lore.kernel.org/427ca05b-fe39-4365-83c6-a23a0733ee69@efficios.com

Mathiew proposes an LSFMMBPF topic for improving KSM to handle libraries and
executable patching use-case for CoW-causing memory usage increase and
prevention of code pages sharing across processes.


[LSF/MM/BPF TOPIC] Waste-Free Per-CPU Userspace Memory Allocation (Mathiew Desnoyers)
-------------------------------------------------------------------------------------

https://lore.kernel.org/e5bb2190-2688-4491-9d17-574ff925f239@efficios.com

Mathiew proposes yet another LSFMMBPF topic for introducing librseq based
per-CPU user-space memory allocator.


[RFC PATCH] mm, memcg: introduce memory.high.throttle (Waiman Long)
-------------------------------------------------------------------

https://lore.kernel.org/20250129191204.368199-1-longman@redhat.com

Due to recent change on `memory.high` memcg file's throttling behavior, some
users prefer to use `memory.max` instead.  Waiman introduces
`memory.high.throttle` to give a control of the throttling behavior to the
user-space.


[LSF/MM/BPF TOPIC] Migrating the un-migratable (David Hildenbrand)
------------------------------------------------------------------

https://lore.kernel.org/882b566c-34d6-4e68-9447-6c74a0693f18@redhat.com

David proposes and LSFMMBPF topic to discuss about where unmigratable pages
comes, and how we can avoid it.


[LSF/MM/BPF TOPIC] KSM Enhancements: Selective KSM (Sourav Panda)
-----------------------------------------------------------------

https://lore.kernel.org/CANruzcR0oN8URqHh86HLuqfiv=pax0-eQ=3_oCK-kX_cuktUGw@mail.gmail.com

Sourav proposes an LSFMMBPF topic for enhancing KSM including a way to use it
with security-critical environments.


[LSF/MM/BPF TOPIC] An SRCU that is faster than RCU Tasks Trace (Paul E. McKenney)
---------------------------------------------------------------------------------

https://lore.kernel.org/dab29bdf-1c33-416d-a5d7-fcc6829a4b60@paulmck-laptop

Paul McKenney proposes an LSFMMBPF for discussing about recent srcu change
aimed to be used for uretprobe, and could also be used in may places.  The aim
is to find feedback and potential usages.


[LSF/MM/BPF TOPIC] Guaranteed CMA (Suren Baghadasaryan)
-------------------------------------------------------

https://lore.kernel.org/CAJuCfpEWVEqsivd7oTvp4foEho_HaD1XNP8KTeKWzG_X2skfGQ@mail.gmail.com

Suren proposes LSFMMBPF topic for discussion of GCMA, which is being used on
Android, for upstreaming it.


Linux 6.14-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com

Linus Torvalds closed the mergewindow for Linux 6.14 and released the first
candidate.  He mentions it was a tiny merge window, maybe due to the holidays,
and it is a good thing.
