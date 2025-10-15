---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-01-26T07:14:55+01:00
lastmod: 2021-01-26T07:14:55+01:00
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

[RFC][PATCH 00/13] [v5] Migrate Pages in lieu of discard (Dave Hansen)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20210126003411.2AC51464@viggo.jf.intel.com

If a system has a small DRAM and a large persistent memory (PMEM), reclamation
starts when DRAM fills up, and newer allocations will done on PMEM.  This
patchset makes the reclaim logic to migrate pages to PMEM instead of just
discarding it.


[PATCH v3 00/25] Page folios (Matthew Wilcox)
---------------------------------------------

https://lkml.kernel.org/r/20210128070404.1922318-1-willy@infradead.org

This patchset introduces a new data structure called page folio.  It helps
functions to handle compound pages without having to check if a given page is a
head or a tail.


Linux 5.11-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiOjOh4gNkg==Tyjho98cea06UtnZ4ePwMP3uK-9VLCNA@mail.gmail.com

Things keep going calm.  v5.11-rc6 is in average of the series, and the commits
spread to subsystems as usual.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc6..v5.11-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-02-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc6-only.png)
