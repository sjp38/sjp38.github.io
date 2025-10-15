---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-03-05T06:22:38-08:00
lastmod: 2024-03-05T06:22:38-08:00
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

[RFC 01/16] mm/hmm: let users to tag specific PFNs (Leon Romanovksy)
--------------------------------------------------------------------

https://lkml.kernel.org/r/a77609c9c9a09214e38b04133e44eee67fe50ab0.1709631413.git.leon@kernel.org

This RFC patchset introduces new flag that allows users to tag specific PFNs
with extra data.


[PATCH V3 01/10] mm: page_alloc: freelist migratetype hygiene (Johannes Weiner)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240306041526.892167-1-hannes@cmpxchg.org

Whne pages of one migratetype end up on the freelists on another type,
migratetype violations happen.  This third version of patchset fixes it.


[PATCH 0/8] tracing: Persistent traces across a reboot or crash (Steven Rostedt)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240306015910.766510873@goodmis.org

Steven sent a proof of concept patchset for letting traces available across a
reboot.


[PATCH v5 00/37] Memory allocation profiling (Suren Baghdasaryan)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20240306182440.2003814-1-surenb@google.com

Surent posted the fifth version of the memory allocation profiling patchset
which uses a new framework, code tagging, internally.


[GIT PULL] hotfixes for 6.8 (Linus Torvalds)
--------------------------------------------

https://lkml.kernel.org/r/20240307162059.88fcc2a013c9ce1f3f72042d@linux-foundation.org

Andrew Morton sent a small pull request for hotfixes.


Linux 6.8 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wiehc0DfPtL6fC2=bFuyzkTnuiuYSQrr6JTQxQao6pq1Q@mail.gmail.com

It was not super clear if the final 6.8 will be released or not this week,
since the number of changes didn't reduce as Linus hoped a few weeks ago.  But
the last two weeks were pretty calm and Linus find no real problematic changes,
so he released the final 6.8.  Linus also notes that the number of git objects
for the mainline may exceed 10 million soon.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-03-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
