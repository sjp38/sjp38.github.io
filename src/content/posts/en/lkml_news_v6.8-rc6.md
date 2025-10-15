---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-02-20T06:34:52-08:00
lastmod: 2024-02-20T06:34:52-08:00
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

[PATCH V2 0/2] Introduce slabinfo version 2.2 (Fangzheng Zhang)
---------------------------------------------------------------

https://lkml.kernel.org/r/20240219031911.10372-1-fangzheng.zhang@unisoc.com

This patchset updates slabinfo to version 2.2 and adds slabreclaim column for
recording whether each slab pool is reclaim type.


[RFC PATCH 0/3] make the hugetlb migration strategy consistent (Baolin Wang)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1708507022.git.baolin.wang@linux.alibaba.com

Falling back to other NUMA nodes when migrating freed hugetlb is prevented
while it is allowed for in-use hugetlb.  This patchset make it more clear and
consistent.


[Invitation] Linux MM Alignment Session on Cold Page Detection on Wednesday (David Rientjes)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/aa854cdd-469a-5dff-9b1c-2df8de5c0a55@google.com

David hosts next MM alignment session with topic of cod page detection that
made with MGLRU, and extending virtio balloon with the information for in-guest
use.


[PATCH v4 00/36] Memory allocation profiling (Suren Baghdasaryan)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20240221194052.927623-1-surenb@google.com

Surent posted the fourth version of the code tagging based memory allocation
profiling patchset based on the comments on the third version.


[LSF/MM/BPF TOPIC] Hugetlb Unifications (Peter Xu)
--------------------------------------------------

https://lkml.kernel.org/r/ZdcKwK7CXgEsm-Co@x1n

Peter porposes an LSFMM topic for discussion on making hugetlb more easy to be
maintained, since it was having its own code paths in core mm due to legacy
reasons, and it is making maintenance more difficult.


[LSF/MM/BPF TOPIC] Dynamic Growth of Kernel Stacks (Pasha Tatashin)
-------------------------------------------------------------------

https://lkml.kernel.org/r/CA+CK2bBYt9RAVqASB2eLyRQxYT5aiL0fGhUu3TumQCyJCNTWvw@mail.gmail.com

Pasha introduces Google is maintaining 8K kernel stack to conserve memory while
the upstream is using 16K kernel stack since 2014.  But Google also getting
problems at the too small stack size and gonna increase the size.  For more
efficiency, Pasha proposes dynamic kernel stack size as a topic for LSFMM.


[GIT PULL] hotfixes for 6.8-rc6 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240222150609.61c32cf2ababec81509bf5fc@linux-foundation.org

Andrew sent hotfixes of mm subsystem for 6.8-rc6 to Linus Torvalds


[PATCH RFC] mm: madvise: pageout: ignore references rather than clearing young (Barry Song)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240223041550.77157-1-21cnbao@gmail.com

Barry sent an RFC making `MADV_PAGEOUT` to not clear PTE accessed bit.  It adds
a parameter for ignoring the reference on `reclaim_folio_list()`, and modify
the call from `madivise()` to do ignore the references, while keeping the call
from DAMON paddr operations set to not ignore the references.


Linux 6.8-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whZ=iA6DhijePcW-pJjZ8YD4T5qLpLKVSUT+4gWNm_0sA@mail.gmail.com

After another week, the sixth release candidate for Linux v6.8 is announced.
The rc6 became technically bit smaller than rc5, but not as small as Torvalds
hoped.  Torvalds says we _might_ need rc8 for this release, but nothing fixed.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-02-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc6-only.png)
