---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-08-23T06:42:59-07:00
lastmod: 2022-08-23T06:42:59-07:00
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

[mm] 96db82a66d: will-it-scale.per_process_ops -95.3% regression (kernel test robot)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020

A big regression of mm multi-cpu scalability test (will-it-scale) has found by
the kernel test robot.  The commit 96db82a66d1db0e2966c02dc492e02eeb3a94a75
("mm: align larger anonymous mappings on THP bundaries") is pointed out as the
suspect.


[PATCH v13 00/70] Introducing the Maple Tree (Liam Howlett)
-----------------------------------------------------------

https://lkml.kernel.org/r/20220822150128.1562046-1-Liam.Howlett@oracle.com

The thirteenth version of the maple tree patchset has posted after rebased on
latest mm-unstable and fixed some bugs.  It has merged in the mm-unstable soon.


[GIT PULL] hotfixes for 6.0-rc3 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220822170721.1e32635aaedb6f4c53933390@linux-foundation.org

Andrew posted some hotfixes for v6.0-rc3.


[PATCH v3] page_ext: introduce boot parameter 'early_page_ext' (Li Zhe)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20220825063102.92307-1-lizhe.67@bytedance.com

This patch introduces a new boot parameter called `early_page_ext` to allow
calling `page_ext_init()` before `page_alloc_init_late()`.


[RFC PATCH 1/2] mm/demotion: Expose memory type details via sysfs (Aneesh Kumar K.V)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220825092325.381517-1-aneesh.kumar@linux.ibm.com

This patch exposes memory type detail information for tiers via sysfs.


[RFC 0/2] Introduce cgroup.top interface (Lu Jialin)
----------------------------------------------------

https://lkml.kernel.org/r/20220826011503.103894-1-lujialin4@huawei.com

This RFC patchset adds `cgroup.top` file under cgroupfs, which can be used to
gather top-down resource usage information.


[PATCH] mm: kill is_memblock_offlined() (Kefeng Wang)
-----------------------------------------------------

https://lkml.kernel.org/r/20220827112043.187028-1-wangkefeng.wang@huawei.com

This patch removes one line wrapper function, `is_memblock_offlined()` and make
the callers do the check on its own.


Linux 6.0-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whaiqzB6a_daUpvGyDg-cvkXKwwfjwPKV4HQRcci+8BeA@mail.gmail.com

Linus releases the third release candidate for v6.0 of the Linux kernel.  There
are some known issues but nothing scary and almost normal.  He also notices it
was the week was having the 31st anniversary of Linux.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc4..v6.0-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-08-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.0-rc3-only.png)
