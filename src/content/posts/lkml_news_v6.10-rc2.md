---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-05-28T06:34:57-07:00
lastmod: 2024-05-28T06:34:57-07:00
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

[PATCH 0/3] mm: zswap: global shrinker fix and proactive shrink (Takero Funaki)
-------------------------------------------------------------------------------

https://lore.kernel.org/20240528043404.39327-2-flintglass@gmail.com

This patchset fixes two zswap issues coming from global shrinker, and add
proactive shrinking of zswap which starts when zswap is 95% full, for 90%
accept threshold.


[PATCH v7 0/4] Memory management patches needed by Rust Binder (Alice Ryhl)
---------------------------------------------------------------------------

https://lore.kernel.org/20240528-alice-mm-v7-0-78222c31b8f4@google.com

Alice sent the seventh revision for making memory management subsystem changes
that needed by Rust Binder implementation.


[PATCH RFC v2 00/19] fuse: fuse-over-io-uring (Bernd Schubert)
--------------------------------------------------------------

https://lore.kernel.org/20240529-fuse-uring-for-6-9-rfc2-out-v1-0-d149476b1d65@ddn.com

This patchset adds support for uring communication between kernel and
user-space daemon for fuse performance increase.


Maintainers Summit 2024 Call for Topics (Theodore Ts'o)
-------------------------------------------------------

https://lore.kernel.org/20240531144957.GA301668@mit.edu

Ted posted the call for topics for Linux kernel maintainers' summit 2024.  It
will be held in parallel with LPC, Vienna, in September.


[CFP LPC 2024] Kernel Memory Management Microconference (Vlastimil Babka)
-------------------------------------------------------------------------

https://lore.kernel.org/ffc05b5d-9fd0-4926-807f-04f90adff255@suse.cz

Vlastimil posted CFP for kernel memory management microconference, which will
be held as a part of LPC this year, Vienna, in September.


[PATCH RFC 0/4] static key support for error injection functions (Vlastimil Babka)
----------------------------------------------------------------------------------

https://lore.kernel.org/20240531-fault-injection-statickeys-v1-0-a513fd0a9614@suse.cz

Vlastimil posted an RFC patchset for reducing slab or page allocation's
fastpath overhead that coming from error injection via static key support.


[syzbot] Monthly mm report (May 2024) (syzbot)
----------------------------------------------

https://lore.kernel.org/0000000000002bbe460619ba5f40@google.com

Syzbot posted a monthly report for May 2024.  Eight new issues have found and
one of those have fixed in the month.  56 issues are still open in total.


Linux 6.10-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wisJ8bS3qe6iBPwL9x=PqJA5oE7tum-E9oZfyPgd2mmrw@mail.gmail.com

Linus Torvalds released the second release candidate for Linux v6.10.  Driver
fixes, filesystems, and random things are the changes here, that evenly spread.
Linus Torvalds says nothing particularly odd, but that maybe just because
people didn't test.
