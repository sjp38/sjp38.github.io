---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-04-30T06:44:38-07:00
lastmod: 2024-04-30T06:44:38-07:00
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

[PATCH] thp: Remove HPAGE_PMD_ORDER minimum assertion (Matthew Wilcox)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20240429190114.3126789-1-willy@infradead.org

Willy removes the assumption that THP order is always two or more, since we now
handle order-1 folios correctly.


[LSF/MM/BPF TOPIC] SLUB: what's next? (Vlastimil Babka)
-------------------------------------------------------

https://lkml.kernel.org/r/b929d5fb-8e88-4f23-8ec7-6bdaf61f84f9@suse.cz

Vlastimil proposes an LSFMM session to retrospect the SLAB deprecation, share
ongoing works, and discuss possible future works for reducing similar
allocators such as objpool or mempool.


[LSF/MM/BPF TOPIC] Maple Tree Proposed Features (Liam R. Howlett)
-----------------------------------------------------------------

https://lkml.kernel.org/r/rqvsoisywsbb326ybechwwgpdrdt57sngr2zwwrbp2riyi7ml5@uppobkrmbxoz

Liam suggests an LSFMM topic to discuss what Maple Tree functionality people
want/need for their projects.


[PATCHSET v6] sched: Implement BPF extensible scheduler class (Tejun Heo)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20240501151312.635565-1-tj@kernel.org

Tejun posted the sixth version of the sched-ext patchset.  In the patchset, he
introduces wide and ongoing adoption of the patchset, explaining why it should
be merged.


[PATCH] cgroup: Add documentation for missing zswap memory.stat (Usama Arif)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240501095349.1407643-1-usamaarif642@gmail.com

Usama posted a patchset updating `memory.stat` documentation for
`zswp{in,out,wb}`.


[PATCH v15 00/20] Add AMD Secure Nested Paging (SEV-SNP) Hypervisor Support (Michael Roth)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240501085210.2213060-1-michael.roth@amd.com

Michael sent fifteenth version of the AMD SEV-SNP hyperviso support patchset.


[PATCH 0/5] ioctl()-based API to query VMAs from /proc/<pid>/maps (Andrii Makryiko)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240504003006.3303334-1-andrii@kernel.org

Andrii adds `ioclt()`-based binary API for querying VMAs, more efficiently than
text-based `maps` file reading.


[PATCH v1 0/7] mm: workingset reporting (Yuanchu Xie)
-----------------------------------------------------

https://lkml.kernel.org/r/20240504073011.4000534-1-yuanchu@google.com

Yuanchu dropped the RFC tag from his workingset reporting patchset and posted
the first version.
 

Linux 6.9-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiT0EJV+X-=-dMmL+q3_kyQCxV-WPxb8m8Q6dtWOxjCcg@mail.gmail.com

Linus released the seventh candidate for Linux v6.9.  Statistics looks normal,
nothing is alarming.  We may get the Linux v6.9 next Sunday.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ relstat.py --since 2022-04-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/linux_stat_v6.9-rc7-only.png)
