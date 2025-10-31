---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-07-11T07:08:29-07:00
lastmod: 2023-07-11T07:08:29-07:00
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

[Invitation] Linux MM Alignment Session on mshare on Wednesday (David Rientjes)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAE-26VAZZ+buEX0wbqHTz0k1hshYzYP3KzMmXT6jc6=NucPa0Q@mail.gmail.com

David from Google is hosting yet another Linux MM Alignment session on
Wednesday.  The topic of this week is the process page table sharing, which
could be a clear efficiency win for situations where huge number of processes
sharing same pages.


[PATCH v3 0/7] Add support for memmap on memory feature on ppc64 (Aneesh Kumar K.V)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230711044834.72809-1-aneesh.kumar@linux.ibm.com

This makes the memmap on memory feature more useful for ppc64-like
architectures having alignment rules that different with 64K page size.


[PATCH v1] mm/memory_hotplug: document the signal_pending() check in offline_pages() (David Hildenbrand)
--------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230711174050.603820-1-david@redhat.com

This patch adds a comment about `signal_pending()` in `offline_pages()`, which
explains why all signals are checked in the function.


[PATCH 0/4] memory tiering: calculate abstract distance based on ACPI HMAT (Huang Ying)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230712074900.404064-1-ying.huang@intel.com

Current tiering system uses fixed abstract distance for each tier.  This patch
further adds a calculation algorithm management mechanism for the distance,
provide it based on ACPI HMAT, and further use a general calculation interface
in dax/kmem driver.


[RFC PATCH v2 0/3] support large folio for mlock (Yin Fengwei)
--------------------------------------------------------------

https://lkml.kernel.org/r/20230712060144.3006358-1-fengwei.yin@intel.com

This patch makes large folio to be able to be `mlock()`-ed for large folio in
`VM_LOCKED` vma range case.


[RFC PATCH] madvise: make madvise_cold_or_pageout_pte_range() support large folio (Yin Fengwei)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230713150558.200545-1-fengwei.yin@intel.com

This patch fixes two problems of `madivse_cold_or_pageout_pte_range()` for
large folio support.


[PATCH] mm: kill frontswap (Johannes Weiner)
--------------------------------------------

https://lkml.kernel.org/r/20230714194610.828210-1-hannes@cmpxchg.org

This patch removes frontswap by making the only user of it, `zswap`, to
directly hook swap code instead of using the indirect layer, `frontswap`.


[PATCH v2 0/4] More strict maple tree lockdep (Liam R. Howlett)
---------------------------------------------------------------

https://lkml.kernel.org/r/20230714195551.894800-1-Liam.Howlett@oracle.com

Liam adds more lockdep checks to maple tree, as a response to Linus' request.
Linus immediately acked this.


Linux 6.5-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whXp01JfPMm9=xd6YDnNwoCbtoRZ7_fLYttLOuHnEeNJA@mail.gmail.com

The second release candidate of v6.5 has released with normal changes.  Of
course, that doesn't mean you can skip test of it.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc3..v6.5-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-07-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.5-rc2-only.png)
