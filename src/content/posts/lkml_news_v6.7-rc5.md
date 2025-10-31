---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-12-05T06:38:00-08:00
lastmod: 2023-12-05T06:38:00-08:00
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

[PATCH] mm/thp: add CONFIG_TRANSPARENT_HUGEPAGE_NEVER option (Dmytro Maluka)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231204163254.2636289-1-dmaluka@chromium.org

Khugepaged has its own memory cost, and it increases `vm.min_free_kbytes` as it
needs when it starts.  On 4GB RAM, 3 mmzones and `pageblock_order ==
MAX_ORDER`, khugepaged increases `vm.min_free_kbytes` from 8MB to 132MB.  This
patch introduces a config to disallow khugepaged starts by default.  It still
allows the userspace to start khugepaged, though.


[PATCH v4 0/2] KSM: support smart-scan feature (Stefan Roesch)
--------------------------------------------------------------

https://lkml.kernel.org/r/20231205180952.3843711-1-shr@devkernel.io

This patchset disables KSM smart scan for ksm tests and add more ksm tests for
smart scan feature.


[PATCH 0/7] mm/zswap: optimize the scalability of zswap rb-tree (Chengming Zhou)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231206-zswap-lock-optimize-v1-0-e25b059f9c3a@bytedance.com

Zswap is protecting its internal rb-tree via a spinlock, and hence showing not
good scalability.  This patchset splits the rb-tree into multiple ones.


[GIT PULL] hotfixes for 6.7-rc5 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20231207185341.570f240a4f51d820c08c9e0b@linux-foundation.org

Andrew sent 31 hotfixes for v6.7-rc5.  10 of those are for stable@.


[PATCH v3 0/4] supplement of slab allocator removal (Xiongwei Song)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20231209135203.303508-1-sxwjean@me.com

This series cleans up slab code following the slab removal change.


stable/LTS test report from KernelCI (2023-12-08) (Gustavo Padovan)
-------------------------------------------------------------------

https://lkml.kernel.org/r/738c6c87-527e-a1c2-671f-eed6a1dbaef3@collabora.com

Gustavo starts improving the KernelCI output to be useful for stable kernels
maintainers.


Linux 6.7-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiwpxsPG9vaQnbh3ch9Uh6s6Kf+8x3TnYE_8prKguHDHg@mail.gmail.com

Torvalds was in travel, suffering from jetlag and a cold last week.  However
the changes for 6.7-rc5 was normal enough for him to work for.  As a result,
the fifth release candidate for Linux 6.7 has released on the day.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-12-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/linux_stat_v6.7-rc5-only.png)
