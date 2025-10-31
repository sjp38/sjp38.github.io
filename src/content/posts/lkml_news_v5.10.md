---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-12-08T07:10:59+01:00
lastmod: 2020-12-08T07:10:59+01:00
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

[RFC V2 00/37] Enhance memory utilization with DMEMFS (Yuley Zhang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1607332046.git.yuleixzhang@tencent.com

This patchset aims to remove the 'struct page' from user-sepcified region of
memory and use a file system called 'dmemfs' to minimize the memory region
dedicated for 'struct page's.


[PATCH] mm: don't SetPageWorkingset unconditionally during swapin (Yu Zhao)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20201209012400.1771150-1-yuzhao@google.com

Unconditional 'SetPageWorkingset' miscategorizes read-ahead pages or pages that
never belong to the working set as working set because it's called
unconditionally.  This patch simply remove the unconditional call.


[PATCH v2 0/8] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20201210004335.64634-1-pasha.tatashin@soleen.com

This pathset makes pages in 'ZONE_MOVABLE' really movable by forcing new
allocations during page pinning to omit the zone and migrate pages away when
pinning.


[PATCH 00/28] RFC mm: Introducing the Maple Tree (Liam R. Howlett)
------------------------------------------------------------------

https://lkml.kernel.org/r/20201210170402.3468568-1-Liam.Howlett@Oracle.com

Maple tree is a range based B-tree designed to use modern processor cache
efficiently.  It's design presented in several venues before, and the RFC code
is finally available.  It initially designed for replacement of vma tree for
reduction of the 'mmap_sem' contention.  This patchset also does some of the
replacement and shows impressive performance with benchmarks.


Zoom call about Page Folios tomorrow (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/20201210210519.GC7338@casper.infradead.org

Matthew wants to have a zoom call to share his idea called Page Folios.  He
decided to use Zoom call because in-person conference is not there anywhere for
now.


Linux 5.10 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=whCKhxNyKn1Arut8xUDKTwp3fWcCj_jbL5dbzkUmo45gQ@mail.gmail.com

The v5.10, the next LTS release is out now.  The final week for the release was
calm enough to convince Linus.  This also means the merge window for v5.11
opened.  Because of the timing with the holiday season, Torvalds says this
merge window will be more strict than last one.  All pull requests are strictly
required to be ready before the merge window open.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20..v5.10.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-12-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
