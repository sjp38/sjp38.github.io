---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-12-26T06:44:18-08:00
lastmod: 2023-12-26T06:44:18-08:00
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

[PATCH] kernel: Introduce a write lock/unlock wrapper for tasklist_lock (Maria Yu)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231225081932.17752-1-quic_aiquny@quicinc.com

A patch introducing a write lock/unlock wrapper for `tasklist_lock`, to
overcome bad responsive performance of system that coming from scenarios that
acquiring read lock which wrote lock needed to be waiting for.


[PATCH v3 00/10] IOMMU memory observability (Pasha Tatashin)
------------------------------------------------------------

https://lkml.kernel.org/r/20231226200205.562565-1-pasha.tatashin@soleen.com

Third version of patchset to allow monitoring and limiting IOMMU memory usage
is posted.


[GIT PULL] hotfixes for 6.7 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20231227150354.9437b5c792000b8eb22758e9@linux-foundation.org

Andrew sent yet another hotfixes for v6.7 to Linus Torvalds.


[PATCH RFC 00/12] x86 NUMA-aware kernel replication (Artem Kuzin)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20231228131056.602411-1-artem.kuzin@huawei.com

An RFC patchset for initial support of kernel text/rodata NUMA-aware
replication on x86_64 has posted.


[PATCH] mm: ratelimit stat flush from workingset shrinker (Shakeel Butt)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20231228073055.4046430-1-shakeelb@google.com

Shakeel found a regression due to rstat flush from `count_shadow_nodes()`, and
suggesting rate limiting it.


Linux 6.7-rc8 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whbyHgacqfOJ0VU_GxB-p=Cz+xsQ6XWrAEx=gT_QO9ERg@mail.gmail.com

As announced before, Linus made the eighth release candidate for v6.7 with
nearly nothing changes.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-01-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc8 releases in the last two years.

![rc8 release stat](/img/kernel_release_stat/linux_stat_v6.7-rc8-only.png)
