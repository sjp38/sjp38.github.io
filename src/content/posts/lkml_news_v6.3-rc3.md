---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-03-14T07:42:23-07:00
lastmod: 2023-03-14T07:42:23-07:00
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

[LSF/MM/BPF TOPIC] SLOB+SLAB allocators removal and future SLUB improvements (Vlastimil Babka)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz

Linux kernel has three objects allocators, namely SLOB, SLAB, and SLUB.
Vlastimil and many developers have tried to make it only one single allocator.
Deprecation of SLOB has made some progress so far.  Vlastimil proposes an
LSF/MM/BPF topic for discussing deprecation of SLAB and SLUB futur
eimprovement.


[GIT PULL] hotfixes for 6.3-rc1 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230314165437.a2d992731a970582fe36aaba@linux-foundation.org

Yet another mm subsystem hotfixes pull request has sent to Linus Torvalds.  It
contains hotfixes for DAMON, too.


[PATCH linux-next] mm: workingset: simplify the calculation of workingset size (Yang Yang)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/202303161723055514455@zte.com.cn

This patch refactor working set size calculation code which has been
unnecessarily complex after the anonymous LRU workingset detection
implementation.


[PATCH v2 0/6] remove SLOB and allow kfree() with kmem_cache_alloc() (Vlastimil Babka)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230317104307.29328-1-vbabka@suse.cz

SLOB has deprected in 6.2.  Vlastimil tries to further remove it completely
immediately for-next, and from v6.4.


Linux 6.3-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com

After the one week, third release candidate for Linux v6.3 has out.  It's
unusually huge due to big changes for git-ignore scripts removal and kvm
selftests cleanups.  Other than those, nothing unusual, so not real worrisome
release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc5..v6.3-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-03-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.3-rc3-only.png)
