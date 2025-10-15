---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2019-12-30T17:54:23+01:00
lastmod: 2019-12-30T17:54:23+01:00
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

[PATCH v16 QEMU 4/3 RFC] memory: Add support for MADV_FREE as mechanism to lazy discard pages
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200103212339.29849.99817.stgit@localhost.localdomain

This RFC patch modifies QEMU to able to use `MADV_FREE` for discard of pages to
avoid the page zeroing cost.


Linux 5.5-rc5
-------------

https://lkml/kernel.org/r/CAHk-=whwmJQwwMD06VfPapDmc52LFQhG3HP6VyVLXVA=nYi_ow@mail.gmail.com

Time files, rc5 released.  Last week was also another calm week due to the new
year holidays, and thus this release is small.  Linus expects it will be
changed in this upcoming weeks, or 5.5 be the easiest release.

Also, Linus is delivering one sad news that Bruce Evans has passed away.  He
was the developer behind Minix/i386, which Linus has used for early development
of Linux.  Rest in peace, Bruce.
