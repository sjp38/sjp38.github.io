---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-06-14T07:06:16-07:00
lastmod: 2022-06-14T07:06:16-07:00
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

[PATCH 0/8] Extend DAMOS for Proactive LRU-lists Sorting (SeongJae Park)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220613192301.8817-1-sj@kernel.org

After the RFC, official patchset for DAMON-based LRU-lists sorting has posted.
This immediately merged in the -mm tree.


[PATCH v12 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------

https://lkml.kernel.org/r/20220614071650.206064-1-yuzhao@google.com

A new version of MGLRU has posted.  Compared to the previous version, this
version fixes a bug and nits, and contains new test results based on v5.19-rc1.


Maintainer's / Kernel Summit 2022 CFP (Theodore Ts'o)
-----------------------------------------------------

https://lkml.kernel.org/r/YqlfARL0wsi2yz1j@mit.edu

As similar to previous years, the kernel summit of this year will be co-located
with LPC as a track, and the maintainers summit of this year will be held just
after the LPC for three days.


[PATCH] mm/smaps: add Pss_Dirty (Vincent Whitchurch)
----------------------------------------------------

https://lkml.kernel.org/r/20220615071252.1153408-1-vincent.whitchurch@axis.com

This patch adds a new field in ``smaps`` file, which helps users to know
determining how much of the Pss is from dirty pages.


[TECH TOPIC] Current Status and Future Plans of DAMON (SeongJae Park)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20220616224306.92076-1-sj@kernel.org

A kernel summit talk submission for DAMON has posted.


[PATCH v3 0/2] make hugetlb_optimize_vmemmap compatible with memmap_on_memory (Muchun Song)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220617135650.74901-1-songmuchun@bytedance.com

This patchset makes the hugetlb vmemmap optimization compatible with
`memmap_on_memory`.


Linux 5.19-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgErDgDFbU9astx+NTUu_KNi-jgzfF6RGup=cVee6+U=g@mail.gmail.com

A fairly small third release candidate for 5.19 has released.  The changes are
mostly for documentation, but also those for code are spread to drivers,
architectures, core, and networking.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc2..v5.19-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-06-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v5.19-rc3-only.png)
