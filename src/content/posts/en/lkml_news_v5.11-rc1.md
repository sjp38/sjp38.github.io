---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-12-15T07:32:20+01:00
lastmod: 2020-12-15T07:32:20+01:00
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

incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20201214190237.a17b70ae14f129e2dca3d204@linux-foundation.org

The pull request for v5.11 from Andrew Morton.  The `mmap_lock` tracepoint
patchset series is included in here.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20201215123253.954eca9a5ef4c0d52fd381fa@linux-foundation.org

Another pull request from Andrew Morton for memcg scalability improvement.
This makes per-memcg lru lock.


[PATCH 00/25] Page folios (Matthew Wilcox)
------------------------------------------

https://lkml.kernel.org/r/20201216182335.27227-1-willy@infradead.org

This is the patchset for the page folios, which Matthew proposed a few days ago
and discussed via zoom.


Do we still need skip swapcache logic in do_swap_page() for SWP_SYNCHRONOUS_IO? (Huang Ying)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/87y2hxgpo7.fsf@yhuang-dev.intel.com

A commit made swap cache logic for fast swap devices to be skipped, but a later
commit uses the swap cache for workingset detection.  Huang asks if the
skipping is still necessary.


[PATCH v10 00/11] Free some vmemmap pages of HugeTLB page (Muchun Song)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20201217121303.13386-1-songmuchun@bytedance.com

This patchset saves memory by freeing some vmemmap pages for hugetlbpage.  LWN
also covers this: https://lwn.net/Articles/839737/


[PATCH v4 00/10] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20201217185243.3288048-1-pasha.tatashin@soleen.com

4th version of the patchset for making ZONE_MOVABLE movable.


[RFC v2 PATCH 1/4] mm: make page reporing worker works better for low order page
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201221162806.GA22524@open-light-1.localdomain

This commit makes the free page reporting to release the zone lock
periodically, to avoid the free page reporting feature holds the lock too long,
due to huge number of low-order pages that need to be reported.


[RFC PATCH 0/3] add support for free hugepage reporting
-------------------------------------------------------

https://lkml.kernel.org/r/20201222074538.GA30029@open-light-1.localdomain

The free pages reporting feature reports only buddy pages, but the hugetlb
pages are not buddy pages because those are managed in the reservation scheme.
This RFC adds support for reporting of the hugetlb pages.


Linux 5.11-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg1+kf1AVzXA-RQX0zjM6t9J2Kay9xyuNqcFHWV-y5ZYw@mail.gmail.com

After two weeks, merge window finished with Christmas and 5.11-rc1 released.
Things worked well as expected.  Most pull requests received to Torvalds in the
first week, so that he could get the holiday week peaceful.  The size of the
rc1 is not so big, not so little, just as usual.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc2..v5.11-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-12-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc1-only.png)
