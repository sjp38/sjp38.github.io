---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-11-24T07:41:40+01:00
lastmod: 2020-11-24T07:41:40+01:00
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

[PATCH v2] mm: memcontrol: account pagetables per node (Shakeel Butt)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20201123161425.341314-1-shakeelb@google.com

This commit allows user to account memory size used for page tables per node.


[PATCH 0/2] userspace memory reaping using process_madvise (Suren Baghdasaryan)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201124053943.1684874-1-surenb@google.com

This commit allows user-space driven OOM reaping using
`process_madvise(MADV_DONTNEED)`.


[PATCH -V6 0/3] autonuma: Migrate on fault among multiple bound nodes (Huang Ying)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201126053219.234793-1-ying.huang@intel.com

The 6th version for autonuma migration among multiple bound nodes.  In this
version, more benchmark data and example is added.


Linux 5.10-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgSJRZPhfZ4QZhpb78uxRHwO3XLGQFJ5=+5rikOBgQ9rA@mail.gmail.com

Fortunately, it becomes calming.  Torvalds says he surprised by sudden increase
of the number of pull requests in last Friday, but things are normal overall.
So we could expect the v5.10 to be released in the supposed schedule.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc6..v5.10-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-11-30 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc6-only.png)
