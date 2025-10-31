---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-05-23T07:41:12-07:00
lastmod: 2023-05-23T07:41:12-07:00
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

[PATCH 0/9] Mitigate a vmap lock contention (Uladzislau Rezki)
--------------------------------------------------------------

https://lkml.kernel.org/r/20230522110849.2921-1-urezki@gmail.com

Uladzislau sent a patchset for vmap lock contention mitigation, as suggested at
LSFMM+BPF.


[PATCH] mm: deduct the number of pages reclaimed by madvise from workingset (Zhaoyang Huang)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1684919574-28368-1-git-send-email-zhaoyang.huang@unisoc.com

Pages reclaimed by `madvise()` with `MADV_PAGEOUT` hint doesn't handle the
workingset, hence leads to large refault distance than it should be.  This
patch addresses the case by making `reclaim_pages()` to receive `mm_struct` and
deduct the pages from workingset.

[V2 patch 3/6] mm/vmalloc: Prevent flushing dirty space over and over (Thomas Gleixner)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230525124504.692056496@linutronix.de

To avoid each `_vm_unmap_aliases()` call flushes dirty ranges, this patch
resets the flush range after accounting for it.


[PATCH 00/10] Docs/mm/damon: Minor fixes and design doc update (SeongJae Park)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230525214314.5204-1-sj@kernel.org

Probably partly as a response to the feedback from LSFMM session, DAMON
documentation update patch has sent.


Linux 6.4-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whwNMtwpMxcsdC4bysY+5E9E_wNeUz=R-iciy3DJwQ+vg@mail.gmail.com

The fourth release candidate of Linux v6.4 has released a few hours earler than
usual, because Linus will be traveling most of the day.  Changes are all usual
and normal, though.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc5..v6.4-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-05-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.4-rc4-only.png)
