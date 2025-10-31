---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-01-11T07:08:23+01:00
lastmod: 2022-01-11T07:08:23+01:00
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

[PATCH 0/3] usable memory range fixes (arm64/fdt/efi) (Frank van der Linden)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20220110210809.3528-1-fllinden@amazon.com

This patchset fixes the usable memory range behavior when both DT and EFI are
given.


[PATCHv2 0/7] Implement support for unaccepted memory (Kirill A. Shutemov)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20220111113314.27173-1-kirill.shutemov@linux.intel.com

UEFI spec 2.9 introduces a concept of memory acceptance.  It requires virtual
machine platforms such as Intel TDX or AMD SEV-SNP to _accept_ memory before
use it.  This patchset makes Linux kernel to support it, and therefore be able
to reduce VM booting time by optimizing the acceptance.


[PATCH v2 0/2] powerpc/fadump: handle CMA activation failure appropriately (Hari Bathini)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220112193340.149020-1-hbathini@linux.ibm.com

CMA based memory reservation for fadump doesn't aware CMA activation failures.
This patch makes it to aware the failure and handle it appropriately.


[RFC PATCH 0/3] Add hugetlb MADV_DONTNEED support (Mike Kravetz)
----------------------------------------------------------------

https://lkml.kernel.org/r/20220113180308.15610-1-mike.kravetz@oracle.com

Hugetlbfs does not support `MADV_DONTNEED` for now, but it's not really so hard
to make it support the hint.  This patch enables the support.


[RFC PATCH v2 0/5] User Managed Concurrency Groups (Peter Oskolkov)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20220113233940.3608440-1-posk@google.com

This patchset is an updated version of the user-managed concurrency group,
which adds two patches from Peter Zijlstra.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220114140222.6b14f0061194d3200000c52d@linux-foundation.org

Andrew sends 146 patches for v5.17 mm subsystem to Linus Torvalds.


[PATCH 00/12] Enabling large folios for 5.17 (Matthew Wilcox)
-------------------------------------------------------------

https://lkml.kernel.org/r/20220116121822.1727633-1-willy@infradead.org

This patchset enables large folios on THP enabled machine when XFS is used.
More specifically, it makes readaheads to use large folios.  This is not for
v5.17, though.


[GIT PULL] slab for 5.17 - part 2 (Vlastimil Babka)
---------------------------------------------------

https://lkml.kernel.org/r/06e9cd6c-320c-af1a-ef12-55e2e8c13f17@suse.cz

Second pull request for remaining slab patches in the development tree.
Specifically, this pull request finish the conversion to `struct slab` by
removing slab-specific fields from `struct page`.


[RFC PLAN] Some humble ideas for DAMON future works (SeongJae Park)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20220119133110.24901-1-sj@kernel.org

A roadmap of DAMON work has shared.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220119180714.9e187ce100e4510de3cd9f7d@linux-foundation.org

Second pull request for mm/ from Andrew Morton to Linus Torvalds has sent.


[RFC][PATCH v2 0/5] sched: User Managed Concurrency Groups (Peter Zijlstra)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220120155517.066795336@infradead.org

Another update on the RFC stage patchset for user-managed concurrency groups.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220121221021.60533b009c357d660791476e@linux-foundation.org

Yet another pull request for post-linux-next patches (69 in total) are sent
from Andrew Morton to Linus Torvalds.


Linux 5.17-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whUYZvNVtNc4Xftd8aDpZzuwswBtHG4fCYQ2AC3twh_5Q@mail.gmail.com

A couple of hors earlier than usual, the rc1 for 5.17 has released.  It's not a
huge release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc1..v5.17-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-01-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v5.17-rc1-only.png)
