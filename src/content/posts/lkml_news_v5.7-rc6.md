---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-05-16T09:55:20+02:00
lastmod: Mon May 18 06:26:47 CEST 2020
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

[PATCH v4 00/36] Large pages in the page cache (Matthew Wilcox)
---------------------------------------------------------------

https://lkml.kernel.org/r/20200515131656.12890-1-willy@infradead.org

This is the fourth version of the patchset for the huge pages in the page
cache.  Still it fails xfstests.


Maintainers / Kernel Summit 2020 planning kick-off (Theodore Y. Ts'o)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20200515163956.GA2158595@mit.edu

Ted annouced that the Maintainers / Kernel Summit will be held in virtual this
year, of course due to the COVID19.  With this announcement, the CFP for the
kernel summit is also opened.


Linux 5.7-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjP9eOr2GEpgtcpN4Hqve6YRiyEF5Pq6ZsKFKHZ_v5Bwg@mail.gmail.com

It's rc6, which is supposed to be calming down.  But, rc6 was bigger than
usual.  As rc5 was also bigger than usual, this probably not a good sign for
5.7 release.  But, no detailed change seems obviously wrong.

Torvalds just hope hings calm down.
