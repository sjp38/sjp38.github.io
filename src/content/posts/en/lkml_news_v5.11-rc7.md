---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-02-02T07:19:21+01:00
lastmod: 2021-02-02T07:19:21+01:00
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

[RFC 00/20] TLB batching consolidation and enhancements (Nadav Amit)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20210131001132.3368247-1-namit@vmware.com

This patchset prepares more aggressive TLB flushing batching by consolidating a
few TLB batching methods.


[PATCH v9 00/14] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20210201153827.444374-1-pasha.tatashin@soleen.com

This patchset makes `ZONE_MOVABLE` really movable by prohibiting pinning of
pages in the zone.


Augmented Page Reclaim (Yu Zhao)
--------------------------------

https://lkml.kernel.org/r/YBkT6175GmMWBvw3@google.com

This mail shares a part of decade researh/experimentation in memory overcommit
at Google.  The author wants to start submitting patch based on responses.  It
allows userspace to trigger aging and eviction via debugfs for working set
estimation, proactive reclaim, far memory tiering, NUMA-aware job scheduling,
and more.  The work adopted for mobile (Android), warehouse-scale computers
(Borg), and desktop (Chrome OS) and achieved impressive results.


[RFC -V5 0/6] autonuma: Optimize memory placement for memory tiering system (Huang Ying)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210204101056.89336-1-ying.huang@intel.com

This RFC patchset makes hot pages to placed in DRAM and cold pages in PMEM.
For hot pages identification, this patchset reuses the mechanism of AutoNUMA.
IOW, recently used pages are identified as hot.


Linux 5.11-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgxhBkWH0D6chYcwqDvdh2rB5ZVpToxodz5Q6qaFd_qyg@mail.gmail.com

The release candidate that is supposed to be the last one before the v5.11 is
released.  No surprise is there, so unless some scary things happen later,
v5.11 will be released next week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc7..v5.11-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-02-08 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc7-only.png)
