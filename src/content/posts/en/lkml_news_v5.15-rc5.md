---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-10-05T07:39:10+02:00
lastmod: 2021-10-05T07:39:10+02:00
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

[PATCH 0/2] Introduce simple pidfd to task helper (Christian Brauner)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20211004125050.1153693-1-christian.brauner@ubuntu.com

This patchset adds a pidfd handling wrapper for removing duplications.


[PATCH 00/62] Separate struct slab from struct page (Matthew Wilcox)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20211004134650.4031813-1-willy@infradead.org

This huge patchset separates `struct slab` from `struct page` to make
`struct page` simple and therefore easier to handle.


[PATCH v3 00/66] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20211005012959.1110504-1-Liam.Howlett@oracle.com

This patchset introduces Maple tree, which is intended to replace the rb tree
for vmas, to improve the scalability.


mmotm 2021-10-05-19-53 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211006025350.a5PczFZP4%akpm@linux-foundation.org

MMOTM updated. 11 patches drop, 47 patches added, and 29 patches modified.
DAMOS also added here.


[RFC] pgflags_t (Matthew Wilcox)
--------------------------------

https://lkml.kernel.org/r/YV25hsgfJ2qAYiRJ@casper.infradead.org

This patch makes `struct page->flags` a struct instead of the plain `unsigned
long` for enhance its type safety.


Compaction & folios (Ken Overstreet)
------------------------------------

https://lkml.kernel.org/r/YV4o9SxfYuLm1i4d@moria.home.lan

This mail explains how folios can make compaction and hugepages easier.


[PATCH v2] mm/huge_memory.c: disable THP with large THP size on small present memory (Peng Hao)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAPm50aLPxJCiVTqqwiz00oMNiqHggB84sXB3x=tv_HUAd5UktQ@mail.gmail.com

`min_free_kbytes` is calculated based on THP size.  Because THP size could be
quite big depends on the system configuration, `min_free_kbytes` could also be
huge.  For example, on ARM64 with 64 KiB page size, THP is 512 MiB and the
`min_free_kbytes` is about 3 GiB.

This commit therefore judge if THP should be enabled or not by default using
the THP size.


[PATCH -V9 0/6] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211008083938.1702663-1-ying.huang@intel.com

Nineth revision of NUMA balancing for tiered memory system.  This patchset
applies the basic NUMA balancing, hot page selection algorithm, and automatic
threshold adjustment step by step.


[PATCH 0/3] mm, thp: introduce a new sysfs interface to facilitate file THP for .text (Rongwei Wang)
----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211009092658.59665-1-rongwei.wang@linux.alibaba.com

This patchset adds a new THP interface called `hugetext_enabled` for easier
enablement of THP for text sections of processes, and make binaries built with
`--pie -fPIC` and LOAD alignment smaller than 2M, change `maximum_alignment` to
2M, for making those better at applying THP.


Linux 5.15-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiTZxkHVg=Pz7XRd-9AEDp0qV5sWmQJWnQ4NrSPYRHNiA@mail.gmail.com

The fifth release candidate for v5.15 is released.  Just a normal one.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc4..v5.15-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-10-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v5.15-rc5-only.png)
