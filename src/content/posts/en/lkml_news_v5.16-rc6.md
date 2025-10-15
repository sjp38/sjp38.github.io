---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-12-14T07:30:38+01:00
lastmod: 2021-12-14T07:30:38+01:00
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

[PATCH v4 00/17] Optimize list lru memory consumption (Muchun Song)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20211213165342.74704-1-songmuchun@bytedance.com

Muchun found 6GB of memory was consumed by kmalloc-32 slab cache on a machine
having 952 super blocks.  That was due to `list_lru_one` allocation from
`memcg_nr_cache_ids`.  This patchset aims to fix the issue.  According to a
simple test, this reduces memory consumption under a situation from 24GiB to
4GiB.


mmotm 2021-12-13-21-28 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211214052904.VfRYfitp0%akpm@linux-foundation.org

Andrew Morton uploaded new mmotm.  It's based on 5.16-rc5, adds 52 new patches
modifies 40 patches, and drops 24 patches.  In total, 296 patches in the queue.


[PATCH 00/43] Add KernelMemorySanitizer infrastructure (Alexander Potapenko)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20211214162050.660953-1-glider@google.com

This commit implements Kernel Memory SANitizer (KMSAN) runtime, so that people
can run KMSAN kernel on a QEMU.


[RFC PATCH] psi: introduce rt property for trigger (Zhaoyang Huang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/1639565399-15629-1-git-send-email-huangzhaoyang@gmail.com

This patch makes PSI aware of the realtime scenario.


[PATCH 00/18 V2] Repair SWAP-over-NFS (Neil Brown)
--------------------------------------------------

https://lkml.kernel.org/r/163969801519.20885.3977673503103544412.stgit@noble.brown

This patchset cleans up and improve swap-via-filesystem code and make NFS works
with swap-via-filesystem.


Linux 5.16-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgWuZPhK6dgXsS42iMz4o610Uw4QXeUsTSOQheNo1tf5A@mail.gmail.com

The sixth release candidate for v5.16 came out in a quite normal form.  Linus
will make extra release candidate, though, due to the holidays.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc4..v5.16-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-12-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc6-only.png)
