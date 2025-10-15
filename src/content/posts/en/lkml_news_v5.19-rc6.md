---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-07-05T07:30:37-07:00
lastmod: 2022-07-05T07:30:37-07:00
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

[PATCH v9 0/9] x86: Show in sysfs if a memory node is able to do encryption (Martin Fernandez)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220704135833.1496303-1-martin.fernandez@eclypsium.com

This patchset makes each memory descriptor node to show if it has the
`EFI_MEMORY_CPU_CRYPRO` attribute.


[PATCH v3] arm64: enable THP_SWAP for arm64 (Barry Song)
--------------------------------------------------------

https://lkml.kernel.org/r/20220706072707.114376-1-21cnbao@gmail.com

`THP_SWAP`, which dealys the split of THP for swap, includes swap throughput
and architecture independent, but enabled on `x86_64` only.  This patch enables
it on arm64.


[PATCH v13 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------

https://lkml.kernel.org/r/20220706220022.968789-1-yuzhao@google.com

Thirteenth version of Multi-gen LRU has posted.  This version fixes an issue in
v12 that reported by Qi Zheng.


[PATCH v8 00/15] Add MEMORY_DEVICE_COHERENT for coherent device memory mapping (Alex Sierra)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220707190349.9778-1-alex.sierra@amd.com

This patchset introduces a type of memory owned by a device that can be mapped
into CPU page tables like `MEMORY_DEVICE_GENERIC`, called
`MEMORY_DEVICE_COHERENT`.


[PATCH v3 00/21] Update Documentation/ cross references and fix issues (Mauro Carvalho Chehab)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1657360984.git.mchehab@kernel.org

This patchset fixes html docs build issues.


Linux 5.19-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgTmGaToVFdSdoFqT2sNkk7jg2rSWasUYv-tASUZ2j_0Q@mail.gmail.com

The sixth release candidate for Linux 5.19 has released.  This release is just
fairly normal and has nothing really stands out.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc6..v5.19-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-07-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v5.19-rc6-only.png)
