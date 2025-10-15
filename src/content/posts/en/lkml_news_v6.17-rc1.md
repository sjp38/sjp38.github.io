---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.17-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-07-29T07:03:05-07:00
lastmod: 2025-07-29T07:03:05-07:00
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

[PATCH v1 0/2] mm/damon: Add damos_stat support for vaddr PanJason
------------------------------------------------------------------

https://lore.kernel.org/cover.1753794408.git.pyyjason@gmail.com

Pan posted a patch series letting virtual address space monitoring operations
of DAMON to support `DAMOS_STAT` with `hugepage_size` filter.


[RFC PATCH v4 0/4] mm, bpf: BPF based THP order selection (Yafang Shao)
-----------------------------------------------------------------------

https://lore.kernel.org/20250729091807.84310-1-laoar.shao@gmail.com

Yafang posted the fourth veersion of bpf-based THP order selection patch
series.


[Linux Memory Hotness and Promotion] Notes from July 17, 2025 (David Rientjes)
------------------------------------------------------------------------------

https://lore.kernel.org/c2f5a8d7-061b-7649-2b9d-03e6314d1102@google.com

David shares a note from the last Linux Memory Hotness and Promotion call.


[GIT PULL] MM updates for 6.17-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20250730152806.16f5c618e3af0d3b8dea3159@linux-foundation.org

Andrew posted the MM pull request for Linux 6.17-rc1, with a note that he may
send a second batch neext week.  Andrew mentions there are so many cleanups.


[PATCH v2 0/5] prctl: extend PR_SET_THP_DISABLE to only provide THPs when advised (Usama Arif)
----------------------------------------------------------------------------------------------

https://lore.kernel.org/20250731122825.2102184-1-usamaarif642@gmail.com

Usama posted the second version of his patch series for extending `prctl()` for
per-process THP policy.


[PATCH v11 00/24] zswap compression batching with optimized iaa_crypto driver (Kanchana P Sridhar)
--------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250801043642.8103-1-kanchana.p.sridhar@intel.com

Kanchana posted eleventh version of his patch series for accelerating zswap
with Intel IAA.


[PATCH v2 0/3] execute PROCMAP_QUERY ioctl under per-vma lock (Suren Baghdasaryan)
----------------------------------------------------------------------------------

https://lore.kernel.org/20250804231552.1217132-1-surenb@google.com

Suren posted the second version of the patch series for making `PROCMAP_QUERY`
ioctl system call with only per-vma lock, for better scalability.


[GIT PULL] Additional MM updates for 6.17-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/20250804185852.038ce90aa6f9a177c492b675@linux-foundation.org

Andrew Morton posted second MM pull request for 6.17-rc1 as mentioned on the
first pull request.


[PATCH 00/11] Add and use memdesc_flags_t (Matthew Wilcox)
----------------------------------------------------------

https://lore.kernel.org/20250805172307.1302730-1-willy@infradead.org

Matthew posted patch sereis adding and using `memdesc_falgs_t`, which is the
preparation of the separation of `struct page` from `struct slab` and `struct
folio`.


Maintainers Summit 2025 Call for Topics (Theodore Ts'o)
-------------------------------------------------------

https://lore.kernel.org/20250805144357.GA762104@mit.edu

Theodore posted CFG for Maintainers Summit and Kernel Summit.


Linux 6.17-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgb=B_pGPSTw9y4Fw82y5V_mvzJp_0XcWanz7YRR5vkXA@mail.gmail.com

Linus released the first release candidate for Linux v6.17.  Despite of Linus'
travel, the merge window finished smoothly.
