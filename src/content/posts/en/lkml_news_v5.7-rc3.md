---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-04-22T06:44:31+02:00
lastmod: 2020-04-22T06:44:31+02:00
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

LSFMMBPF 2020 Cancellation announcement (Josef Bacik)
-----------------------------------------------------

https://lkml.kernel.org/r/0b6d3d6f-99de-3603-4b42-c3db5113633d@toxicpanda.com

Due to the COVID-19, LSFMM, which was supposed to be help April, has delayed
before, and now it has just canceled.  What a shame, but this might be the
right thing to do.  This mail also announce the schedule of next year LSFMM.
It will be held in Palm Springs, on May 12-14, 2021 at the Riviera Palm
Springs.


[PATCH 2/2] mm: support vector address ranges for process_madvise (Minchan Kim)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200423145215.72666-2-minchan@kernel.org

This is a modification of `process_madvise()` interface for support of multiple
address ranges.  In Android, the applications usually has thousands of vmas due
to the Zygote and thus need a number of `process_madvise()` calls to adjust
their memory.  The author has shown about 15% performance improvement by
comparing 2000-vma syscall and 1-vector syscall.


Linux 5.7-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiDq0imdGHZwCnvWM1bc8r++==fB4BDrfenAB9_CZ45+w@mail.gmail.com

The third release candidate is released.  Nothing weird, just normal, though
this release is bigger than rc2 and bigger than other rc3 of 5.x releases.

As always, drivers and tooling are noticeable.  In case of tooling, it must be
due to the pm-graph update.
