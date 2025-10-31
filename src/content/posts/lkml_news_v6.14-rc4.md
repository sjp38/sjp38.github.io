---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-02-19T07:11:05-08:00
lastmod: 2025-02-19T07:11:05-08:00
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

[Hypervisor Live Update] Notes from February 10, 2025 (David Rientjes)
----------------------------------------------------------------------

https://lore.kernel.org/dc1ee0c3-d3e7-4284-6329-346b8cea68b5@google.com

David shares hypervisor live update meeting summary.


[GIT PULL] hotfixes for 6.14-rc4 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20250219175311.7a5b47084de5ad0258526be2@linux-foundation.org

Andrew posted mm hotfixes for 6.14-rc4 to Linus Torvalds.


Rust kernel policy (Miguel Ojeda)
---------------------------------

https://lore.kernel.org/CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com

Miguel posted a mail about his blog post for the policy around Rust for Linux
kernel.  Long discussion is following.


[PATCH 0/2] Add a command line option that enables control of how many threads per NUMA node should be used to allocate huge pages. (Thomas Prescher)
-----------------------------------------------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250221-hugepage-parameter-v1-0-fa49a77c87c8@cyberus-technology.de

At boot time kernel uses two threads per NUMA node to allocate hugepages in
parallel.  Thomas says it is too slow for servers having terabytes of memory
and suggesting making it tunable with command line.


Linux 6.14-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wi9Aa_sgCjSncJ7odZX_f=v5WZwWm+GuwXmVy1O+wiBsw@mail.gmail.com

Linus Torvalds released the fourthe candidate for Linux v6.14.  He mentions it
is right kind of "boring" relelase that having usual driver fixes and various
fixes.
