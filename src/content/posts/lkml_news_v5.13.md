---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-06-22T07:02:23+02:00
lastmod: 2021-06-22T07:02:23+02:00
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

[PATCH v4] mm: introduce reference pages (Peter Collingbourne)
--------------------------------------------------------------

https://lkml.kernel.org/r/20210619092002.1791322-1-pcc@google.com

This patch introduces a new syscall, `refpage_create()`.  This system creates a
file descriptor which can be mmap-ed using `mmap()`, which will be similar to
anonymous mapping but the memory will be backed by a reference page instead of
the zero page.


[PATCH 0/3] mm/page_reporting: Make page reporting work on arm64 with 64KB page size (Gavin Shan)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210621051152.305224-1-gshan@redhat.com

This patchset makes the page reporting to work on ARM with more realistic
threshold, which is 2MB instead of 512MB, when the system's page size is 64KB.
This will be very helpful for memory-fragmented systems.


[LSF/MM TOPIC] Impact on core mm from new hardware features (Dave Hansen)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/51d3010b-6324-2441-42c0-27bb536c897d@intel.com

Dave is proposing a LSF/MM session for discussion on core mm changes for
Intel's new hardware features including shadow stack, linear address masking,
supervisor protection key, and TDX.


[PATCH v12 00/33] Memory folios (Matthew Wilcox)
------------------------------------------------

https://lkml.kernel.org/r/20210622114118.3388190-1-willy@infradead.org

This patchset introduces memory folio, which is a new abstraction for pages of
different size.  This makes the handling of compound pages be easy.


[PATCH v2 00/46] Folio-enabling the page cache (Matthew Wilcox)
---------------------------------------------------------------

https://lkml.kernel.org/r/20210622121551.3398730-1-willy@infradead.org

This patchset converts filesystems to use memory folios.


[PATCH 1/1] mm: introduce process_reap system call (Suren Baghdasaryan)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20210623192822.3072029-1-surenb@google.com

This patch introduces a new system call, `process_reap()`, which reclaims
memory of a dying process from the caller's context.  This can be helpful for
reclaiming memory consumed by other process in predictable time.


[PATCH -V9 0/9] Migrate Pages in lieu of discard (Huang Ying)
-------------------------------------------------------------

https://lkml.kernel.org/r/20210625073204.1005986-1-ying.huang@intel.com

A patchset for the tiered memory systems.  This patchset makes cold pages to be
located in slower memory, like pmem.


Linux 5.13 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wj7E9iTGHbqfgtaTAM09WrVzwXjda2_D59MT8D_1=54Rg@mail.gmail.com

After the seven release candidates, Linux v5.13 is out.  It is one of the
bigger 5.x releases.  It has over 16k commits from over 2k people.  Obviously,
this also means the merge window for 5.14 has opened.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2..v5.13.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-06-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
