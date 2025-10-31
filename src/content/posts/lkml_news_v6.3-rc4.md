---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-03-21T06:48:19-07:00
lastmod: 2023-03-21T06:48:19-07:00
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

[PATCH 00/15] mm: move core MM initialization to mm/mm_init.c (Mike Rapoport)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230319220008.2138576-1-rppt@kernel.org

This patchset consolidates MM initialization code to `mm/mm_init.c` file for
better maintainability.


[PATCH -next v6 0/2] Delay the initialization of zswap (Liu Shixin)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20230322102006.780624-1-liushixin2@huawei.com

This patchset delays zswap initialization until it gets enabled to save about
18MB of memory, which is allocated during the initialization.


[PATCH V6 1/2] mm: compaction: move compaction sysctl to its own file (Minhao Chi)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/202303221108054628708@zte.com.cn

This patch moves all sysctls for compaction to its own file.


[PATCH 0/5] selftests/mm: Implement support for arm64 on va (Chaitanya S Prakash)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230323105243.2807166-1-chaitanyas.prakash@arm.com

This patchset makes `va_128TBswitch.c` mm selftests, which is for only PowerPC
and x86, to supports arm64 together.  Because Arm64 supports 256TB switch, this
also rename the test to `va_high_addr_switch`.


Linux 6.3-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whcaHLNpb7Mu_QX7ABwPgyRyfW-V8=v4Mv0S22fpjY4JQ@mail.gmail.com

The fourth release candidate for Linux 6.3 has released with a pretty normal
shape.  The diffstat is skewed to filesystem though, due to bulky xfs fixes,
though.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc6..v6.3-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-03-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.3-rc4-only.png)
