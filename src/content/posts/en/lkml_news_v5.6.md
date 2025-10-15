---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-03-28T09:22:44+01:00
lastmod: 2020-03-28T09:22:44+01:00
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

[PATCH v5 00/38] Add KernelMemorySanitizer infrastructure (glider)
------------------------------------------------------------------

https://lkml.kernel.org/r/20200325161249.55095-1-glider@google.com

This is the fifth official patchset for kernel uninitialized memory related
error detector, KMSAN.


[PATCH 1/2] mm: cma: NUMA node interface (Aslan Barikov)
--------------------------------------------------------

https://lkml.kernel.org/r/20200326212718.3798742-1-aslan@fb.com

CMA provides no way to specify what NUMA node the memory area to be allocated.
This commit adds the interface to specify the NUMA node to use for the
allocation.


[PATCH v3 00/10] Add a new mmap locking API wrapping mmap_sem calls (Michel Lespinasse)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200327225102.25061-1-walken@google.com

This patchset adds new mmap locking API rather than rwsem, but just wrapping
it.  This is for further step towards rwsem substitution with better one such
as range lock.  The new interface looks like `mmap_init_lock(mm)`,
`mmap_write_lock(mm)` and `mmap_read_lock(mm)`.


Linux 5.6
---------

https://lkml.kernel.org/r/CAHk-=wi9ZT7Stg-uSpX0UWQzam6OP9Jzz6Xu1CkYu1cicpD5OA@mail.gmail.com

As supposed, v5.6 of Linux has released after rc7.  However, the number of
changes during last week was a little bit larger than what Torvalds usually
likes for official releases.  Most of those was from David Miller's network
change and David was comfy, and diff was not so scary.  So, Torvalds has
reeleased 5.6.
