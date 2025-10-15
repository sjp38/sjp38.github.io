---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-01-30T06:37:02-08:00
lastmod: 2024-01-30T06:37:02-08:00
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

[GIT PULL]  hotfixes for 6.8-rc3 (Andrew Morton)
------------------------------------------------

https://lkml.kernel.org/r/20240128232759.7535e6774bec152556fb9730@linux-foundation.org

Andrew Morton sent a hotfixes pull request to Linus Torvalds.


[LSF/MM/BPF TOPIC] Reclaiming & documenting page flags (Matthew Wilcox)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/Zbcn-P4QKgBhyxdO@casper.infradead.org

Matthew proposes yet another LSFMM topic for discussing what page flags
actually mean altogether, for better documentation.


[PATCH v7 0/1] mm: report per-page metadata information (Sourav Panda)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20240129224204.1812062-1-souravpanda@google.com

Sourav from Google posted a patch for adding a new field on /proc/meminfo and
/sys/devices/system/node/nodeN/vmstat called `PageMetadata` and
`nr_page_metadata` respectively, which can helps understand how much memory are
being used for page metadata.


[PATCH] mm: memcg: Use larger chunks for proactive reclaim (T.J. Mercier)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20240131162442.3487473-1-tjmercier@google.com

There was a change to ``memory.reclaim`` memcg file making that to limit the
amount of pages to reclaim to maximum of 32 for avoiding over-reclaim.  Becase
it causes regression due to too frequent reclaim start/stop cycle, this patch
remove the limit but adjusts the size proportionally.


[PATCH] mm/slab: Add slabreclaim flag to slabinfo (Fangzheng Zhang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20240131094442.28834-1-fangzheng.zhang@unisoc.com

Fangzheng adds slabreclaim flag to slabinfo for an enhanced slab debugging.


[LSF/MM/BPF TOPIC] Replacing `TASK_(UN)INTERRUPTIBLE` with regions of uninterruptibility (David Howells)
--------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/2701318.1706863882@warthog.procyon.org.uk

David suggests a new LSFMM topic for replacing
`TASK_{INTERRUPTIBLE,KILLABLE,UNINTERRUPTIBLE}` with a sort of
`begin/end_...()` functions that defines the uninterruptibility in terms of
execution range.


[PATCH v5 00/25] Transparent Contiguous PTEs for User Mappings (Ryan Roberts)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240202080756.1453939-1-ryan.roberts@arm.com

As a part of the variable-sized memory blocks (folios) allocation and mappping
performance improvement which aims to achieve 16K kernel performance with 4K
kernel, Ryan posted a patchset for opportunistic and transparent contiguous pte
mapping usage.  This benefits arm64 directly, and provide cleanup/refactoring
of x86 and powerpc.


Do we still need SLAB_MEM_SPREAD (and possibly others)? (Steven Rostedt)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20240131172027.10f64405@gandalf.local.home

Steven is exploring slab flags and found `SLAB_MEM_SPREAD`'s only use case was
removed with commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h"),
so he is asking if the flag is obsolte now.


[LSF/MM/BPF TOPIC] Large folios, swap and fscache (David Howells)
-----------------------------------------------------------------

https://lkml.kernel.org/r/2701740.1706864989@warthog.procyon.org.uk

David suggests an LSFMM topic for better handling large folios in swap, since
swap is currently pretty simple.


Linux 6.8-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wisik=He=zySDRHq7fe6k_cOXZeZiCkR41TmbzK2KNZtg@mail.gmail.com

Linus Torvalds released the third release candidate of v6.8.  He mentions it is
slightly larger than usual, but no real worry at this stage.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2023-02-05 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.8-rc3-only.png)
