---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-11-01T07:55:43-07:00
lastmod: 2022-11-01T07:55:43-07:00
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

[PATCH -next] mm/page_reporting: change page_reporting_param_ops to static (Yang Yingliang)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221101070022.1930028-1-yangyingliang@huawei.com

This patch makes `page_reporting_param_ops` static, as it's used in only the c
file.


[RFC PATCH] mm: introduce accounting of page_owner via backtrace (Zhoyang Huang)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/1667390781-17515-1-git-send-email-zhaoyang.huang@unisoc.com

This RFC patchset accounts and sorts `page_owner` output via its backtrace for
simplifying it.


[PATCH v6 0/5] THP Shrinker (Alexander Zhu)
-------------------------------------------

https://lkml.kernel.org/r/cover.1667454613.git.alexlzhu@fb.com

The patchset for THP shrinking, which aims to reduce memory waste due to the
THP underutilization, has revised again to the sixth version.


[RFC] Kernel Support of Memory Error Detection. (Jiaqi Yan)
-----------------------------------------------------------

https://lkml.kernel.org/r/20221103155029.2451105-1-jiaqiyan@google.com

This RFC patchset proactively scans the memory DIMMs to detect memory errors,
and attempts to recover those.


[PATCH] mm: anonymous shared memory naming (Pasha Tatashin)
-----------------------------------------------------------

https://lkml.kernel.org/r/20221105025342.3130038-1-pasha.tatashin@soleen.com

This patch extend the anonymous memory mapping naming feature to be able to
name not only private memory but also shared memory.


Linux 6.1-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whdSr755Jz=w9Kx7XZqsKFATFK5HXzk=XKd=Hf9D6K_=Q@mail.gmail.com

After the small surprise of the increased diff for 6.1-rc3, rc4 is back to
normal.  The size is quite normal as usual, and the changes are spread to each
subsystems.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc4..v6.1-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-11-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.1-rc4-only.png)
