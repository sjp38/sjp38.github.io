---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2019-12-18T20:33:01+01:00
lastmod: 2019-12-18T20:33:01+01:00
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

PROBLEM: Large (256MB) CMA allocation fails from time to time when using Intel VT-d
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/5e75d900cb50457784ee1d2050b511ec@MAILER13.tech.ceia

The author reports a CMA allocation failure that occurs time to time if the
system is using Intel VT-d.


[PATCHv2 0/3] Allow ZRAM to use any zpool-compatible backend
------------------------------------------------------------

https://lkml.kernel.org/r/20191219151928.ad4ccf732b64b7f8a26116db@gmail.com

ZRAM is an in-memory block device that compresses the content.  Currently, ZRAM
is used only with zsmalloc.  However, the zsmalloc is not an optimal selection
in some environment.  The author gives embedded environment which fast response
is important as an example.  In such environment, though compress ratio is a
little bit less, faster response (e..g, z3fold) is more valuable.  Thus, this
patchset changes ZRAM to be able to use multiple backend.


[PATCH RFC v4 00/42] Add KernelMemorySanitizer infrastructure
-------------------------------------------------------------

https://lkml.kernel.org/r/20191220184955.223741-1-glider@google.com

KMSAN detects errors related to uses of uninitialized memory.  With a help from
syzkaller, KMSAN has already reported more than 200 bugs in the past two years.
This patch aims to be merged in the mainline.


Regression seen when using `MADV_FREE` vs `MADV_DONTNEED`
---------------------------------------------------------

https://lkml.kernel.org/r/CAKgT0UeSs_qy8g5QoXpgcw2685+JtJPY+rehggraoGSYPrP1Aw@mail.gmail.com

The author introduced a patch using `MADV_FREE` instead of `MADV_DONTNEED` in
the QEMU.  On `next-20191120` kernel, it worked as the author expected.  On
`next-20191120`, however, the author was able to encounter an issue.  The
`MADV_FREE` has been significantly slower than `MADV_DONTNEED`.


Linux 5.5-rc3
-------------

https://lkml.kernel.org/r/CAHk-=wiGKfWeUv294FD6bs4cw0m=nO_LdZkLz-vkp-2zwBzLcA@mail.gmail.com

This release has delayed a couple of hors due to Christmas preparation, but
seems the Christmas has made no big effect to the development.  Rather than
that, this release is not only bigger than rc2 (rc3 is almost always bigger
than rc2), but also bigger than recent few other rc3 releases.

Torvalds assumes that this is just a normal fluctuation, as the changes are
spread around various subsystems.  Also, the merge window timing could made
some effect.  As Santa is coming to the town, Torvalds also believe that next
release will be more calm than now.  That said, he also asks some tests.
