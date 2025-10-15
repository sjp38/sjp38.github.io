---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-10-22T07:40:31-07:00
lastmod: 2024-10-22T07:40:31-07:00
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

[PATCH v1 0/6] mm/arm64: re-enable HVO (Yu Zhao)
------------------------------------------------

https://lore.kernel.org/20241021042218.746659-1-yuzhao@google.com

There were a few attempts to enable hugetlb vmemmap optimization (HVO) on
arm64.  Yu posted another approach.


linus-next: improving functional testing for to-be-merged pull requests (Sasha Levin)
-------------------------------------------------------------------------------------

https://lore.kernel.org/ZxZ8MStt4e8JXeJb@sashalap

Sasha proposes having a new test-purpose tree for Linus' concern about testing.


Re: [GIT PULL] bcachefs fixes for 6.12-rc5 (Sasha Levin)
--------------------------------------------------------

https://lore.kernel.org/Zxf3vp82MfPTWNLx@sashalap

Following the feedback to linus-next proposal, Sasha implemented a bot for
simple pre-merge check of pull requests, and showcase it on a random pull
request.


[PATCH] MAINTAINERS: Remove some entries due to various compliance requirements. (Greg Kroah-Hartman)
-----------------------------------------------------------------------------------------------------

https://lore.kernel.org/2024101835-tiptop-blip-09ed@gregkh

Some entires of MAINTAINERS file has removed.  The patch explains that's due to
various compliance requirements.  People suspect that maybe due to the war.


[PATCH] mm: Fix PSWPIN counter for large folios swap-in (Barry Song)
--------------------------------------------------------------------

https://lore.kernel.org/20241023210201.2798-1-21cnbao@gmail.com

Barry posted a patch for fixing pswpout count to be based on base pages, like
that for pswpin count.


[PATCH v1 0/6] memcg-v1: fully deprecate charge moving (Shakeel Butt)
---------------------------------------------------------------------

https://lore.kernel.org/20241025012304.2473312-1-shakeel.butt@linux.dev

Shakeep posted a patchset for deprecating charging moving feature of memory
control group v1.


FOSDEM 2025: Kernel Devroom CfP (Mike Rapoport)
-----------------------------------------------

https://lore.kernel.org/Zx32HLJAKlW-RZk6@kernel.org

Mike posted a CFP for kernel devroom at FOSDEM.  The proposal deadline is 1st
December.  The kernel devroom will run on Sunday 2nd of February, at Brussels,
Belgium.


Linux 6.12-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whHB3RxR15Xk8Epah8ZrRJi-7ZevSu6kBp0MFtjXEvM-w@mail.gmail.com

Linus released the fifth candidate of Linux v6.12.  Unlike the rc4, which was
unusually large, this time the stat has returned to normal, or a small side of
the normal.
