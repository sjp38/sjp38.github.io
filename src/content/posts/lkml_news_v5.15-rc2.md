---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-09-14T07:07:26+02:00
lastmod: 2021-09-14T07:07:26+02:00
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

[PATCH v1] vmpressure: wake up work only when there is registration event (wangyong)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1631548441-2784-1-git-send-email-wang.yong12@zte.com.cn

Currently, vmpressure works are awaken even though there are no vmpressure
callbacks.  This commit avoids such unnecessary wakeup by counting the number
of registered events and skip waking up works if the number is zero.


[PATCH v3 00/76] Optimize list lru memory consumption (Muchun Song)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20210914072938.6440-1-songmuchun@bytedance.com

Muchun found `kmalloc-32` for `list_lru_one` allocation consuming 6 GiB of memory
on their server.  That came from a large number of containers.  This patchset
aims to optimize the memory consumption by adding the memcg to the list_lru at
the first insert, rather than instantiating all at memcg init time.

For creating 10,000 memcg and mounting 10,000 filesystems, this patchset
reduced the memory consumption from 24 GiB to 4 GiB.


[MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers Summit topic? (Theodore Ts'o)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/YUIwgGzBqX6ZiGgk@mit.edu

Folio is still not merged in the mainline.  Ted says, as a file system
developer he is eagerly looking forward to what Folios will enable.  For the
reason, he suggests to have a maintainer summit topic for Folio.  In detail,
take a place in a LPC BOF room in Friday.


[PATCH 0/2] Fix NUMA without SMP (Geert Uytterhoeven)
-----------------------------------------------------

https://lkml.kernel.org/r/cover.1631781495.git.geert+renesas@glider.be

There are variables and functions which are used by the NUMA code for SMP-only
case.  This causes build errors for SuperH architecture, which supports NUMA
without SMP.  This patch fixes it.


[PATCH] mm: add ztree - new allocator for use via zpool API (Ananda Badmaev)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210916085102.19310-1-a.badmaev@clicknet.pro

This patch provides a backend for zswap, which uses red-black trees for storing
compressed objects blocks.  This might be able to be used by zram, either.


mmotm 2021-09-16-14-00 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210916210058.KrWpsFx8b%akpm@linux-foundation.org

Andrew updated the first mmotm after v5.15 merge window had opened.  Compared
to the last mmotm before the merge window, 351 patches dropped, 74 patches
added, and 23 patches modified.


Linux 5.15-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wirexiZR+VO=H3xemGKOMkh8OasmXaKXTKUmAKYCzi8AQ@mail.gmail.com/

Due to the `Werror` change, Linus spent lots of time for the build warning
fixes.  Thouh the change has been not default, Linus apparently wants to
eliminate all the warnings.  The work is not complete yet, but he really hopes
the kernel to built without warning.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc2..v5.15-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-09-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.15-rc2-only.png)
