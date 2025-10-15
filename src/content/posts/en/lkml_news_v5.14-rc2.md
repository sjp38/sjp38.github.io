---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-07-13T07:17:44+02:00
lastmod: 2021-07-13T07:17:44+02:00
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

[PATCH v6 0/6] Introduce multi-preference mempolicy (Feng Tang)
---------------------------------------------------------------

https://lkml.kernel.org/r/1626077374-81682-1-git-send-email-feng.tang@intel.com

Six version of the patchset that allows applications to set multiple preferred
memory policy.


[PATCH v1] madvise.2: Document MADV_POPULATE_READ and MADV_POPULATE_WRITE (David Hildenbrand)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com

This patch documents the new `madvise()` options, `MADV_POPULATE_(READ|WRITE)`.


Request for folios (David Howells)
----------------------------------

https://lkml.kernel.org/r/3398985.1626104609@warthog.procyon.org.uk

David is working for improving local filesystem's caching and network
filesystem support library.  He thinks the folio work would make his work
easier, though it also makes some of his work challenging.  Therefore, he is
asking Andrew to merge it in the -mm tree.


[PATCH v13a 00/32] Memory folios (Matthew Wilcox)
-------------------------------------------------

https://lkml.kernel.org/r/20210712190204.80979-1-willy@infradead.org

This patchset adds a new type for managing pages, called folios.  It allows
dealing with variable sized pages simpler.


[PATCH v13b 00/18] Convert memcg to folios (Matthew Wilcox)
-----------------------------------------------------------

https://lkml.kernel.org/r/20210712194551.91920-1-willy@infradead.org

This is the second part of memory folios.  On top of memofy folios
introduction, this patchset converts memcg to use folios for better handling of
variable-sized pages.


[PATCH v3 00/14] mm, sparse-vmemmap: Introduce compound pagemaps (Joao Martins)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210714193542.21857-1-joao.m.martins@oracle.com

This patchset is for further reducing `struct page` memory overhead for huge
pages.  It applies the strategy of Muchun Song
(https://lore.kernel.org/linux-mm/20210308102807.59745-1-songmuchun@bytedance.com/)
further to PMD.


mmotm 2021-07-15-18-29 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210716012956.QCXYl0cgg%akpm@linux-foundation.org

mmotm has finally updated after the 5.14 mergewindow.


[PATCH v5] mm: introduce reference pages (Peter Collingbourne)
--------------------------------------------------------------

https://lkml.kernel.org/r/20210717025757.3945742-1-pcc@google.com

In case of anonymous pages allocations, the memory region is initially mapped
to clean zero page.  This patch introduces a new syscall, `refpage_create()`,
which makes the memory regions to be initially mapped to a page containing
user-specificed contents, instead of the zero page.


Linux 5.14-rc2
--------------

https://lkml.kernel.org/r/CAHk-=wjYghA5O+ZsWKVNApMK3j4V1EibO5P+c4MrHnqp8YhY=g@mail.gmail.com

The second release candidate for Linux v5.14 is released.  This release is
larger than expected.  It is largest rc2 during 5.x.  This might mean there are
something wrong, but no certainly wrong things found, so it must be too early
to say so.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc2..v5.14-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-07-19 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc2-only.png)
