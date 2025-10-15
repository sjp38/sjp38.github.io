---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-10-01T06:54:08-07:00
lastmod: 2024-10-01T06:54:08-07:00
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

[PATCH v2 1/2] virt: pvmemcontrol: control guest physical memory properties (Yuanchu Xie)
-----------------------------------------------------------------------------------------

https://lore.kernel.org/20241001011328.2806686-1-yuanchu@google.com

Yuanchu posted the second version of a patch series for pvmemcontrol, which
allows VM guests control their physcial memory properties and enable security
features optimizations.


[Invitation] Linux MM Alignment Session on shared PTEs across processes on Wednesday (David Rientjes)
-----------------------------------------------------------------------------------------------------

https://lore.kernel.org/eb2ce2c1-9fbd-215b-9973-7ec515c14015@google.com

Dadiv shares next Linux MM alignment session will be held this Wednesday.  The
topic will be "Add support for shared PTEs across processes", aka `mshare()`.


[RFC PATCH 0/2] cpufreq_ext: Introduce cpufreq ext governor (Yipeng Zou)
------------------------------------------------------------------------

https://lore.kernel.org/20240927101342.3240263-1-zouyipeng@huawei.com

Yipeng posted an RFC patch series for making cpu frequency governors extensible
using BPF, similar to `sched_ext`.  One quick question from Alexei is that
isn't it also available using `sched_ext`.


[PATCH slab hotfixes v2 0/2] slub kunit tests fixes for 6.12 (Vlastimil Babka)
------------------------------------------------------------------------------

https://lore.kernel.org/20241001-b4-slub-kunit-fix-v2-0-2d995d3ecb49@suse.cz

Vlastimil sent hotfixes for SLAB kunit tests, which was added for Linux v6.12.


[RFC PATCH 0/4] sched+mm: Track lazy active mm existence with hazard pointers (Mathiew Desnoyers)
-------------------------------------------------------------------------------------------------

https://lore.kernel.org/20241002010205.1341915-1-mathieu.desnoyers@efficios.com

Matthew found hazard pointers could be goot for replacing reference counting
based lazy active mm tracking, and sent an RFC patch series for that.  On the
cover letter, he shares 3-28% speedup of will-it-scale
`context_switch1_threads` results.


[PATCH v8 00/29] Generic `Allocator` support for Rust (Danilo Krummrich)
------------------------------------------------------------------------

https://lore.kernel.org/20241001150008.183102-1-dakr@kernel.org

Dasnilo sent the eighth version of the patch series that adds generic kernel
allocator support for Rust.


[syzbot] Monthly mm report (Oct 2024) (syzbot)
----------------------------------------------

https://lore.kernel.org/66fe5d9e.050a0220.28a3b.020d.GAE@google.com

Syzbot reports the monthly statistics for mm.  Last month, 10 new issues were
detected and 4 were fixed.  79/263 total open/fixed issues for mm so far.


[PATCH 0/5] Remove PageKsm() (Matthew Wilcox)
---------------------------------------------

https://lore.kernel.org/20241002152533.1350629-1-willy@infradead.org

Matthew posted a patch series removing `PageKsm()` in favor of the folio
version.


Linux 6.12-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgMS-TBfirwuxf+oFA3cTMWVLik=w+mA5KdT9dAvcvhTA@mail.gmail.com

Linus Torvalds released the second candidate for Linux 6.12 with longer than
usual release note.  He notes that rc2 is larger than usual, but no real weird
and scary things are there.
