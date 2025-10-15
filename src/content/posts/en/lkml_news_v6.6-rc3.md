---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-09-20T12:12:43-07:00
lastmod: 2023-09-20T12:12:43-07:00
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

[Invitation] Linux MM Alignment Session on APIs for Sparse Mappings on Wednesday (David Rientjes)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/fba78307-e4a3-2621-2917-464f19bb4c57@google.com

David is organizing yet another Linux MM alignment session for proper API for
sparse mappings.


[PATCH v2] vmscan: add trace events for lru_gen (Jaewon Kim)
------------------------------------------------------------

https://lkml.kernel.org/r/20230921062206.14429-1-jaewon31.kim@samsung.com

This patch adds two new tracevents called `trace_mm_vmscan_lru_gen_scan` and
`trace_mm_vmscan_lru_gen_evict` that similar to `trace_mm_vmscan_lru_isolate`
and `trace_mm_vmscan_lru_shrink_[in]active`.


[PATCH v3 00/15] futex: More futex2 bits (Peter Zijlstra)
---------------------------------------------------------

https://lkml.kernel.org/r/20230921104505.717750284@noisy.programming.kicks-ass.net

Peter sent third version of the patchset that introduces a new interface for
same futex core, futex2.


Linux 6.6-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjrZgxjHZuXwrGeFnng_whUmtToCWE5GQ+HORhGSeiX8g@mail.gmail.com

The third release candidate for Linux v6.6 has released with changes that a bit
larger than that of the rc2.  It contains a large chunk of filesystem changes,
but that's not scary.  All the changes are usual.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc4..v6.6-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-09-25 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.6-rc3-only.png)
