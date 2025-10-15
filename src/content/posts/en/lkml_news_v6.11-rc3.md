---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-08-06T06:36:47-07:00
lastmod: 2024-08-06T06:36:47-07:00
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

[PATCH 00/10] mm: remove vma_merge() (Lorenzo Stoakes)
------------------------------------------------------

https://lore.kernel.org/cover.1722849859.git.lorenzo.stoakes@oracle.com

Lorenzo posted a patchset for removing the infamous `vma_merge()`, which caused
too much complexity, and the prior attempt remove it was failed.


[RFC PATCH 0/4] mm/arm64: re-enable HVO (Yu Zhao)
-------------------------------------------------

https://lore.kernel.org/20240806022114.3320543-1-yuzhao@google.com

Yu sent an RFC patchset for re-enabling HugeTLB Vmemmap Optimization on arm64.


[PATCH 00/10] Introduce guestmemfs: persistent in-memory filesystem (James Gowans)
----------------------------------------------------------------------------------

https://lore.kernel.org/20240805093245.889357-1-jgowans@amazon.com

James Gowans posted a patch series for a new in-memory filesystem that designed
for live update.


[PATCH RFC 0/4] mm: Introduce guest_memfd library (Elliot Berman)
-----------------------------------------------------------------

https://lore.kernel.org/20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com

Elliot posted an RFC patchset that introduces a library abstracting
`guest_memfd` folio handling core-mm mechanisms.


[PATCH 1/2] maple_tree: add test to replicate low memory race conditions (Sidharta Kumar)
-----------------------------------------------------------------------------------------

https://lore.kernel.org/20240808163000.25053-1-sidhartha.kumar@oracle.com

Sidarthat sent a patch for adding a callback field to the user space
implementation of `struct kmem_cache` for testing low memory scenarios.


[RFC][PATCH 0/5] slab: Allocate and use per-call-site caches (Kees Cook)
------------------------------------------------------------------------

https://lore.kernel.org/20240809072532.work.266-kees@kernel.org

Kees shares his implementation of a defence against heap-grooming attacks that
construct malicous objects in the same cache as a target object.  The
implementation uses the code taggign and memory allocation tagging
infrastructure to make per-call-site kmalloc.


Linux 6.11-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wj7_w1E0kMiUeskhBRrcCz3bejjegteGmM6-TES8bQURg@mail.gmail.com

After the one week, Linus again released the third candidate for Linux v6.11.
He summarizes the week as nothing particularly strange or interesting going on.
