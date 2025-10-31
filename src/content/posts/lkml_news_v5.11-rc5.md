---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.11-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-01-19T07:46:00+01:00
lastmod: 2021-01-19T07:46:00+01:00
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

[PATCH v2 00/27] Page folios (Matthew Wilcox)
---------------------------------------------

https://lkml.kernel.org/r/20210118170148.3126186-1-willy@infradead.org

This is the second version of the page folios patchset.  This introduces a new
struct named folio.  Functions that receive folio as an argument always
receives head page, so the function don't need to do ``compound_head()``.


[PATCH -V9 0/3] numa balancing: Migrate on fault among multiple bound nodes (Huang Ying)
----------------------------------------------------------------------------------------

https://lkml.kernek.org/r/20210120061235.148637-1-ying.huang@intel.com

This patch make optimization of cross-socket memory accesses for AutoNUMA in
case of application is bound to multiple NUMA nodes possible.


[PATCH 1/1] process_madvise.2: Add process_madvise man page (Suren Baghdasaryan)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210120202337.1481402-1-surenb@google.com

This patch is for the man page of the `process_madvise()` system call.


[PATCH v2 0/5] create hugetlb flags to consolidate state (Mike Kravetz)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20210120013049.311822-1-mike.kravetz@oracle.com

Hugetlb specific page state information is stored in hard to
read/understand/maintain way.  This patch series store hugetlb specific page
flags in the 'private' field of 'struct page' to mitigate the problem.


[PATCH v6 00/14] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20210120014333.222547-1-pasha.tatashin@soleen.com

This patch makes movable pages really movable by prohibiting pinning them in
`ZONE_MOVABLE`.


[PATCH RFC 0/6] fix the negative dentres bloating system memory usage (Gautham Ananthakrishna)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1611235185-1685-1-git-send-email-gautham.ananthakrishna@oracle.com

This commit mitigates the memory bloat caused by 'negative dentries' by moving
those to end of siblings list and keep dcache at most three unreferenced
negative dentries in each hash bucket.


Linux 5.11-rc5
--------------

https://lkml.kernel.org/r/CAHk-=wgmJ0q1URHrOb-2iCOdZ8gYybiH6LY2Gq7cosXu6kxAnA@mail.gmail.com

The fifthe release candidate for v5.11 is slightly larger than usual.  Mainly
because of about 40~\% commits for -rc5 which came in the last day.  Noticeable
change is regression due to `get rid of set_fs()` change that made for v5.10.
The regression was under rare-to-happen condition, but seems now v5.10 is
widespread enough to let people notice such problems.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.0-rc5..v5.11-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-01-25 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.11-rc5-only.png)
