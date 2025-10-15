---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML NEws v5.12-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-04-13T07:37:08+02:00
lastmod: 2021-04-13T07:37:08+02:00
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

[PATCH v2 0/5] mm/memcg: Reduce kmemcache memory accounting overhead (Waiman Long)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210412225503.15119-1-longman@redhat.com

Recently introduced new slab memory controller eliminates the need for separate
kmemcaches for each memory cgroup and therefore reduce kernel memory usage.
However, it also increases memory accouning overhead in kmem cache alloc and
free functions.  This patchset reduces unnecessary `local_irq_save()` and
`local_irq_restore()` sequences in the code path as much as possible for
minimal overhead.


[PATCH v7 0/7] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210413104747.12177-1-osalvador@suse.de

This patchset makes Hugetlb pages to be able to be allocated via
`alloc_contig_range()`, which is also used by CMA.


[RFC] mm: support multi_freearea to the reduction of external fragmentation (lipeifeng)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210414023803.937-1-lipeifeng@oppo.com

This patch sorts sorts the free pages in buddy so that low-order pages
allocation done in the front area of memory while the high-order pages
allocation done in the back area of memory.  As a result, the high-order pages
allocation could success more easily.


[PATCH v8 0/7] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210415103544.6791-1-osalvador@suse.de

New version of the patchset.  Collected 'Reviewed-by's and 'Acked-by's.


[PATCH 00/13] [RFC] Rust support (Miguel Ojeda)
-----------------------------------------------

https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/

This is the RFC for Rust support in Linux build system.


[PATCH 1/2] mm/vmscan: add sync_shrinkers function (Christian Koenig)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20210415115624.2904-1-christian.koenig@amd.com

This patchset adds a new function `sync_shrinkers()`, which prevents a race
between, for example, shrinkers trying to free pages and hotplug trying to
remove the device which having the pages.


[PATCH v2] mm/compaction:let proactive compaction order configurable (chukaiping)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/1618593751-32148-1-git-send-email-chukaiping@baidu.com

The proactive compaction has fixed value '9' for `COMPACTION_HPAGE_ORDER`.
This doesn't make sense for machines having less than 9 max order of free
pages, because it would trigger compactions too frequently.  For example,
machines configured with 1GB hugetlbfs huge pages.  This patch exports the
order to procfs so that admins could configure it.


Linux 5.12-rc8 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjgVFDhX60fxwDobHoqJvVkuxf=JgSTtGnGMa5r-1u4Yw@mail.gmail.com

The last week was calm, but not calm enough to avoid rc8 release.  This is
fifth rc8 release for 5.x series.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc7..v5.12-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-04-19 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc8-only.png)
