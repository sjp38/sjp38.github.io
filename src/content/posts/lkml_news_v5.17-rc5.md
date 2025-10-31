---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-02-15T07:06:23+01:00
lastmod: 2022-02-15T07:06:23+01:00
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

[PATCH v3 0/3] Add hugetlb MADV_DONTNEED support (Mike Kravetz)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220215002348.128823-1-mike.kravetz@oracle.com

`MADV_DONTNEED` can be used for hugetlb but currently prohibits it with a
simple check.  This commit removes the check to enable `MADV_DONENEED` for
hugetlb.


mmotm 2022-02-14-17-46 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220215014633.9CD9CC340E9@smtp.kernel.org

mmotm has updated.  It's rebased on 5.17-rc4, added 20 new patches, modified
295 patches, and dropped 10 patches.  In total, 316 patches in the queue.


[PATCH v6 00/71] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20220215143728.3810954-1-Liam.Howlett@oracle.com

Sixth version of the maple tree patchset, which aims to be used as a scalable
alternative of rbtree for vmas management, has posted.


mmotm 2022-02-15-20-22 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220216042246.DD4D0C004E1@smtp.kernel.org

-mm tree has updated.  It added 28 patches, modified 19 patches, and dropped 1
patch.  In total, 343 patches in the queue.


Maple Tree for next (Liam Howlett)
----------------------------------

https://lkml.kernel.org/r/20220216191446.pubrv6x3vo3ip7rr@revolver

Liam is asking Stephen to include his Maple Tree work tree in the -next tree.


[RFC PATCH V1 0/5] mm/damon: Add NUMA access statistics function support (Xin Hao)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1645024354.git.xhao@linux.alibaba.com

This RFC patchset makes DAMON to use `PROT_NONE` and page faults mechanism for
monitoring NUMA-local/remote accesses.  Seems it needs more change, though.


[RFC PATCH 0/4] Introduce DAMON sysfs interface (SeongJae Park)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220217161938.8874-1-sj@kernel.org

This RFC patchset introduces a reliable and flexible new user interface of
DAMON, which is based on sysfs.


Linux 5.17-rc5
--------------

https://lkml.kernel.org/r/CAHk-=wgsMMuMP9_dWps7f25e6G628Hf7-B3hvSDvjhRXqVQvpg@mail.gmail.com

Normal progress is continued until the fifth release candidate of Linux 5.17 is
out.  Intel iwlwifi has some changes, but it's only for removal of its
broadcast feature which doesn't work anyway with its new firmware.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc4..v5.17-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-02-21 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc5-only.png)
