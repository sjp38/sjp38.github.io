---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-03-07T11:19:27+01:00
lastmod: 2021-03-07T11:19:27+01:00
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

[PATCH 00/10] [v6] Migrate Pages in lieu of discard (Dave Hansen)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20210304235949.7922C1C3@viggo.jf.intel.com

When the system configured with both DRAM and persistent memory, current kernel
starts reclamation when DRAM fulls even though there are some space in
persistent memory.  And from some point, all page allocation is done on the
persistent memory only, even though DRAM has some free slots now.

This patchset mitigates the problem by migrating pages that about to be
reclaimed to persistent memory.  The migration destination could be any slow
tier memory.


[PATCH RFCv2] mm/madvise: introduce `MADV_POPULATE_(READ|WRITE)` to prefault/prealloc memory (David Hildenbrand)
----------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210308164520.18323-1-david@redhat.com

For user space sparse memory mappings management (e.g., hypervisors for memory
ballooning or similar techniques or memory allocators), dynamic population and
discard of such a sparse memory region is beneficial.  This commit implements
two new `madvise()` hints for the purpose.


[PATCH v4 0/5] Allocate memmap from hotadded memory (per device) (Oscar Salvador)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210309175546.5877-1-osalvador@suse.de

This patchset reduces memory overhead due to hot-added memory, for
`SPARSEMEM_VMEMMAP` memory model.  The main three problems are, we are
consuming additional memory even before hot-added memory is onlined, `memmap`
could located on a different numa node, and `memmap` could populated with base
pages only if the memory is fragmented.  This patchset mitigates the problems
by allocating the `memmap` from the hot-added memory itself.


[PATCH 0/5] Introduce a bulk order-0 page allocator with two in-tree users (Mel Gorman)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210310104618.22750-1-mgorman@techsingularity.net

This patchset introduces a bulk order-0 page allocator and make sunrpc and
network pagepool to be the users of it.


[PATCH v4 0/4] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210310150853.13541-1-osalvador@suse.de

This commit let `alloc_contig_range()` which allocates physically contiguous
memory, to handle HugeTLB pages for better flexibility.


[RFC -V6 0/6] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210311081821.138467-1-ying.huang@intel.com

This is a followup of not-yet-merged patchset, 'Migrate Pages in lieu of
discard'.  These are part of the pmem-based numa balancing. That is, placing
hot pages in DRAM and cold pages in pmem node.


[PATCH v1 00/14] Multigenerational LRU (Yu Zhao)
------------------------------------------------

https://lkml.kernel.org/r/20210313075747.3781593-1-yuzhao@google.com

This patchset makes the page reclamation logic to make finer-grained eviction
target decision, by maintaining multiple LRU lists based on their age.  The
aging is done by finding newly referenced pages via page table scanning.  After
that, when eviction is needed, it selects the eviction target pages from the
oldest lru list.

They used this approach on Chrome OS and achieved 96% fewer low-memory tab
discards and 59% fewer OOM kills.


Linux 5.12-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgAr4Z2deEQs+5L6bJb68FouwBZUSURh+m-47TBnEsGZg@mail.gmail.com

This round of the release is pretty big compared to other rc3, but it's due to
early release of rc2.  There are also many rebased commits that made due to the
swap file bug in rc1, which marked as recent unnecessarily.  Excluding such
things, this release is actually smaller than usual, Torvalds says.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc2..v5.12-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc3-only.png)
