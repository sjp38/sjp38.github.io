---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-10-11T10:21:51+02:00
lastmod: 2021-10-11T10:21:51+02:00
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

mmotm 2021-10-10-18-19 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211011012001.mSbkDke0y%akpm@linux-foundation.org

Update of mmotm.  33 new patches added and 7 old patches dropped.  285 patches
in total.


[PATCH v2 0/2] Introduce simple pidfd to task helper (Christian Brauner)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20211011133245.1703103-1-brauner@kernel.org

This patchset adds a simple helper to make code clean without duplications.


[PATCH v0.7 0/5] sched,mm,x86/uaccess: implement User Managed Concurrency Groups (Peter Oskolkov)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211012232522.714898-1-posk@google.com

This patchset implements the kernel parts for user-space m:n threading.  If
this is finalized and merged, user-space applications will be able to do the
scheduling of their threads on their own.


mmotm 2021-10-13-19-52 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211014025253._Y2qHd82A%akpm@linux-foundation.org

The -mm tree updated.  It's based on 5.15-rc5.  Compared to last update, 30
patches added, 38 patches modified, and 1 patch dropped.  In total, 314 patches
in the queue.


[PATCH v3] hugetlb: Support node specified when using cma for gigantic hugepages (Baolin Wang)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/bb790775ca60bb8f4b26956bb3f6988f74e075c7.1634261144.git.baolin.wang@linux.alibaba.com

This patch allows users to specify size of per-node CMA for hugetlb.


Linux 5.15-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjbXW13Eh6YnB4C5ghLrhJCq0u2bpSNA0JbK8eDb6o_XA@mail.gmail.com

The sixth release candidate for Linux v5.15 released a little bit later than
usual, due to Linus' travel.  Worse yet, this release ended up being bigger
than expected.  If rc7 is not quite small, v5.16 merge winodw will be dealyed
one week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc5..v5.15-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-10-18 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v5.15-rc6-only.png)
