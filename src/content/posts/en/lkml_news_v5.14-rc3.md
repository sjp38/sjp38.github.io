---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-07-20T07:24:31+02:00
lastmod: 2021-07-20T07:24:31+02:00
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

[PATCH 0/7] Free user PTE page table pages (Qi Zheng)
-----------------------------------------------------

https://lkml.kernel.org/r/20210718043034.76431-1-zhengqi.arch@bytedance.com

This patchset frees user PTE page table pages when all PTE entries are empty,
to reduce the memory overhead due to page tables.


[PATCH v15 00/17] Folio support in block + iomap layers (Matthew Wilcox)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20210719184001.1750630-1-willy@infradead.org

Seems memory folios patchset is now merged in -mm tree and -next tree.  This
patchset further updates iomap to use folios.


Runtime Memory Validation in Intel-TDX and AMD-SNP (Joerg Roedel)
-----------------------------------------------------------------

https://lkml.kernel.org/r/YPV27hDPZUoVsIZt@suse.de

This is a proposal mail describing how to implement runtime memory validation
for confidential guests.


[RFC -V7 0/6] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210722031819.3446711-1-ying.huang@intel.com

Tiered-memory system usually uses RAM and PMEM.
Commit c221c0b0308f ("device-dax: "Hotplug" persistent memory for use like
normal RAM") made PMEM could be accessed as simply a very slow NUMA node.
After that, '[PATCH -V10 0/9] Migrate Pages in lieu of discard' made a
mechanism to demote cold DRAM pages to PMEM node under memory pressure.  This
patchset further optimizes the mechanism and achieves up to 119.1% improvement
with pmbench.


[PATCH v3 1/2] mm: introduce process_mrelease system call (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210723011436.60960-1-surenb@google.com

Facebook's oomd or Android's lmkd uses a strategy of killing processes under
memory pressure.  However, the time to free memory depends on each process.
This patchset introduces a new system call that can be used for faster memory
release.


[PATCH resend] mm: compaction: optimize proactive compaction deferrals (Charan Teja Reddy)
------------------------------------------------------------------------------------------

When proactive compaction is making no progress, it waits some time before
trying again.  For this, it repeatedly sleeps, awakes, and decrement a counter.
If the counter becomes 0, it retries the compaction.  The wakeup for only
counter decrement makes no sense, so this patch makes it unnecessary.


Linux 5.14-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgvwZiLbZpFUApWFDkwyjC3+EmRoEBAuP+VzNQaMd630g@mail.gmail.com

Another week, another rc.  Last release was something worrisome, becuase it was
quite big.  Seems things calmed down, as rc3 looks pretty normal.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc3..v5.14-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-07-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc3-only.png)
