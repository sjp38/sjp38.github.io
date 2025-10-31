---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-07-22T06:48:06+02:00
lastmod: 2020-07-22T06:48:06+02:00
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

[PATCH 0/6] mm: introduce secretmemfd system call to create "secret" memory areas (Mike Rapoport)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200720092435.17469-1-rppt@kernel.org

This patchset make another special kind of file for secret memory areas.  The
file can be opened using ``secretmemfd()``.  ``mmap()`` of the file creates the
secret memory mapping.  The mapped pages are marked as not present in the
direct map and will have desired protection bits (e..g, uncached).


[PATCH v7 0/6] workingset protection/detection on the anonymous LRU list (js1304@gmail.com)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1595490560-15117-1-git-send-email-iamjoonsoo.kim@lge.com

The seventh version of the workingset protection code.  In this version, some
bugs in code and the workingset detection formula fixed.


Linux 5.8-rc7
-------------

https://lkml.kernel.org/r/CAHk-=wgcJ-dtTf+kY1Qj0F786gYqShJU19BguJHruQ2J4vZxOw@mail.gmail.com

This release is slightly larger than what Torvalds would like.  Nothing seems
worrisome, but Torvalds thinks this might mean rc8 isrequired.  He will see how
this goes one more week and make the final decision.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc8..v5.8-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-07-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc7-only.png)
