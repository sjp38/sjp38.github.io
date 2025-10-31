---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-04-06T07:17:14+02:00
lastmod: 2021-04-06T07:17:14+02:00
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

[RFC PATCH v1 00/11] Manage the top tier memory in a tiered memory (Tim Chen)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1617642417.git.tim.c.chen@linux.intel.com

There are two patchsets for better handling of tiered-memory.  `[PATCH 00/10]
[v7] Migrate Pages in lieu of discard`
(https://lore.kernel.org/linux-mm/20210401183216.443C4443@viggo.jf.intel.com/)
makes cold pages to be placed in PMEM instead of DRAM, and `[PATCH 0/6] [RFC
v6] NUMA balancing: optimize memory placement for memory tiering system`
(https://lore.kernel.org/linux-mm/20210311081821.138467-1-ying.huang@intel.com/)
allows hot pages to be placed in DRAM instead of PMEM.

This patchset further improves the situation, by providing memory monitors on
the top tier memory that each cgroup is using, and enables kswapd to demote top
tier memory from cgroups when excess top tier memory usage is observed.  In
other words, this allows provisioning of different amount of top tier memory
for each cgroup, depending on each cgroup's needs.


[PATCH v7 00/28] Memory Folios (Matthew Wilcox)
-----------------------------------------------

https://lkml.kernel.org/r/20210409185105.188284-1-willy@infradead.org

Seventh version of the page folio patchset.  It makes THP handling simpler.


Linux 5.12-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiHGchP=V=a4DbDN+imjGEc=2nvuLQVoeNXNxjpU1T8pg@mail.gmail.com

Unlike the sixth rc, which shrinked as expected, this time it became bigger
than usual.  It's biggest rc7 for 5.x series.  Torvalds says it's due to the
networking fixes that didn't arrive in last release but this release.  So we
will see rc8 next week unless the it is calm enough like dead.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc6..v5.12-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc7-only.png)
