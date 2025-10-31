---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-12-13T08:05:03-08:00
lastmod: 2022-12-13T08:05:03-08:00
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

memcg reclaim demotion wrt. isolation (Michal Hocko)
----------------------------------------------------

https://lkml.kernel.org/r/Y5idFucjKVbjatqc@dhcp22.suse.cz

Currently pages allocated for demotion targets includes `__GFP_KSWAPD_RECALIM`,
and therefore memcg triggered reclaim could result in reclaims of  pages in
different hierarchy.  Michal suggests simple modification of it.


[GIT PULL] MM updates for 6.2-rc1 (Andrew Morton) (1+ msgs) (Andrew Morton)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20221213142614.525a9240506119abc3cef6b6@linux-foundation.org

Andrew Morton sent the MM pull request for v6.2-rc1 to Linus Torvalds.  It
includes 28 DAMON patches for cleanup and DAMOS tried regions sysfs.


[RFC PATCH 0/2] mm: multi-gen LRU: working set extensions (Yuanchu Xie)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20221214225123.2770216-1-yuanchu@google.com

An RFC patchset for MGLRU-based working set per page type and per MUNA node
with minute granularity has posted.


[GIT PULL] Writeback fixes for 6.2-rc1 (Jens Axboe)
---------------------------------------------------

https://lkml.kernel.org/r/7d6731de-b583-9552-24e3-601fbdae6a1b@kernel.dk

Retry of writeback fixes for 6.2-rc1 pull request has sent.


[GIT PULL] Final MM updates for 6.2-rc1 (Andrew Morton)
-------------------------------------------------------

https://lkml.kernel.org/r/20221217203048.c502a0c0ba87b5be1bfb7824@linux-foundation.org

Andrew Morton sent a PR for final MM updates to v6.2-rc1 to Linus Torvalds.


[PATCH v3 00/14] Introduce Copy-On-Write to Page Table (Chih-En Lin)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20221220072743.3039060-1-shiyn.lin@gmail.com

Copy on write is useful for lightweight `fork()`, but it is applied to only
mapped memory.  This patchset further applies the mechanism to page table.


[PATCH RFC] ipc/mqueue: introduce msg cache (Roman Gushchin)
------------------------------------------------------------

https://lkml.kernel.org/r/20221220184813.1908318-1-roman.gushchin@linux.dev

This patchset introduces msg cache, which allocates message queue messages on
a small percpu cache insted of free/realloc them everytime.


[PATCH mm-unstable v2 0/8] mm: multi-gen LRU: memcg LRU (Yu Zhao)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20221221001207.1376119-1-yuzhao@google.com

This patchset introduces an extended LRU called memcg LRU, which can work
system wide with an optimized complexity.


[PATCH v4 0/4] Convert deactivate_page() to folio_deactivate() (Vishal Moola)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20221221180848.20774-1-vishal.moola@gmail.com

Yet another folio conversion patchset for `deactivate_page()` has posted.


[GIT PULL] hotfixes for 6.2-rc1 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20221222144648.db034ee4087ea4bb126545ec@linux-foundation.org

Andrew Morton sent hotfixes for v6.2-rc1 to Linus Torvalds.


[PATCH 0/8] migrate_pages(): batch TLB flushing (Huang Ying)
------------------------------------------------------------

https://lkml.kernel.org/r/20221227002859.27740-1-ying.huang@intel.com

This patch refactors `migrate_pages()` implementation and make it to batch TLB
flushing.


Linux 6.2-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com

On the Christmas, Linus Torvalds released the first release candidate of v6.2.
Because of the delay of v6.1 release, the merge window was tried to be finish
early, and actually Torvalds was able to finish almost merge works early.
Resulting 6.2-rc1 is somewhat looks larger than v6.1.  13.5k commits from ~1800
people.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc2..v6.2-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-12-25 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.2-rc1-only.png)
