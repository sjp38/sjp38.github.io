---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-04-05T08:41:57+02:00
lastmod: 2020-04-05T08:41:57+02:00
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

[GIT PULL] XArray for 5.7-rc1
-----------------------------

https://lkml.kernel.org/r/20200331141749.GB21484@bombadil.infradead.org

Matthew's XArray pull request for 5.7 merge window.  Quickly merged by Torvald.


[PATCH v5 00/10] workingset protection/detection on the anonymous LRU list
--------------------------------------------------------------------------

https://lkml.kernel.org/r/1585892447-32059-1-git-send-email-iamjoonsoo.kim@lge.com

The fifth version of the workingset protection.


[PATCH v4 0/2] mm: using CMA for 1 GB hugepages allocation
----------------------------------------------------------

https://lkml.kernel.org/r/20200407010431.1286488-1-guro@fb.com

This patchset make hugetlb to use CMA for 1GB hugepage allocations.


[PATCH RFC] mm: compaction: avoid migrating non-cma pages to a cma area
-----------------------------------------------------------------------

The compaction algorithm doesn't distinguish CMA from other movable pageblocks.
In other words, it can move non-cma pages into a cma zone.  This patch avoid
the problem by preserving non-cma pages from being moved into a cma area.


Linux 5.7-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wh0F0fnOQA3dr_-QCdjc_FTTk3ccPFLU33zr3zLD9FQ7Q@mail.gmail.com

The merge window for Linux 5.7 has closed about one or two hours earlier than
usual, due to the Easter Sunday.

Torvalds says the merge window was pretty normal.  Not too big, not too small.
The distribution of patches also seems quite normal.

The kernel technical advisotry board (TAB) asked Torvalds to announce that they
would help people struggling their kernel work from COVID-19.
