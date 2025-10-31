---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-07-16T07:04:14-07:00
lastmod: 2024-07-16T07:04:14-07:00
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

[PATCH 00/17] mm: introduce numa_memblks (Mike Rapoport)
--------------------------------------------------------

https://lore.kernel.org/20240716111346.3676969-1-rppt@kernel.org

Mike Rapoport posted thi spatchset for moving `numa_memblks` from x86 to the
generic code, as a followup of the discussion for CXL memory windows handling
on arm64.


[RFC PATCHv2] mm: introduce reclaim throttle in MGLRU (Zhaoyang Huang)
----------------------------------------------------------------------

https://lore.kernel.org/20240716094348.2451312-1-zhaoyang.huang@unisoc.com

Zhaoyang sent a patch that makes direct reclaim of MGLRU be throttled by
judging the number of isolated and inactive folios, to prevent issues similar
to classic LRU.


[RFC PATCH v1 0/4] Control folio sizes used for page cache memory (Ryan Roberts)
--------------------------------------------------------------------------------

https://lore.kernel.org/20240717071257.4141363-1-ryan.roberts@arm.com

Ryan posted an RFC patch series that adds sysfs and kernel command line options
that control the set of allowed large folio sizes that can be used for page
cache.  He hopes this patch series to reduce iTLB pressure and memory
fragmentation.


[GIT PULL] slab updates for 6.11 (Vlastimil Babka)
--------------------------------------------------

https://lore.kernel.org/746087fd-993b-47b3-99e4-9bd4d3502e71@suse.cz

Vlastimil sent the slab subsystem pull request for 6.11 to Linus Torvalds.


[PATCH] execve: Move KUnit tests to tests/ subdirectory (Kees Cook)
-------------------------------------------------------------------

https://lore.kernel.org/20240717212230.work.346-kees@kernel.org

There was a
[conversation](https://lore.kernel.org/202407161505.A5AE57869@keescook) about
the place and file names to put kunit tests.  Following the conclusion, Kees
moves some kunit tests he wrote to a separate directory.


[GIT PULL] MM updates for 6.11-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20240721145415.fbeb01a853962ef91334f3d1@linux-foundation.org

Andrew sent the memory management subsystem pull request for Linux v6.11-rc1 to
Linus Torvalds.


[PATCH 0/5] mm: clarify nofail memory allocation (Barry Song)
-------------------------------------------------------------

https://lore.kernel.org/20240724085544.299090-1-21cnbao@gmail.com

Barry sent a patch series for clarifying the semantic of `GFP_NOFAIL` and fixup
usages of it.


[PATCH v2 00/23] Generic `Allocator` support for Rust (Danilo Krummrich)
------------------------------------------------------------------------

https://lore.kernel.org/20240723181024.21168-1-dakr@kernel.org

Memory allocation for Rust is so far limited to `kmalloc()` allocation.  This
patchset adds generic kernel allocator support by introducing a kernel specific
`Allocator` trait.


Possible slab-allocator issue (Paul E. McKenney)
------------------------------------------------

https://lore.kernel.org/e6db32f7-d1fa-4d38-acf9-f78234f87170@paulmck-laptop

Paul found and report a possible slab allocator issue from his rcuscale test.


State of removing `page->index` (Matthew Wilcox)
------------------------------------------------

https://lore.kernel.org/Zp8fgUSIBGQ1TN0D@casper.infradead.org

Matthew shares status of his project for the next few weeks.


[PATCH 0/2] kmemleak: support for percpu memory leak detect (Pavel Tikhomirov)
------------------------------------------------------------------------------

https://lore.kernel.org/20240725041223.872472-1-ptikhomirov@virtuozzo.com

Pavel reworked and posted an old patch series for adding percpu memory leak
detect to kmemleak, which was useful for his investigations of an issue.


[PATCH 0/7] minmax: reduce compilation time (David Light)
---------------------------------------------------------

https://lore.kernel.org/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com

It turned out recent changes to `min()` and `max()` made build time
regressions.  David is trying to optimize it again.


Linux 6.11-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiyNokz0d3b=GRORij=mGvwoYHy=+bv6m2Hu_VqNdg66g@mail.gmail.com

After the two week of merge window, Linus Torvalds released the first release
candidate of Linux v6.11.
