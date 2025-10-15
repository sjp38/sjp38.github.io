---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-06-18T06:09:34-07:00
lastmod: 2024-06-18T06:09:34-07:00
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

[GIT PULL] hotfixes for 6.10-rc5 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20240617114712.45d4743f8bacb832dea4b5a9@linux-foundation.org

Andrew posted hotfixes pull request to Linus Torvalds.


[PATCH] Add accumulated call counter for memory allocation profiling (David Wang)
---------------------------------------------------------------------------------

https://lore.kernel.org/20240617153250.9079-1-00107082@163.com

David sent a patch for adding accumulated call counter for memory allocation
profiling.  He argues this could help performance behaviors analysis.


[RFC PATCH v1 0/5] Alternative mTHP swap allocator improvements (Ryan Roberts)
------------------------------------------------------------------------------

https://lore.kernel.org/20240618232648.4090299-1-ryan.roberts@arm.com

Ryan posted this proof-of-concept patchset for achieving 0% fallback at mTHP
swap.


Re: [PATCHSET v6] sched: Implement BPF extensible scheduler class (Thomas Gleixner)
-----------------------------------------------------------------------------------

https://lore.kernel.org/878qz0pcir.ffs@tglx

Thomas asked Linus to postpone merge of sched-ext for about three months.
Linus said "no", and Thomas posted this not-short response with a proposal of
maintainers summit topic.


[PATCH v2 0/7] static key support for error injection functions (Vlastimil Babka)
---------------------------------------------------------------------------------

https://lore.kernel.org/20240620-fault-injection-statickeys-v2-0-e23947d3d84b@suse.cz

Vlastimil drops the RFC tag and posted the second version of patch series that
adds static key support for error injection functions.


[PATCH] mm/page_alloc: add one PCP list for THP (yangge)
--------------------------------------------------------

https://lore.kernel.org/1718801672-30152-1-git-send-email-yangge1116@126.com

When large CMA memory is configured, starting a virtual machine with device
passthrough gets stuck, and it also make negative impacts on CMA itself.  This
patch fixes the problem by adding one PCP list for THP.


[PATCH v1] memory tier: consolidate the initialization of memory tiers (Ho-Ren (Jack) Chuang)
---------------------------------------------------------------------------------------------

https://lore.kernel.org/20240621044833.3953055-1-horen.chuang@linux.dev

Ho-Ren sent a patch consolidating memory tier initialization, which is
currently distributed in `memory_tier_init()` and `memory_tier_late_init()`.


[PATCH v2 0/1] tools/mm: Introduce a tool to assess swap entry allocation for thp_swapout (Barry Song)
------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20240622071231.576056-1-21cnbao@gmail.com

Barry introduces a tool for accessing swap entry allocation, so that it can be
used to assess efficiency of the underlying kernel mechanism.


MM global locks as core counts quadruple (David Rientjes)
---------------------------------------------------------

https://lore.kernel.org/07e7d078-0c9d-6a1f-1ab5-295f86974b72@google.com

David and Namhyung found some global locks that used for memory managment have
some high contention, and worrying about it for upcoming era which will have
more CPU cores.  Further they are asking how people testing it, and if someone
working on it.


[PATCH] Fix initializing a static union variable (Yabin Cui)
------------------------------------------------------------

https://lore.kernel.org/20240620181736.1270455-1-yabinc@google.com

Yabin found static union variable initialzied with `{}` can incompletely
initialized according to C11 standard and some clang implementations.  Based on
it, he fixes one such wrong use case.  Some people including Linus are saying
it is better to fix combilers instead of only this single point of bug.


Linux 6.10-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiMMT-2pfJZ8ckbnGTbSHy5mvvE=+-MyA_ARPUqiy_C1w@mail.gmail.com

Another release candidate for Linux v6.10 is released.  Linus says it continues
the trend of being fairly calm.
