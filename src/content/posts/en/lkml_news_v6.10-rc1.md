---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-05-17T06:45:41-07:00
lastmod: 2024-05-17T06:45:41-07:00
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

[LSFMM] automating measuring memory fragmentation (Luis Chamberlain)
--------------------------------------------------------------------

https://lore.kernel.org/ZkUOXQvVjXP1T6Nk@bombadil.infradead.org

Luis suggested yet another LSFMM session for memory fragmentation measurement
aiming to be used to understand how bad the current kernel's defragmentation
approach is, and how much improvement some new proposal is making.


page-flags.rst (Matthew Wilcox)
-------------------------------

https://lore.kernel.org/ZkOu4yXP-sGGtwc4@casper.infradead.org

Matthew posted the page-flags documentation that he wrote with LSFMM attendees
on his session.


[GIT PULL] MM updates for 6.10-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20240517192239.9285edd85f8ef893bb508a61@linux-foundation.org

Andrew sent the memory management part pull request for 6.10-rc1.  Lots of
interesting changes are included.  Among those, I show below changes
interesting.

- Memory allocation profiling
- mm: page_alloc: freelist migratetype hygiene
  - Improve compaction efficiency
- mm: add per-order mTHP alloc and swpout counters
- Improve visibility of writeback


[GIT PULL] non-MM updates for 6.10-rc1 (Andrew Morton)
------------------------------------------------------

https://lore.kernel.org/20240519115735.acabb2269a1a91ee0ebdbca5@linux-foundation.org

Andrew further sent the non-mm part pull request for 6.10-rc1.


[RESEND PATCH 00/10] memblock: introduce memsize showing reserved memory (Jaewon Kim)
-------------------------------------------------------------------------------------

https://lore.kernel.org/20240521023957.2587005-1-jaewon31.kim@samsung.com

Jaewon posted a patchset introducing a debugfs node that shows reserved memory
easily.


[PATCH 0/2] Improve dump_page() output for slab pages (Sukrit Bhatnagar)
------------------------------------------------------------------------

https://lore.kernel.org/20240522074629.2420423-1-Sukrit.Bhatnagar@sony.com

Since `struct slab` has separated from `struct page`, `dump_page()`, which
accesses `->mapping` of `struct page` gets garbage data.  This patchset fixes
it to show valid output from `dump_page()`.


[GIT PULL] additional MM updates for 6.10-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/r/20240522172431.d2aa8775d7a48999afbc29b4@linux-foundation.org

Andrew Morton posted one more memory management subsystem pull request for
v6.10-rc1.


[PATCH 0/2] Improve dmesg output for swapfile+hibernation (Sukrit Bhatnagar)
----------------------------------------------------------------------------

https://lore.kernel.org/20240522074658.2420468-1-Sukrit.Bhatnagar@sony.com

Sukrit found doing hibernation while using swapfile needs some tedious setup
using user space tools such as `filefrag` for getting the swapfile offset
value.  This patchset allows the value conveniently printed in dmesg output
when doing `swapon`.


[PATCH v3 0/5] Enhance soft hwpoison handling and injection (Jane Chu)
----------------------------------------------------------------------

https://lore.kernel.org/20240521235429.2368017-1-jane.chu@oracle.com

Jane posted a patchset for improving soft hwpoison to behave more like real
error, and more.


[GIT PULL] final MM update for 6.10-rc1 (Andrew Morton)
-------------------------------------------------------

https://lore.kernel.org/20240524115135.3b6fd971bdb3e538e1873632@linux-foundation.org

Andrew sent memory management subsystem's final pull request for 6.10-rc1.  It
includes the `mseal()` system call patchset.


Linux 6.10-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com

After the two weeks, the merge window for Linux 6.10 is closed, and Linus
Torvalds announced the first release candidate of v6.10.  Torvalds says it is a
regular-sized, even slightly smaller side one.
