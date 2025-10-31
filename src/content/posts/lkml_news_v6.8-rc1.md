---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-01-09T06:52:07-08:00
lastmod: 2024-01-09T06:52:07-08:00
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


[GIT PULL] MM updates for 6.8-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20240108155039.fd2798712a2a93a108b710ce@linux-foundation.org/

Andrew Morton sent the memory management subsystem side pull request for Linux
v6.8-rc1 to Linus Torvalds.  The request has many interesting changes including
zswap writeback improvement, Feedback-based DAMOS autotuning, Multi-size anon
THP, KSM advisor and many more.


[GIT PULL] non-MM updates for 6.8-rc1 (Andrew Morton)
-----------------------------------------------------

https://lkml.kernel.org/r/20240109110420.dcdefe80d76257d9ff645a32@linux-foundation.org

Andrew sent yet another pull request for out of memory management subsystem
changes to Linus Torvalds.


[PATCH] MAINTAINERS: add Yosry Ahmed as a zswap reviewer (Yosry Ahmed)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20240109174302.680353-1-yosryahmed@google.com

Yosry is adding himself as a reviewer for zswap on the `MAINTAINERS` file.


[PATCH] MAINTAINERS: add entry for shrinker (Qi Zheng)
------------------------------------------------------

https://lkml.kernel.org/r/20240111075219.34221-1-zhengqi.arch@bytedance.com

A patch for adding a dedicated MAINTAINERS section for shrinker has posted,
since the shrinker code has moved to a separate `shrinker.c`.


[RFC PATCH v5 0/4] Introduce mseal() (Jeff Xu)
----------------------------------------------

https://lkml.kernel.org/r/20240109154547.1839886-1-jeffxu@chromium.org

Jeff posted the fifth version of patchset for `mseal()`, which is a system call
for protecting the VMAs of a specific virtual memory range against
modifications such as permission bits changes.


[PATCH v3 0/3] A Solution to Re-enable hugetlb vmemmap optimize (Nanyong Sun)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240113094436.2506396-1-sunnanyong@huawei.com

Due to break-before-make logic, hugetlb vmemmap optimization was disabled on
arm64.  This patchset adds necessary break-before-make logic and enable the
hugetlb vmemmap optimization.


[GIT PULL] hotfixes for 6.8-rc1 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240112165917.67505f1509909230808c06e3@linux-foundation.org

Andrew posted a hotfixes pull request to Linus Torvalds.


[RFC PATCH 0/4] DAMON based 2-tier memory management for CXL memory (Honggyu Kim)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240115045253.1775-1-honggyu.kim@sk.com

Honggyu proposes two new DAMOS action for 2-tier tiered memory management using
DAMOS, namely `DAMOS_PROMOTE` and `DAMOS_DEMOTE`.  The cover letter is also
containing nice test results.


[LSF/MM/BPF TOPIC] Dropping page cache of individual fs (Christian Brauner)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20240116-tagelang-zugnummer-349edd1b5792@brauner

Gnome got 1M Euro award by the Sovereign Tech Fund, and proposed vairous
projects.  Based on it, Christian proposes dropping page cache of individual fs
as a LSFMM topic.


[PATCH v3] tools/mm: Add thpmaps script to dump THP usage info (Ryan Roberts)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240116141235.960842-1-ryan.roberts@arm.com

This patch adds a script reading `/proc/<pid>/{smaps,pagemap}` and
`/proc/kpageflags` and prints THP information.  This could be useful since THP
is now adavnced to support file-backed memory and multi size for anonymous
memory.


[RFC 0/2] kasan: introduce mem track feature (Li Zhe)
-----------------------------------------------------

https://lkml.kernel.org/r/20240118124109.37324-1-lizhe.67@bytedance.com

This RFC patchset make KASAN shadow memory to have accessible memory
information, to avoid accidental memory modifications due to memory problems.


[PATCH 0/2] mm/zswap: optimize the scalability of zswap rb-tree (Chengming Zhou)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240117-b4-zswap-lock-optimize-v1-0-23f6effe5775@bytedance.com

This patchset splits the single zswap rbtree, which can cause lock contention
due to the fact that it is protected by a single spinlock, to multiple rbtrees,
and achieve the lock contention reduction.


[RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED (Yosry Ahmed)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240112193103.3798287-1-yosryahmed@google.com

Yosry sent an RFC patch for making z3fold compressed pages allocator, which is
not widely used, to be deprecated.


[PATCH v3 00/17] kexec: Allow preservation of ftrace buffers (Alexander Graf)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240117144704.602-1-graf@amazon.com

The third patchset for kexec handover, which is the first part for kexec-driven
host kernel update has posted.  The idea was shared on LPC last year.


[PATCH v3 1/1] mm/madvise: add MADV_F_COLLAPSE_LIGHT flag to process_madvise() (Lance Yang)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240119115104.75456-1-ioworker0@gmail.com

This patch introduces `MADV_F_COLLAPSE_LIGHT` flag, which allows relaxed and
lightweight alternative to the default behavior of `MADV_COLLAPSE`.


[LSF/MM/BPF TOPIC] Enhancements to RCU-protected VMA walks (Liam R. Howlett)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240119164227.iiwibb2o6z7hvokq@revolver

Liam proposes the annual `mmap_sem/mmap_lock` talk for LSFMM.  Seems this time
it will further try to cover more plan about RCU-protection.


[LSF/MM/BPF TOPIC] State Of The Page (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/ZaqiPSj1wMrTMdHa@casper.infradead.org

Matthew suggests an LSFMM topic for the separation of folios, slabs, pages,
etc.


Linux 6.8-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com

Though there was a short merge window breakge, Linus released the first release
candidate for Linux v6.8, After the two weeks of the merge window.  The size is
smaller than the average.  Seems Linus suspects the holidays.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-01-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc1-only.png)
