---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2019-12-25T10:01:47+01:00
lastmod: 2019-12-25T10:01:47+01:00
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

[PATCH V11 RESEND] mm/debug: Add tests validating architecture page table helpers
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/1577162322-30303-1-git-send-email-anshuman.khandual@arm.com

This patchset adds tests for the page table helpers.  Those tests covers basic
page table entry transformations including old, young, dirty, clean, write,
write protect etc.  The tests are not using the kselftest or kunit, but
implemented as a kernel module with new file, `mm/debug_vm_pgtable.c`.


Linux 5.5-rc4
-------------

https://lkml.kernel.org/r/CAHk-=wjq2b9GkLzpaDE-Xryu5c0zMM72BqkJKeZVsX+4ymH6aA@mail.gmail.com

Due to the holidays, last week was unsurprisingly quiet.  Torvalds says it was
hardly even worth making an rc release.  That said, there were some fixes for
cifs, io_uring, and kunit/selftest.
