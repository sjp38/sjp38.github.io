---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-05-26T07:04:14+02:00
lastmod: 2020-05-26T07:04:14+02:00
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

[PATCH v2 00/16] Introduce kvfree_rcu(1 or 2 arguments) (Uladzislau Rezki)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20200525214800.93072-1-urezki@gmail.com

This is the second version of the rcu-protected ``kvfree()``.


[PATCH v2 0/7] Add histogram measuring mmap_lock contention latency (Axel Rasmussen)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200528235238.74233-1-axelrasmussen@google.com

For further analysis of the ``mmap_sem`` overhead from both kernel space and
user space, this commit adds the latency historgram for ``mmap_sem``
acquisition time.  Actually, ``mmap_sem`` is now renamed into ``mmap_lock``,
thanks to Michel's patch.


[PATCH -V4] swap: Reduce lock contention on swap cache from swap slots allocation (Huang, Ying)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200529010840.928819-1-ying.huang@intel.com

Fourth version of the swap slot allocation locking contention reduction patch.
Previous version was also introduced in my previous posting.


[PATCH v5 00/39] Large pages in the page cache (Matthew Wilcox)
---------------------------------------------------------------

https://lkml.kernel.org/r/20200529025824.32296-1-willy@infradead.org

Fifth version of the page cache large pages work.  The previous version was
also introduced in my previous posting.  It passes a little more test cases in
xfstests than v4 did, but seems it still not entirely passes.


Linux 5.7
---------

https://lkml.kernel.org/r/CAHk-=wiZGrCkiBB1V7bxp8NZH6yWi9mPM4ptMW16OzOiNprBFA@mail.gmail.com

Nothing worrisome happend, and therefore 5.7 has released, as expected.  In
other words, the merge window for 5.8 is open.
