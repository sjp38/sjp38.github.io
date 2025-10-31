---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-04-30T06:57:24+02:00
lastmod: 2020-04-30T06:57:24+02:00
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

[PATCH 0/7] Record the mm_struct in the page table pages (Matthew Wilcox)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20200428194449.22615-1-willy@infradead.org

Literally, this patchset adds the `mm_struct` pointer to `struct page` if it is
used for page tables.  This will be useful for several cases usch as
uncorrectable errors handling and task-page table relation checking, etc.


[PATCH v4] mm: Proactive compaction (Nitin Gupta)
-------------------------------------------------

https://lkml.kernel.org/r/20200428221055.598-1-nigupta@nvidia.com

This patchset makes the compaction to be more proactively done for better THP
allocation success and makes user to be able to control the proactiveness using
a sysfs file, `/sys/kernel/mm/compaction/proactiveness`.

The main changes from the v3 of this patchset is add of documentations.


[PATCH v3 00/25] Large pages in the page cache (Matthew Wilcox)
---------------------------------------------------------------

https://lkml.kernel.org/r/20200429133657.22632-1-willy@infradead.org

This patchset is for use of huge pages in the page cache.  This will reduce
many of overheads.  However, this patchset doesn't pass the xfs test.


Linux 5.7-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjRQPn6zQnR2R2M6rupXq8OZTk7z9xJsUbgEADpZFX+NA@mail.gmail.com

The release candidate release of this week is a bit smaller than usual.  It's
smallest rc4 since the tiny one we had over the Christmas week.  Torvalds think
this is due to a timing issue and because there was no pull request from
network.  That said, he also says things are calm.
