---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-06-21T07:12:43-07:00
lastmod: 2022-06-21T07:12:43-07:00
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

[PATCH Part2 v6 00/49] Add AMD Secure Nested Paging (SEV-SNP) (Ashsh Kalra)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1655761627.git.ashish.kalra@amd.com

This is second part patchset of Secure Encrypted Paging (SEV-SNP) work, which
focuses on the changes required in a host OS for the feature support.


[PATCH v7 00/12] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20220622082513.467538-1-aneesh.kumar@linux.ibm.com

This patchset improves memory tiers construction to be more explicit and
flexible, and memory allocation for demotion to have no change.


[PATCH] mm: vmpressure: don't count userspace-induced reclaim as memory pressure (Yosry Ahmed)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220623000530.1194226-1-yosryahmed@google.comu

PSI don't count the memory reclaim that has induced by the userspace via
`memory.reclaim` as pressure, but `vmpressure` is still counting it as
pressure.  This commit fixes the inconsistent behavior.


[PATCH v5 00/7] Drain remote per-cpu directly  (Mel Gorman)
-----------------------------------------------------------

https://lkml.kernel.org/r/20220624125423.6126-1-mgorman@techsingularity.net

This patchset introduces a mechanism to remotely drain per-cpu lists so that
latency sensitive applications don't get the interference due to per-cpu lists
draining works that can be queued by ``__drain_all_pages()``.


Linux 5.19-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjRt2bxDDT9-Uq337dAg6jipZfetgSsHejggU=JHmyK6A@mail.gmail.com

In contrast to the second and the third release candidates for 5.19, which were
fairly small, rc4 is a bit larger.  Torvalds says it's not what he really
wanted to see but also not that scary, as changes are also fairly spread.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc4..v5.19-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-06-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v5.19-rc4-only.png)
