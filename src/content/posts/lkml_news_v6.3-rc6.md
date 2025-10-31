---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-04-04T08:14:59-07:00
lastmod: 2023-04-04T08:14:59-07:00
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

[PATCH 0/6] Avoid the mmap lock for fault-around (Matthew Wilcox)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20230404135850.3673404-1-willy@infradead.org

A patchset for gradually pushing the mmap lock down.  No specific regression
found, but also no special performance improvement measured.


[PATCH] memcg-v1: Enable setting memory min, low, high (Shaun Tancheff)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230405110107.127156-1-shaun.tancheff@gmail.com

For users who cannot update to memcg v2, this patch provides a way for memcg v1
to effectively apply memory pressure, which can be used for effectively
throttle file I/O.


Slab-vs-Slub benchmarks (Binder Makin)
--------------------------------------

https://lkml.kernel.org/r/CAANmLtz=vJxeTT31npwvnMSy8n4zQq0cs3ORZB3MxAnXHck-Lg@mail.gmail.com

As Vlastimil's work on reducing slab allocators is ongoing, Binder is running
benchmarks to show if it really not hurt corner cases.  Binder lists up his
benchmarks to run for this, and asking people's opinion about the list.


[RFC PATCH] mm: introduce defer free for cma (Zhaoyang Huang)
-------------------------------------------------------------

https://lkml.kernel.org/r/1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com

This RFC makes CMA-allocated memory deallocation to be deferred so that later
continuous memory allocation less likely fail.


Linux 6.3-rc6 (Linus Torvalds)
------------------------------

`https://lkml.kernel.org/r/CAHk-=wi=_UHtmSy-3jB0ZJ7sAPULLy4a86HP3DpYX-C3eu+wpg@mail.gmail.com`

Even in Easter Sunday, Linux release process continues.  The sixthe release
candidate for Linux v6.3 has released with the regular pattern.  Nothing
unusual so far.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc8..v6.3-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-10 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.3-rc6-only.png)
