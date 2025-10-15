---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2019-12-09T18:54:28+01:00
lastmod: 2019-12-09T18:54:28+01:00
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

[PATCHSET 0/5] Support for `RWF_UNCACHED`
-----------------------------------------

https://lkml.kernel.org/r/20191210162454.8608-1-axboe@kernel.dk

As the buffered IO uses the page cache, an intensive buffered IO workload using
very huge file can cause memory pressure by inflating the page cache.
Changing the workload to do direct IO can solve this problem, but the modification is not so simple.
Jens Axboe thus implemented `RWF_UNCACHED` flag, which skips use of the page
cache if the given IO target is not in the page cache already.
Jonathan Corbet has also introduced this patchset in LWN
(https://lwn.net/Articles/806980/).


Linux 5.5.-rc2
--------------

https://lkml.kernel.org/r/CAHk-=wgF1O8oPL9HRwRSrHt7NeLATtE5eZjcmP1QZfkcqE-+0g@mail.gmail.com

The first release right after the close of the merge window, namely rc2, is
usually calm because it is too early to find bugs.  This release was also did.
It's calm and normal.  Torvalds asks us for test.
