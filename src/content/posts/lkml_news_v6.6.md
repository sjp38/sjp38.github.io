---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-10-24T06:48:24-07:00
lastmod: 2023-10-24T06:48:24-07:00
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

Virtual Scanning Considered Harmful (Matthew Wilcox)
----------------------------------------------------

https://lkml.kernel.org/r/ZTc7SHQ4RbPkD3eZ@casper.infradead.org

Matthew shares his benchmark program that simulates speeds of LRU pages
traversal using an linked list, an array, and direct physical addresses.  As
can expect, the physical address based traversal is fastest.


[GIT PULL] hotfixes for 6.6 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20231024094608.f2dc0ca5ed2619d411a31df5@linux-foundation.org

Andrew sent mm hotfixes for v6.6 to Linus Torvalds.  One for DAMON also
contained.


[PATCH v4 0/5] workload-specific and memory pressure-driven zswap writeback (Nhat Pham)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231024203302.1920362-1-nphamcs@gmail.com

Patchset for improving zswap's writeback mechanism by doing it
workload-specific shrinking, and in memory pressure-driven way rather than only
user-defined limit based way.


[PATCH v7 0/3] mm: use memmap_on_memory semantics for dax/kmem (Vishal Verma)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231025-vv-kmem_memmap-v7-0-4a76d7652df5@intel.com

This patchset makes `memmap_on_memory` able to be done on more than memblock
size memory devices like dax/kmem.


[PATCH v7 00/10] Introduce `__mt_dup()` to improve the performance of fork() (Peng Zhang)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231027033845.90608-1-zhangpeng.00@bytedance.com

This patchset introduces a new function for maple tree duplication, namely
`__mt_dup()`.  It is assumed to improve the `fork()` performance since current
process is copying vmas one by one, while this will be more efficient.


[PATCH v2 0/4] mm/ksm: Add ksm advisor (Stefan Roesch)
------------------------------------------------------

https://lkml.kernel.org/r/20231028000945.2428830-1-shr@devkernel.io

This patchset introduces kernel samepage merge advisor, which automatically
manages the pages to scan setting, for achieving the target scan time.


Linux 6.6 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wiZuU984NWVgP4snp8sEt4Ux5Mp_pxAN5MNV9VpcGUo+A@mail.gmail.com

The last week was pretty calm, according to Linus Torvalds.  As a result, the
6.6 is out.  This also means the merge window for v6.7 has started.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.16-rc1..v6.6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-10-30 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
