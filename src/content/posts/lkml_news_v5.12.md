---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-04-20T07:19:28+02:00
lastmod: 2021-04-20T07:19:28+02:00
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

[PATCH -next v3 1/2] mm/debug_vm_pgtable: Move {pmd/pud}_huge_tests out of CONFIG_TRANSPARENT_HUGEPAGE (Liu Shixin)
-------------------------------------------------------------------------------------------------------------------

The functions are not THP dependent in real, but made dependent.  This patch
moves it out.


[PATCH v10 0/7] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210419075413.1064-1-osalvador@suse.de

The 10th version of the patchset which allows Hugetlb pages allocated via
`alloc_contig_range()`, dynamically.


[PATCH v2 0/5] mm/madvise: introduce `MADV_POPULATE_(READ|WRITE)` to prefault page tables (David Hildenbrand)
-------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210419135443.12822-1-david@redhat.com

This is the second version of the patchset implementing
`MADV_POPULATE_(READ|WRITE)` for `madvise()` system call.  It could be used for
prefaulting pages.


Maintainers / Kernel Summit 2021 planning kick-off (Theodore Ts'o)
------------------------------------------------------------------

https://lkml.kernel.org/r/YH2hs6EsPTpDAqXc@mit.edu

The plan for maintainers/kernel summit 2021 is announced.  Those will be
co-located with LPC on Dublin, Ireland, from September 27th to 29th.  The
schedule could be changed depend on the vaccination situation, though.


[RFC] memory reserve for userspace oom-killer (Shakeel Butt)
------------------------------------------------------------

https://lkml.kernel.org/r/CALvZod7vtDxJZtNhn81V=oE-EPOf=4KZB2Bv6Giz+u3bFFyOLg@mail.gmail.com

This is a RFC proposing making userspace oom-killer has guaranteed memory.


[PATCH v2] docs: proc.rst: meminfo: briefly describe gaps in memory accounting (Mike Rapoport)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210420121354.1160437-1-rppt@kernel.org

This commit notifies the possible gaps in memory accounting, and how those
could be found.


[PATCH 000/190] Revertion of all of the umn.edu commits (Greg Kroah-Hartman)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210421130105.1226686-1-gregkh@linuxfoundation.org

It found a research team in University of Minnesota has intentionally submitted
malicious patches that don't fix real problems but introduce new security holes
and flaws into the Linux kernel, and a number of such patches merged in both
mainline and the stable trees.  This patchset is reverting all patches from
umn.edu as a reaction.


[PATCH] mm: compaction: improve /proc trigger for full node memory compaction (Charan Teja Reddy)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1619098678-8501-1-git-send-email-charante@codeaurora.org

`/proc/sys/vm/compact_memory` file triggers full node compaction and don't stop
even though the trigger application now suffice with progress.  This patch adds
`/proc/sys/vm/proactive_compact_memory` file, which triggers full node
compaction when an arbitrary value is written on it, but it can be stopped in
middle if `COMPACTION_HPAGE_ORDER` pages become available.


[MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches (James Bottomley)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com

As a followup of the University of Minnesota event, James proposed a maintainer
summit topic for trivial patches acceptance policy.


Linux 5.12 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wj3ANm8QrkC7GTAxQyXyurS0_yxMR3WwjhD9r7kTiOSTw@mail.gmail.com

I personally worried how the University of Minnesota happening affect the
release schedule.  Unlike concerns, v5.12 released as expected, after only one
extra rc.  This means the merge window for v5.13 started.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1..v5.12.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-04-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
