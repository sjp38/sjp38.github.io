---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-05-27T06:54:01-07:00
lastmod: 2025-05-27T06:54:01-07:00
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

[PATCH RFC] mm: use per_vma lock for MADV_DONTNEED (Barry Song)
---------------------------------------------------------------

https://lore.kernel.org/20250527044145.13153-1-21cnbao@gmail.com

Barry posted an RFC to make `MADV_DONTNEED` `madvise()` calls to use per-vma
lock when the region is in a signle vma.


[PATCH v4] tools/mm: Add script to display page state for a given PID and VADDR (Ye Liu)
----------------------------------------------------------------------------------------

https://lore.kernel.org/20250528091543.355386-1-ye.liu@linux.dev

Ye posted fourth version of a patch for drgn script that shows detailed
information of page for a given virtual address.


[DISCUSSION] proposed mctl() API (Lorenzo Stoakes)
--------------------------------------------------

https://lore.kernel.org/85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local

Lorenzo started a discussion thread for a new syscall, mctl(), which is for
making `mm_struct` level behavior control.


How should we RCU-free folios? (Matthew Wilcox)
-----------------------------------------------

https://lore.kernel.org/aDh3INMq0_j7pgwU@casper.infradead.org

Matthew shares his thought about RCU-free-ing folios for a world that folios
become no more head pages.


[GIT PULL] MM updates for 6.16-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20250531145342.383090aa5ed5bcefee0740d5@linux-foundation.org

Andrew posted MM pull request for 6.16-rc1.


[GIT PULL] Additional MM updates for 6.16-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/20250601151222.60ead71e7d8492a18c711a05@linux-foundation.org

Two days after the first PR, Andrew posted additional MM updates for 6.16-rc1.


[RFC PATCH] MAINTAINERS: add mm swap section (Lorenzo Stoakes)
--------------------------------------------------------------

https://lore.kernel.org/20250602152015.54366-1-lorenzo.stoakes@oracle.com

Lorenzo posted yet another MAINTAINERS improvement patch for MM subsystem.


[Linux Memory Hotness and Promotion] Notes from May 22, 2025 (David Rientjes)
-----------------------------------------------------------------------------

https://lore.kernel.org/00b77c99-b2d1-15e6-bcd0-b363f7571d6f@google.com

David posted a summary of last Linux memory hotness and promotion meeting
discussion.


Linux 6.16-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com

Linus closed the merge window for Linux 6.16, and released the first release
candidate.  Linus says it felt fairly normal merge widnow, with under 13k
non-merge commits, about one thousand merges and 1783 unique authors.
