---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-08-08T06:55:38-07:00
lastmod: 2023-08-08T06:55:38-07:00
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

[RFC PATCH 0/3] Reduce NUMA balance caused TLB-shootdowns in a VM (Yan Zhao)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230808071329.19995-1-yan.y.zhao@intel.com

For virtual machines having assigned devices or VFIO mediated devices, all or
part of its memory are pinned for long-term.  Auto NUMA balancing can cause
unnecessary TLB-shootdowns.  This RFC patchset proposes a solution for that.


[PATCH v2] cma: introduce CMA_ALLOC_DEBUG config (Bibek Kumar Patro)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20230809131640.18791-1-quic_bibekkum@quicinc.com

`CONFIG_CMA_DEBUG` makes all CMA debugging message enabled.  This can results
in flooding the dmesg buffer.  This patch introduces another debugging config
that enable only cma bit allocation status.


[PATCH] mm: sparse: shift operation instead of division operation for root index (Gui Hui)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230810103829.10007-1-guohui@uniontech.com

This patch makes `__nr_to_section()` to use shift operation instead of division
operation to improve the performance.


[syzbot] Monthly mm report (Aug 2023) (syzbot)
----------------------------------------------

https://lkml.kernel.org/r/0000000000006518110602a0e0c0@google.com

Syzbot summarizes new and fixed bugs that it find from mm subsystem for last 31
days.  One new issue has found but no bug was fixed.  In total, 40 issues are
still open.


[MAINTAINER SUMMIT] coping with stress as a maintainer (James Bottomley)
------------------------------------------------------------------------

https://lkml.kernel.org/r/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com

James proposes a topic for the kernel maintainer summit of this year to discuss
about stress of maintainer works.


[GIT PULL] hotfixes for 6.5-rc6 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230811134809.5f1e6cfc690baaf796ff4072@linux-foundation.org

Andrew Morton sent a pull request for mm hotfixes to Linus Torvalds.


Linux 6.5-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wg4pV_H8bWsfWPQGkcPUyHdVApc6pf6eETkZAF_zxgNNw@mail.gmail.com

The AMD h/w mitigation patch was somewhat might looks like outstanding for the
last week.  Torvalds says other than that, everything looks normal, and even
argues h/w mitigations should be treated as normal, though such fixes would
require additional fixes for the fixes, mainly because those initial fixes are
usually made under embargo, without many eyeballs.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc7..v6.5-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-08-14 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.5-rc6-only.png)
