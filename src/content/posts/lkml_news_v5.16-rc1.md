---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-11-02T07:10:11+01:00
lastmod: 2021-11-02T07:10:11+01:00
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

[PATCH v4 0/3] mm: add new syscall set_mempolicy_home_node (Aneesh Kumar K.V)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20211101050206.549050-1-aneesh.kumar@linux.ibm.com

This patchset introduces a new syscall that can be used to set a home node for
the `MPOL_BIND` and `MPOL_PREFERRED_MANY`.


[RFC PATCH 0/3] Improve the migration stats (Baolin Wang)
---------------------------------------------------------

https://lkml.kernel.org/r/cover.1635936218.git.baolin.wang@linux.alibaba.com

This RFC patchset fixes the migration stats that broken here and there.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211105133408.cccbb98b71a77d5e8430aba1@linux-foundation.org

The first pull request for v5.16 from Andrew Morton.  Patches for DAMON
subsystem including DAMOS, physical address space support, and DAMON-based
proactive reclamation are also included here.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211108183057.809e428e841088b657a975ec@linux-foundation.org

Second pull request from Andrew Morton to Linus Torvalds for v5.16-rc1 is sent.


[PATCH v5 00/10] Multigenerational LRU Framework (Yu Zhao)
----------------------------------------------------------

https://lkml.kernel.org/r/20211111041510.402534-1-yuzhao@google.com

The fifth version of the multigen LRU patchset is posted.  It's rebased on
v5.15 and having performance benchmark reports on the previous version.


[PATCH v2 0/2] Support multiple target nodes demotion (Baolin Wang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1636616548.git.baolin.wang@linux.alibaba.com

This patchset allows demoting multiple target nodes for systems having multiple
slow memory nodes.


Linux 5.16-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjF=JzLkCi2wV+G=f8OWa5rNjPsZd2RMFG5MHwKZPgYvw@mail.gmail.com

After the two weeks, 5.16-rc1 is released.  It's not a huge, but also not
small.  Just normal.  Linus mentions folios as one of the patches that applied
in this release, as it changes the core.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4..v5.16-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v5.16-rc1-only.png)
