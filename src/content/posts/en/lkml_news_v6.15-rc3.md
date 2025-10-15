---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-04-15T07:02:32-07:00
lastmod: 2025-04-15T07:02:32-07:00
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

[PATCH] tools/drgn: Add script to display page state for a given PID and VADDR (Ye Liu)
---------------------------------------------------------------------------------------

https://lore.kernel.org/20250415075024.248232-1-ye.liu@linux.dev

Ye Liu introduces a drgn script for showing page information for specific
virtual address range.


[RFC PATCH v4 0/6] Promotion of Unmapped Page Cache Folios. (Gregory Price)
---------------------------------------------------------------------------

https://lore.kernel.org/20250411221111.493193-1-gourry@gourry.net

Gregory continues his unmapped page cache folios promotion work and sent the
fourth version.


[PATCH v2 0/2] separate out mmap_lock/VMA locking and update MAINTAINERS (Lorenzo Stoakes)
------------------------------------------------------------------------------------------

https://lore.kernel.org/cover.1744799282.git.lorenzo.stoakes@oracle.com

Lorenzo splits out `mmap_lock` code from `mm/memory.c` into `mmap_lock.c` and
adds a MAINTAINERS section for those.


[PATCH] MAINTAINERS: add reverse mapping section (Lorenzo Stoakes)
------------------------------------------------------------------

https://lore.kernel.org/20250417084904.16806-1-lorenzo.stoakes@oracle.com

Lorenzo continues sepration of MM subsystems on MAINTAINERS for rmap.


[GIT PULL] hotfixes for 6.15-rc2 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20250416200202.f5fe2bc61292d57a7a2346fd@linux-foundation.org

Andrew sent hotfixes for 6.15-rc2 to Linus Torvalds.


[PATCH v3 0/8] perform /proc/pid/maps read and PROCMAP_QUERY under RCU (Suren Baghdasaryan)
-------------------------------------------------------------------------------------------

https://lore.kernel.org/20250418174959.1431962-1-surenb@google.com

Suren posted the third version of patchset for making `proc/<pid>/maps` file
read under RCU.


Linux 6.15-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com

Linus released the third candidate of Linux v6.15.  Linus says everything looks
fine and hope people who care to have a happy Easter Sunday.
