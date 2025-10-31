---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-09-04T06:10:40-07:00
lastmod: 2024-09-04T06:10:40-07:00
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

[GIT PULL] slab updates for 6.11 (Vlastimil Babka)
--------------------------------------------------

https://lore.kernel.org/8d6c5d10-5750-4472-858c-eadc105453be@suse.cz

Vlastimil sent the slab pull request for Linux 6.12-rc1.  Apparently the title is a typo.


[RFC PATCH 0/4] Add hazard pointers to kernel (Boqun Feng)
----------------------------------------------------------

https://lore.kernel.org/20240917143402.930114-1-boqun.feng@gmail.com

Boqun posted a patch series for introducing hazard pointers for kernel space,
which is "a scalable reference counting mechanism with RCU-like API".


[GIT PULL] hotfixes for 6.12-rc1 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20240919003557.1777673c0f759f9e4ebaa328@linux-foundation.org

Andrew sent a hotfixes pull request for 6.12-rc1.


[GIT PULL] MM updates for 6.12-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20240920023317.f20c9ecbb2a2f4bf382d831c@linux-foundation.org

Andrew posted the MM subsystem update pull request for Linux 6.12-rc1 to Linus.


[RFC PATCH v1 0/2] Userspace Can Control Memory Failure Recovery (Jiaqi Yan)
----------------------------------------------------------------------------

https://lore.kernel.org/20240924043924.3562257-1-jiaqiyan@google.com

Jiaqi lists two use cases of memory failure recovery control from user space
for cloud providers, and suggest kernel changes for support of such controls.


[PATCH V2 0/2] Introduce panic function when slub leaks (Fangzheng Zhang)
-------------------------------------------------------------------------

https://lore.kernel.org/20240925132505.21278-1-fangzheng.zhang@unisoc.com

Fangzheng posted a patch series for introducing a way to detect slub leaks and
doing a panic in the case.


[RFC PATCH v2 0/2] Support large folios for tmpfs (Baolin Wang)
---------------------------------------------------------------

https://lore.kernel.org/cover.1727338549.git.baolin.wang@linux.alibaba.com

Baoling posted the second version of his RFC patch series for supporting large
folios for tmpfs.


[PATCH v7 0/8] mm: ZSWAP swap-out of mTHP folios (Kanchana P Sridhar)
---------------------------------------------------------------------

https://lore.kernel.org/20240924011709.7037-1-kanchana.p.sridhar@intel.com

Kanchana sent the seventh version ofhis patch series for enabling
`zswap_store()` to accept/store mTHP folios.


Next steps towards shrinking stuct page (Matthew Wilcox)
--------------------------------------------------------

https://lore.kernel.org/ZvRKzKizOfEWBtJp@casper.infradead.org

Matthew shares his plans for shrinking the size of `struct page` in response to
Yu's question.


[PATCH v2 0/6] Split list_lru lock into per-cgroup scope (Kairui Song)
----------------------------------------------------------------------

https://lore.kernel.org/20240925171020.32142-1-ryncsn@gmail.com

Kairui sent the second version of the patch series for splitting `list_lru`
lock per cgroup instead of per node, to reduce the lock contention.


[RFC/PATCH bpf-next 0/3] bpf: Add slab iterator and kfunc (v1) (Namhyung Kim)
-----------------------------------------------------------------------------

https://lore.kernel.org/20240925223023.735947-1-namhyung@kernel.org

Namhyung proposes a new iterator and a kfunc for slab to get `/proc/slabinfo`
like infomration for each `kmem_cache`.


[RFC PATCH 0/4] implement lightweight guard pages (Lorenzo Stoakes)
-------------------------------------------------------------------

https://lore.kernel.org/cover.1727440966.git.lorenzo.stoakes@oracle.com

Lorenzo proposes a light approach for 'guard pages' that doesn't rely on
additional `vma`.  The approach add the 'guard' information in page tables
instead of additional vmas.  The implementation uses new `madvise()` hints,
namely `MADV_GUARD_POISON` and `MADV_GUARD_UNPOISON`.


Linux 6.12-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiwVOCZsC6a4dLdb1UjL2fS_CnLNjrPL0XGFbDd9C26Cg@mail.gmail.com

After the two weeks of the merge window, Linus Torvalds announces the first
release candidate for Linux v6.12 and closes the merge window.  Torvalds
further introduces `PREEMT_RT` and `sched_ext` as noticeable new features for
Linux v6.12.
