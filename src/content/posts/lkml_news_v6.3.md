---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-04-18T07:35:18-07:00
lastmod: 2023-04-18T07:35:18-07:00
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

[PATCH 00/33] Split ptdesc from struct page (Vishal Moola)
----------------------------------------------------------

https://lkml.kernel.org/r/20230417205048.15870-1-vishal.moola@gmail.com

To reduce the `struct page` overhead, which is about 1.5% of the whole system
memory, people are working on to reduce some fileds in `struct page`.  As one
of the approach, this patchset prepares for splitting `ptdesc` from `struct
page`.


[RFC PATCH v1 0/5] Introduce objects folding mechanism (Alexey Romanov)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230418062503.62121-1-avromanov@sberdevices.ru

This patchset adds a feature which allowing folding identical zsmalloc objects
into single one.


[GIT PULL] hotfixes for 6.3 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20230419163823.f2a0f64f0ef67ddee54c2461@linux-foundation.org

Andrew Morton sent 22 hotfixes for Linux v6.3.


[RFC PATCH 00/26] mm: reliable huge page allocator (Johannes Weiner)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20230418191313.268131-1-hannes@cmpxchg.org

Johannes Weiner sent an RFC patchset for mitigating fragmentation issue and
therefore make THP allocation reliable.


[GIT PULL] slab updates for 6.4 (Vlastimil Babka)
-------------------------------------------------

https://lkml.kernel.org/r/a27e87a0-04f3-2f8e-2494-3036ed7dabc9@suse.cz

Vlastimil sent early slab subsystem pull request for v6.4 even before the merge
window is started.


Linux 6.3 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wg02PoScxDO0wwD5EkFpx50DF1c2TxXqyAnzGjdFf71jw@mail.gmail.com

In the normal release schedule, Linux 6.3 has released.  There are some mm
fixes in the last week changes, but it sounds scarier than it is.  Most fixes
are for kmsan like things, not the normal mm code.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc1..v6.3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
