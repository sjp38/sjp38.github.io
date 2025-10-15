---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-05-24T07:22:30-07:00
lastmod: 2022-05-24T07:22:30-07:00
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

[PATCH] arm64: enable THP_SWAP for arm64 (Barry Song)
-----------------------------------------------------

https://lkml.kernel.org/r/20220524071403.128644-1-21cnbao@gmail.com

This patch enables `THP_SWAP`, which can help swap performance on systems
having fast swap storages, for arm64.


[CFP LPC 2022] Kernel Memory Management Microconference (Vlastimil Babka)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/d24e9ac9-0903-3c15-c446-2962f44a360f@suse.cz

This year, LPC will have kernel memory management microconference.  It will
supplement the LSF/MM and lead by Matthew Wilcox and Vlastimil Babka.


[PATCH v2] arm64: enable THP_SWAP for arm64 (Barry Song)
--------------------------------------------------------

https://lkml.kernel.org/r/20220527100644.293717-1-21cnbao@gmail.com

Second version of the `THP_SWAP` enablement for arm64 has posted.


[GIT PULL] MM updates for 5.19-rc1 (Andrew Morton)
--------------------------------------------------

https://lkml.kernel.org/r/20220525114208.223f45e4b361d99b83be0c52@linux-foundation.org

A pull request of almost all of MM has posted by Andrew to Linus.  This
contains DAMON autotuning, fixed virtual address space ranges monitoring, etc.


[GIT PULL] hotfixes for 5.19-rc1 (Andrew Morton)
------------------------------------------------

https://lkml.kernel.org/r/20220527102947.9c7e74d491765ba74bb81374@linux-foundation.org

Six mm fixes for v5.19-rc1 are pull-requested.  Five among those are also for
stable series.


[GIT PULL] additional MM updates for 5.19-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lkml.kernel.org/r/20220527103014.517818624f9f6d4f0ba0b523@linux-foundation.org

Andrew's pull request of mm changes have posted to Linus.  This mail also
contains some plans for the maple tree and the MGLRU merge.  Maple tree would
be merged in for v5.20, and then MGLRU would be.


RFC: Memory Tiering Kernel Interfaces (v4) (Wei Xu)
---------------------------------------------------

https://lkml.kernel.org/r/CAAPL-u9Wv+nH1VOZTj=9p9S70Y3Qz3+63EkqncRDdHfubsrjfw@mail.gmail.com

Revised scheme for memory tiering kernel interface requesting comments have
posted.


ZSWAP still considered experimental? (Diederik de Haas)
-------------------------------------------------------

https://lkml.kernel.org/r/10087857.nUPlyArG6x@bagend

Diederik asks if it makes sense to mark zswap as experimental, as it has been a
while after it has merged.  Last change to zswap.rst was 2013-07-11.


[PATCH v5 0/6] mm: introduce shrinker debugfs interface (Roman Gushchin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220601032227.4076670-1-roman.gushchin@linux.dev

Fifth version of the patchset for adding a good debugfs interface for shrinkers
have posted.


[PATCH v1 0/5] mm, hwpoison: enable 1GB hugepage support (Naoya Horiguchi)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20220602050631.771414-1-naoya.horiguchi@linux.dev

This patchset enables memory error handling on 1GB hugepage.


[PATCH v5 0/9] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220603134237.131362-1-aneesh.kumar@linux.ibm.com

Memory tier is created during the kernel initialization and updated when NUMA
nodes are hot-added or hot-removed, and therefore there are some cases where it
needs to be more flexible.  This patchset makes the memory tier creation
explicit under the control of userspace and/or device drivers.


[PATCH v6 00/15] mm: userspace hugepage collapse (Zach O'Keefe)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220604004004.954674-1-zokeefe@google.com

After the discussion, sixth version of the user space hugepage collapse patch
has posted.  It changed its eligibility semantics by decoupling `MADV_COLLAPSE`
from sysfs enabled setting, simplify the huge pages allocation code path, and
the selftest hack has removed.


[RFC PATCH 0/3] Add PUD and kernel PTE level pagetable account (Bailin Wang)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1654271618.git.baolin.wang@linux.alibaba.com

This patchset introduces two new helpers for accounting PUD and kernel PTE
pagetable pages.


[GIT PULL] hotfixes for 5.19-rc1 (Andrew Morton)
------------------------------------------------

https://lkml.kernel.org/r/20220605113808.2cf854614e3aff3790b7c49e@linux-foundation.org

A few hotfixes for 5.19-rc1 has pull-requested by Andrew Morton.


Linux 5.19-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgZt-YDSKfdyES2p6A_KJoG8DwQ0mb9CeS8jZYp+0Y2Rw@mail.gmail.com

The two weeks of the merge window was fairly normal, though some pull requests
were sent a little bit late.  That said, this merge window had more signed pull
requests, and especially Andrew Morton used the git this time.  Anyway, the
merge window has closed and the rc1 has released.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8-rc1..v5.19-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-06-06 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v5.19-rc1-only.png)
