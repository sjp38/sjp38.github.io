---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-05-07T06:56:23+02:00
lastmod: 2020-05-07T06:56:23+02:00
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

[RFC 00/43] PKRAM: Preserved-over-Kexec RAM (Anthony Yznaga)
------------------------------------------------------------

https://lkml.kernel.org/r/1588812129-8596-1-git-send-email-anthony.yznaga@oracle.com

This patchset introduces special memory called PKRAM.  It can be used to
preserve VM guest memory across kexec boot for fast restart (VMM Fast Restart).
Compared to DRAM based PMEM simulation, PKRAM is more flexible as the memory
size is not need to be previously fixed.


[PATCH] mm: Replace zero-length array with flexible-array (Gustavo A. R. Silva)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200507185942.GA15193@embeddedor

The zero-length array of C90 are widely used in the kernel code base, but the
flexible array member of C99 would be better choice.  This commit replaces the
code to use the flexible array member instead.


Linux 5.7-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi5ziqqgf9dMfwoNLy8A1SX36n1RuDYTyRX6O_Vmcr42g@mail.gmail.com

Last 4 rc releases were slightly smaller than usual, but this week's rc release
is bigger, though it is still in line of average.  This is maybe simply due to
the delayed pull requests from network and some drivers and thus nothing is
worrisome, Torvalds says.
