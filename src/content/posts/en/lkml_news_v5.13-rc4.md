---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-05-25T07:24:13+02:00
lastmod: 2021-05-25T07:24:13+02:00
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

[PATCH 0/2] arm64: remove page granularity limitation from KFENCE (Jisheng Zhang)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210524172433.015b3b6b@xhacker.debian

This patchset removes the page granularity mapping requirement for the KFENCE's
linear map, to achieve both arm64's block level and contiguous mapping for
non-KFENCE pool pages, by allocating the KFENCE pool before `paging_init()`.


[PATCH v2 00/21] Optimize list lru memory consumption (Muchun Song)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20210527062148.9361-1-songmuchun@bytedance.com

Muchun found kmalloc-32 slab cache consuming huge memory due to cgroups
initialization, and posting this patchset which expected to fix the problem
fundamentally.  This patchset reduced memory consumption of system under
specific scenario from about 24GB to about 4GB.


Linux 5.13-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjKJ5Mw7P=U0AyhFJbGB+4TT=SE=tmf=md0cqEn527HFg@mail.gmail.com

Last release candidate (rc3) was quite small than usual.  Maybe it was just a
matter of timing, as rc of this week is fairly big.  So nothing worrisome for
now.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc4..v5.13-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-05-31 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc4-only.png)
