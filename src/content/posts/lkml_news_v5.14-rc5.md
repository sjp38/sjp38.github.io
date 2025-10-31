---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-08-03T07:09:02+02:00
lastmod: 2021-08-03T07:09:02+02:00
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

[PATCH 0/3] mm: optimize thp for reclaim and migration (Yu Zhao)
----------------------------------------------------------------

https://lkml.kernel.org/r/20210731063938.1391602-1-yuzhao@google.com

This patchset drops subpages of THPs which contain only zero contents when
splitting those, to reduce memory pressure overheads due to THP internal
fragmentations.


[PATCH v4 1/2] mm: introduce process_mrelease system call (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210802221431.2251210-1-surenb@google.com

This patchset introduces a new system call, namely `process_mrelease()`.  It
can be used to quickly release memory of a process.


[PATCH v7 0/5] Introduce multi-preference mempolicy (Feng Tang)
---------------------------------------------------------------

https://lkml.kernel.org/r/1627970362-61305-1-git-send-email-feng.tang@intel.com

This patchset allows users to set multiple preferred memory policy, so that a
process can use memory from multiple NUMA nodes.


[PATCH] mm/madvise: add MADV_WILLNEED to process_madvise() (zhangkui)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20210804082010.12482-1-zhangkui@oppo.com

This patch allow `process_madvise()` to allow `MADV_WILLNEED` behavior.


[PATCH v6 1/2] mm: introduce process_mrelease system call (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210804185004.1304692-1-surenb@google.com

Sixth version of `process_mrelease()` system call introduction patchset.


[PATCH v7 1/2] mm: introduce process_mrelease system call (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210805170859.2389276-1-surenb@google.com

Seventh version of the patchset posted quite soon.


mmotm 2021-08-05-19-46 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210806024648.V0Ye_YURy%akpm@linux-foundation.org

The -mm tree is updated.  This time, DAMON patchset is merged in.


[PATCH v2 0/2] add KSM performance tests (Zhansaya Bagdauletkyzy)
-----------------------------------------------------------------

https://lkml.kernel.org/r/cover.1628199399.git.zhansayabagdaulet@gmail.com

This patchset extends KSM self tests with a performance test.


Linux 5.14-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg8QmMMBCEYCV0gPM2GqRQObsQ__fK0r8C6SYAg3Upyjg@mail.gmail.com

The fifth rc release is perfectly normal in terms of the size and the
distribution of the changes.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc5..v5.14-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-08-09 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc5-only.png)
