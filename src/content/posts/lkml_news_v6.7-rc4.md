---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-11-28T06:35:48-08:00
lastmod: 2023-11-28T06:35:48-08:00
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

[PATCH v2] prctl: Get private anonymous memory region name (Rong Tao)
---------------------------------------------------------------------

https://lkml.kernel.org/r/tencent_77E0BC1E8E9A21CA1B9009DD66555C72A90A@qq.com

Now `prctl()` can set the name of anonymous vmas, but there is no option for
getting the name.  This patch implements the getter feature.


[RFC PATCH 0/6] Supporting GMEM (generalized memory management) for external memory devices (Weixi Zhu)
-------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231128125025.4449-1-weixi.zhu@huawei.com

Because Linux kernels' memory management system is mainly for only host DRAM,
accelerator driver developers need to invent their own external memory
management subsystems that feature similar functionality.  This patchset tries
to reduce the redundant part.


[PATCH RFC v3 0/9] SLUB percpu array caches and maple tree nodes (Vlastimil Babka)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231129-slub-percpu-caches-v3-0-6bcf536772bc@suse.cz

This RFC patchset introduces opt-in percpu arrays for caching allocated and
free objects in SLUB.  It also modifies maple tree to get benefit from this.


[PATCH 0/1] Add swappiness argument to memory.reclaim (Dan Schatzberg)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20231130153658.527556-1-schatzberg.dan@gmail.com

This patch adds `swappiness=<val>` argument to `memory.reclaim` interface.


[PATCH v3 0/7] mm, security, bpf: Fine-grained control over memory policy adjustments with lsm bpf (Yafang Shao)
----------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231201094636.19770-1-laoar.shao@gmail.com

Since any user can do `mbind()`, some NUMA node could be out of free memory and
invoke OOM killer despite of enough system-wide free memory.  This patchset
introduces LSM hooks for syscalls do disable `MPOL_BIND`.


Linux 6.7-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjsbytYq780PM-Wby_2rPabxg-WT-CRPZZaVYsmLiacHw@mail.gmail.com

The fourth release candidate for Linux 6.7 is out with normal small changes.
Linus is having his last travel and it made the release in unusual time (still
Sundasy afternoon in somewhere, though).  There are also holidays that
previously made the release schedule a bit unusual, but Linus expect that might
not affect this time.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.16-rc5..v6.7-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-12-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.7-rc4-only.png)
