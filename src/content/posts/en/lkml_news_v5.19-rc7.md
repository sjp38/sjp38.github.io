---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-07-12T08:10:06-07:00
lastmod: 2022-07-12T08:10:06-07:00
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

[PATCH 0/4] add struct page and Direct I/O support to reserved memory (Li Chen)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220711122459.13773-1-me@linux.beauty

Only buffered I/O is available to reserved memory for `ZONE_DEVICE` and `mhp`.
This patchset enables direct I/O to the memory for better throughput.


[PATCH -V4 RESEND 0/3] memory tiering: hot page selection (Huang Ying)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20220713083954.34196-1-ying.huang@intel.com

This patchset implements a new hot page identification algorithm based on the
latency between NUMA balancing page table scanning and hit page fault, so that
it can be somewhat LFU algorithm instead of MRU algorithm.


[PATCH v9 0/8] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220714045351.434957-1-aneesh.kumar@linux.ibm.com

This patchset makes memory tiering management interface for creation of the
tier explicit.


[PATCH v4] mm: vmpressure: don't count proactive reclaim in vmpressure (Yosry Ahmed)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220714064918.2576464-1-yosryahmed@google.com

`memory.reclaim` is for reclaiming only cold memory, so vmpressure is not
needed.  This patch makes it to not trigger vmpressure.


Linux 5.19-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wj63HHDU0MTRVKese5a4j82g3s3u4Ztno7=7Cj=cRRFFQ@mail.gmail.com

The seventh release candidate of 5.19 has released as usual.  This release is
bigger than usual, due to the retbleed h/w vulnerability mitigation.  As the
mitigation was developed under the hood due to the embargo, and because there
are two more works ongoing, Torvalds will have one more unusual release
candidate next week, instead of the v5.19.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc7..v5.19-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-07-18 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v5.19-rc7-only.png)
