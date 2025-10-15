---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-02-08T07:23:14+01:00
lastmod: 2022-02-08T07:23:14+01:00
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

[PATCH v2 1/2] arm64: avoid flushing icache multiple times on contiguous HugeTLB (Muchun Song)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220208054632.66534-1-songmuchun@bytedance.com

When a contiguous HugeTLB page is mapped, `set_pte_at()` is called `CONT_PTES /
CONT_PMDS` times.  Because the first flushing covers subsequent flushes, this
is unnecessary overhead, so this patchset avoids it.


[PATCH v7 00/12] Multigenerational LRU Framework (Yu Zhao)
----------------------------------------------------------

https://lkml.kernel.org/r/20220208081902.3550911-1-yuzhao@google.com

Seventh version of the MGLRU patchset, which aims to reduce performance
overhead and improve eviction target pages selection of reclamation logic is
posted.  Change from the last version is addressing the comments from
stakeholders to the last version and measuring performance for each patch.


mmotm 2022-02-08-15-31 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220208233156.E2CA6C004E1@smtp.kernel.org

MMOTM tree has uploaded. It's rebased on 5.17-rc3, added 49 new patches,
modified 26 existing patches, and dropped 11 patches.  In total, 280 patches in
the queue.


[PATCH v5 0/5] sparse-vmemmap: memory savings for compound devmaps (device-dax) (Joao Martins)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220210193345.23628-1-joao.m.martins@oracle.com

This patchset minimizes memory overhead of `struct page` objects by pursuing a
similar apporach as Muchun Song does for hugetlb pages.


mmotm 2022-02-11-15-07 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220211230819.191B1C340E9@smtp.kernel.org

-mm tree is updated.  It's still based on 5.17-rc3, added 29 patches, modified
276 patches, and dropped 3 patches.  In total, 306 patches in the queue.


Linux 5.17-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgpOhU0cU+KZHA86OsoN2BxqT4ZoTMYHDMuzbiiiKK1Eg@mail.gmail.com

The fourth release candidate of v5.17 is out.  All the things including
diffstat and number of commits looks pretty much average for this cycle.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc3..v5.17-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-02-14 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc4-only.png)
