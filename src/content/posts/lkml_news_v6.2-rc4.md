---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-01-10T07:34:41-08:00
lastmod: 2023-01-10T07:34:41-08:00
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

[PATCH 00/41] Per-VMA locks (Suren Baghdasaryan)
------------------------------------------------

https://lkml.kernel.org/r/20230109205336.3665937-1-surenb@google.com

For the `mmap_lock` scalability issue, yet another approach called per-VMA
locks has posted.


[PATCH v2 0/2] docs/mm: start filling out new structure (Mike Rapoport)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230110152358.2641910-1-rppt@kernel.org

MM kernel documentation has restructured to be somewhat more like textbook that
can better explaining overall concept and how it manage memory, but the content
is empty.  Mike starts filling the content.


LSFMMBPF proposal [General/MM]: SRCU: a case study in memory ordering (Joel Fernandes)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAEXW_YQSkai0-oeZVmWjMr3vZF-uvq-S=6Dxx_BueMOkNHGutw@mail.gmail.com

A session proposal for LSF/MM/BPF of this year has posted.  Joel proposes to
introduce SRCU and discuss how Linux Kernel Memory Model can be improved.


[PATCH 00/28] Get rid of tail page fields (Matthew Wilcox)
----------------------------------------------------------

https://lkml.kernel.org/r/20230111142915.1001531-1-willy@infradead.org

This patchset removes two fileds in `struct page`, which were for pointing
first and second tail pages, appropriately, to shrink the `struct page`
definition.


[LSF/MM/BPF TOPIC] tracing mapped pages for quicker boot performance (Steven Rostedt)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230112132153.38d52708@gandalf.local.home

Steven Rostedt proposes a LSF/MM/BPF session for discussing if there could be a
way to add traceevents like things to let applications know exactly what pages
in a file are being read from disk.


[PATCH 0/6 v3] Discard `__GFP_ATOMIC` (Mel Gorman)
--------------------------------------------------

https://lkml.kernel.org/r/20230113111217.14134-1-mgorman@techsingularity.net

A new version of `Discard __GFP_ATOMIC` patchset rewritten by Mel has posted.


Linux 6.2-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgcOEWvT-WjmRf-zCCXyFJaVVFH=26BPQ+N1OFTTnN=RA@mail.gmail.com

The fourth release candidate for Linux v6.2 has released.  Seems people are
back from holidays.  Everything looks normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc5..v6.2-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-01-16 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.2-rc4-only.png)
