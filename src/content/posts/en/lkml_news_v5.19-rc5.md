---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-06-28T05:02:58-07:00
lastmod: 2022-06-28T05:02:58-07:00
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

[PATCH v3] docs: rename Documentation/vm to Documentation/mm (Mike Rapoport)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20220627060026.180439-1-rppt@kernel.org

As the subject says, this commit renames the Documentation/vm directory to
Documentation/mm.


[PATCH v6 0/4] KVM: mm: count KVM mmu usage in memory stats (Yosry Ahmed)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220628220938.3657876-1-yosryahmed@google.com

This patchset allows users account KVM mmu usages with `NR_SECONDARY_PAGETABLE`
memory stat.


[RFC PATCH] mm/slub: enable debugging memory wasting of kmalloc (Feng Tang)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220630014715.73330-1-feng.tang@intel.com

As kmalloc allocates memory in power of 2 granularity, it could waste a lot of
memory.  This patch therefore implements a way for tracking each kmalloc's
memory waste for bettr debugging.


[PATCH v3] mm: vmpressure: don't count proactive reclaim in vmpressure (Yosry Ahmed)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220630083044.997474-1-yosryahmed@google.com

This commit makes vmpressure to not be triggered by the reclaim caused by
writing to `memory.reclaim`, as it is intended to be used while not affecting
the performance.


[PATCH v4 00/45] Add KernelMemorySanitizer infrastructure (Alexander Potapenko)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220701142310.2188015-1-glider@google.com

This patchset addds KernelMemorySanitizer infrastructure in Linux kernel.


Linux 5.19-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgAOr-+OWLGo+aCMjGWiJ8xMYXUm0v5f-G+eizmPa3kKw@mail.gmail.com

The fifth release candidate has released in a slightly smaller than usual size.
This might mean that that the previous release candidate was larger than usual
just for a random timing issue.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc5..v5.19-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-07-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v5.19-rc5-only.png)
