---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-06-20T07:03:30-07:00
lastmod: 2023-06-20T07:03:30-07:00
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

[PATCH] mm/memory_hotplug.c: don't fail hot unplug quite so eagerly (John Hubbard)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230620011719.155379-1-jhubbard@nvidia.com

Some device drivers add and remove memory to the system via memory hot
[un]plog.  Nevertheless, the ungplugging could fail easily, especially for the
pending signal on the process.  This patch simply remove the signal check
error.


[PATCH v2] mm/min_free_kbytes: modify min_free_kbytes calculation rules (liuq)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230621073912.21747-1-liuq131@chinatelecom.cn

This patch adjusts `min_free_kbytes` calculation so that `ZONE_NORMAL` is
unnecessarily be too small when `ZONE_MOVABLE` exists.


[GIT PULL] hotfixes against 6.4-rc7 (Andrew Morton)
---------------------------------------------------

https://lkml.kernel.org/r/20230620123828.813b1140d9c13af900e8edb3@linux-foundation.org

Andrew sent hotfixes that aimed to be applied on Linux v6.4-rc7 to Linus.


[RFC PATCH v2 0/6] mm: working set reporting (Yuanchu Xie)
----------------------------------------------------------

https://lkml.kernel.org/r/20230621180454.973862-1-yuanchu@google.com

Yuanchu sent the second version of the RFC for MGLRU-based working set
reporting.


[PATCH v20 0/5] Implement IOCTL to get and optionally clear info about PTEs (Muhammad Usama Anjum)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230621072404.2918101-1-usama.anjum@collabora.com

Microsoft Windows provides `GetWriteWatch()` system call, which retries the
virtual address of the pages that are written to.  This patchset implements
similar one in an efficient manner for Linux, with the name
`PAGEMAP_SCAN_IOCTL`.


Linux 6.4 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wi7fwNWfqj-QQqEfZTUOB4bbKT8QiEUDHoPk0ecuYA7cA@mail.gmail.com

After the seven releae candidate kernels for 6.4, the last wee kwas also quite
normal with some netfilter fixes, mm reverts, and tracing updates.  So Linux
v6.4 is out.  Linus already received 15 pull requests for v6.5.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc1..v6.4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
