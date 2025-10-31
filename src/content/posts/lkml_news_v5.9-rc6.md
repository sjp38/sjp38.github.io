---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-09-15T07:03:40+02:00
lastmod: 2020-09-15T07:03:40+02:00
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

[PATCH v14 0/5] KASAN-KUnit Integration (David Gow)
---------------------------------------------------

https://lkml.kernel.org/r/20200915035828.570483-1-davidgow@google.com

The 14th patchset for the KASAN and KUnit integration.  From the v13, compile
warnings in test_kasan_module fixed.


[PATCH v2 00/10] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200915132046.3332537-1-elver@google.com

The second version of the KFENCE posted.


[PATCH 1/2] fs: Add a filesystem flag for THPs (Matthew Wilcox)
---------------------------------------------------------------

https://lkml.kernel.org/r/20200916032717.22917-1-willy@infradead.org

This patchset caches whether the backing filesystem support THP or not in an
address space flags, so that the page cache can determine if it can send THP to
the backing filesystem or not.


[PATCH] mmap_lock: add tracepoints around lock acquisition (Axel Rasmussen)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20200917181347.1359365-1-axelrasmussen@google.com

This patchset adds tracepoints in the `mmap_lock()`, for debugging of the lock
contentions.


Linux 5.9-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjSWKpiNbcMpzQ9fBUA5s11sU-STLztzQkHhCHtYvLP5A@mail.gmail.com

Last week was again normally calm enough for rc6.  One thing that Torvalds
mentions is the removal of fbcon and vgacon.  Those were removed by Torvalds,
mainly because the parts has raised a few of security bugs but not actively
maintained now.  Torvalds told he will resurrect it only after people complain
and some maintainers come up.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc6..v5.9-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-09-21 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc6-only.png)
