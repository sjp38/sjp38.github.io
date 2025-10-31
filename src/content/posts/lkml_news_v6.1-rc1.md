---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-10-04T07:14:10-07:00
lastmod: 2022-10-04T07:14:10-07:00
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

[RFC UKL 00/10] Unikernel Linux (UKL) (Ali Raza)
------------------------------------------------

https://lkml.kernel.org/r/20221003222133.20948-1-aliraza@bu.edu

This RFC patchset introduces a research project called Unikernel Linux which
integrates application specific optimization to the Linux kernel.  It links an
application directly with kernel and runs it in the supervisor mode.


[PATCH v6] mm: add zblock - new allocator for use via zpool API (Ananda)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20221005053302.30387-1-a.badmaev@clicknet.pro

This patchset introduces a new allocator for zpool API.  The author says it is
better than zsmalloc in terms of worst execution time and therefore good at
real-time usage.


[RFC PATCH 0/4] Introduce mempool pages bulk allocator the use it in dm-crypt (Yang Shi)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221005180341.1738796-1-shy828301@gmail.com

This patch introduces a mempool bulk pages allocator that supposed to be used
in dm-crypt as it shows noticeable overhead when writing on full disk
encryption is enabled.


How to track the LRU pages access? (Jin Huang)
----------------------------------------------

https://lkml.kernel.org/r/CACV+naoF8bmVu8dEziSsttPaiHpiamNdRGAhHeZt3sq873jb2A@mail.gmail.com

A graduate student is asking about a way for tracking accesses to pages in LRU
lists.


[GIT PULL] MM updates for 6.1-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20221008132113.919b9b894426297de78ac00f@linux-foundation.org

Andrew sent the pull request for MM to Linus.  It contains, MGLRU, Maple tree,
DAMON cleanups, `MADV_THP_COLLAPSE`, and many interesting changes.


[RFC PATCH] mm: skip GFP_IO if swap is zram only (Zhaoyang Huang)
-----------------------------------------------------------------

https://lkml.kernel.org/r/1665399622-20236-1-git-send-email-zhaoyang.huang@unisoc.com

This RFC patch makes `__GFP_IO` to do acclocation even if it can be suspended
due to zram swap, as zram is believed to be faster one unlike the normal
physical block devices.


[RFC] UABI to show system memory encryption (Martin Fernandez)

https://lkml.kernel.org/r/CAKgze5bvqPLo7VZs8rCWc2rFsUekx_d0coKFzObi=J+_nPOacg@mail.gmail.com

This RFC patch shows system memory encryption status to user.


[GIT PULL] non-MM updates for 6.1-rc1 (Andrew Morton)
-----------------------------------------------------

https://lkml.kernel.org/r/20221011190341.511a73168c42a296fd6589a6@linux-foundation.org

Andrew sent pull request for non-MM updates for v6.1-rc1 to Linus Torvalds.


[PATCH v3 0/3] THP Shrinker (Alexander Zhu)
-------------------------------------------

https://lkml.kernel.org/r/cover.1665614216.git.alexlzhu@fb.com

Third version of the patchset for splitting not-well-utilized THPs for better
memory efficiency has posted.


[GIT PULL] Final MM updates for 6.1-rc1 (Andrew Morton)
-------------------------------------------------------

https://lkml.kernel.org/r/20221013230302.96f2869cd26026b36e8ecd40@linux-foundation.org

Andrew sent the final MM changes pull request to Linus Torvalds.


Linux 6.1-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj6y5fipM2A5kEuOO9qm5PBzUY=-m9viEahhtxT09KR_g@mail.gmail.com

After the two weeks, the first release candidate of Linux 6.1 has released.
It's not a big release, but contains some major changes including Multi-gen LRU
and Rust infrastructure.  It contains no Rust code but only the infrastructure,
though.  Linus also mentions that he was frustrated due to a problem on his
personal machine and late pull requests.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc2..v6.1-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-10-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.1-rc1-only.png)
