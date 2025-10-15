---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-09-26T06:50:25-07:00
lastmod: 2023-09-26T06:50:25-07:00
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

[PATCH v3 0/4] Smart scanning mode for KSM (Stefan Roesch)
----------------------------------------------------------

https://lkml.kernel.org/r/20230926040939.516161-1-shr@devkernel.io

KSM scans pages without historic information, so pages that already found to be
not eligible for deduplication are scanned unnecessarily.  This patchset
introduces smart scanning for KSM, which utilizes the historic information.


[PATCH -V2 00/10] mm: PCP high auto-tuning (Huang Ying)
-------------------------------------------------------

https://lkml.kernel.org/r/20230926060911.266511-1-ying.huang@intel.com

This patchset implements auto-tuning of Per-CPU Pageset high to optimize page
allocation performance.


[PATCH rfc 0/5] mm: improve performance of kernel memory accounting (Roman Gushchin)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230927150832.335132-1-roman.gushchin@linux.dev

This RFC patchset reduces the kernel memory accounting overhead by removing
unnecessary ``memcg->objcg`` conversions and use scope-based protection of
``objcg``s.  According to the author's microbenchmark, the overhead has reduced
by about 30 %.


[GIT PULL] slab fixes for 6.6-rc4 (Vlastimil Babka)
---------------------------------------------------

https://lkml.kernel.org/r/70699482-f413-d7b8-6378-48bc915d1ecb@suse.cz

Vlastimil sent a slab fixes pull request to Linus Torvalds.


[GIT PULL] hotfixes for 6.6-rc4 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20231001083937.5f401972d99dc3168e6d4218@linux-foundation.org

Andrew sent hotfixes for mm and non-mm to Linus Torvalds.

Linux 6.6-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wia2-4DRvD-aXz70AV64yrt+Vr50MxHiDunZ71dHATv-Q@mail.gmail.com

This time, there was no networking pull for rc4, which made it samller than
usual.  Maybe due to the fact that netconf being held last week?  Other than
that, all looks normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc5..v6.6-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-10-02 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.6-rc4-only.png)
