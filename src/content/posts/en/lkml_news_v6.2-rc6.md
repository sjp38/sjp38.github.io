---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-01-24T07:51:20-08:00
lastmod: 2023-01-24T07:51:20-08:00
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

[RFC PATCH 00/19] mm: Introduce a cgroup to limit the amount of locked and pinned memory (Alistair Popple)
----------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com

This RFC patchset introduces a cgroup limit like `RLIMIT_MEMLOCKED` but that
for pinned pages.


[RFC PATCH 0/4] Fix excessive CPU usage during compaction (Mel Gorman)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20230125134434.18017-1-mgorman@techsingularity.net

A patch for not ignoring `fast_find_migrateblock()` found pageblocks made
compaction shows high CPU and stalls.  It therefore once merged in mainline,
than reverted, and again merged in mm-unstable.  This patch fixes the
underlying problem of the issue, so that the revert of the patch and reverted
later.


[PATCH v3 0/7] introduce vm_flags modifier functions (Suren Baghdasaryan)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20230125233554.153109-1-surenb@google.com

`vm_flags` are usually modified under exclusive `mmap_lock` protection to
prevent racing with concurrent VMA operations like merging and splitting.  This
patchset introduces a modifier function that ensure correct locking.

This was a part of per-VMA locking, but separated.


[LSF/MM/BPF TOPIC] State Of The Page (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/Y9KtCc+4n5uANB2f@casper.infradead.org

Matthew proposes a LSFMMBPF session for sharing page dismemberment progress and
future plans.


Linux 6.2-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiJcsgmgjEitJ97x3unFpaKv1d=YyNr_5NbOTGsGqCG=A@mail.gmail.com

Unlike the worries from last week, the sixth release candidate for Linux v6.2
looks fairly small and normal.  Linus says it might be just a good sign but he
will drag the release with rc8, as previously mentioned.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc7..v6.2-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-01-30 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.2-rc6-only.png)
