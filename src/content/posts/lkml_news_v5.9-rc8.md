---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-09-29T07:22:30+02:00
lastmod: 2020-09-29T07:22:30+02:00
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

[RFC PATCH v2 00/30] 1GB PUD THP support on x86_64 (Zi Yan)
-----------------------------------------------------------

https://lkml.kernel.org/r/20200928175428.4110504-1-zi.yan@sent.com

This patch adds support of 1GB THP using PUD.


[PATCH v4 00/11] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200929133814.2834621-1-elver@google.com

The 4th version of the KFENCE patchset.


[PATCH 0/5] Speed up mremap on large regions (Kalesh Singh)
-----------------------------------------------------------

https://lkml.kernel.org/r/20200930222130.4175584-1-kaleshsingh@google.com

This patchset optimizes `mremap()` by allowing memory regions to be able to
mapped at PMD/PUD.


[PATCH] selftests/vm: 10x speedup for hmm-tests
-----------------------------------------------

https://lkml.kernel.org/r/20201003011721.44238-1-jhubbard@nvidia.com

This patch reduces number of iteration of hmm-tests so it can run faster.


Linux v5.9-rc8 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wj-H5BYCU_kKiOK=B9sN3BtRzL4pnne2AJPyf54nQ+d=w@mail.gmail.com

As expected, rc8 instead of the v5.9 is released.  Torvalds is still waiting
some fixes from network part, but he also says it was really calm last week and
therefore he think this is the right time for the last week before the v5.9
release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc7..v5.9-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-10-05 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc8 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc8-only.png)
