---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-06-27T07:35:23-07:00
lastmod: 2023-06-27T07:35:23-07:00
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

[GIT PULL] MM updates for 6.5-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20230626085035.e66992e96b4c6d37dad54bd9@linux-foundation.org

Andrew Morton sent the memory management subsystem pull request for v6.5-rc1.
Among the change, `cachestata()` syscall and Mel Gorman's compaction
optimization looks interesting to me.


[GIT PULL] slab updates for 6.5 (Vlastimil Babka)
-------------------------------------------------

https://lkml.kernel.org/r/1c39c9b0-ec37-f910-2b09-cedf7acf6e91@suse.cz

Vlastimil sent the slab pull request for v6.5 to Linus Torvalds.  This contains
the SLAB config deprecation renaming (`s/CONFIG_SLAB/CONFIG_SLAB_DEPRECATED/`).


[PATCH v1 0/5] mm/memory_hotplug: make offline_and_remove_memory() timeout instead of failing on fatal signals (David Hildenbrand)
----------------------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230627112220.229240-1-david@redhat.com

`offline_and_remove_memory()` checks fatal signals to allow timeout.  It works
for sysfs-based direct offlining, but no much sense for out-of-tree drivers.
This patchset implements timeout feature directly for the function.


[PATCH] writeback: Account the number of pages written back (Matthew Wilcox)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230628185548.981888-1-willy@infradead.org

Currently `nr_to_write` of `struct writeback_contro` is wrongly set because
it's not accounting the number of pages written back.  This commit fixes it to
account by decreasing the number of pages in the folio we just wrote.


[PATCH v6 0/6] Per-VMA lock support for swap and userfaults (Suren Baghdasaryan)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230630020436.1066016-1-surenb@google.com

The sixth version of the patchset that adding support of per-vma lock for swap
and userfaults.


[PATCH v2] Documentation/mm: Add information about kmap_local_folio() (Fabio M. De Francesco)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230701142041.9992-1-fmdefrancesco@gmail.com

This patch updates the highmem documentation to add information about
`kmap_local_folio()`.


[PATCH 1/1] mm: disable CONFIG_PER_VMA_LOCK by default until its fixed (Suren Baghdasaryan)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230703182150.2193578-1-surenb@google.com

A memory corruption that supposed to be occurred due to per-VMA lock enabling
has found.  To fix the regression first, this patch disables per-VMA lock by
default, until the issue is fixed.


[PATCH 1/1] fork: lock VMAs of the parent process when forking (Suren Baghadasaryan)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230704200656.2526715-1-surenb@google.com

This patch fixes the memory corruption problem due to the per-vma locking.  It
makes `fork()` slower, though.  On stress testing, about 5% regression was
found.  A solution for avoiding the regression is turning `CONFIG_PER_VMA_LOCK`
off.


[PATCH] memcg: drop kmem.limit_in_bytes (Michal Hocko)
------------------------------------------------------

https://lkml.kernel.org/r/20230704115240.14672-1-mhocko@kernel.org

`kmem.limit` memcg file has been deprecated since v5.16.  Michal tries to
entirely remove it, since existence of it only causes confusion and bugs.  He
further wants the removal to be applied to stable kernels.


[RFC PATCH 2/2] zram: charge the compressed RAM to the page's memcgroup (Zhongkun He)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230707044707.1169285-1-hezhongkun.hzk@bytedance.com

The compressed memory for zram is not charged to any memcg but kernel.  This
patch makes those to be charged to the memcg.


[PATCH] mm:vmscan: fix inaccurate reclaim during proactive reclaim (Efly Young)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230707103226.38496-1-yangyifei03@kuaishou.com

`memory.reclaim` memcg file based reclaim is still inaccurate, in terms of the
amount of memory it reclaims.  This commit further fixes it.


Linux 6.5-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj8sPDVoWgaceAs1AiwZrHV8mtC3vQNGbeV6-RypJi6aw@mail.gmail.com

After the two weeks of the merge window for Linux v6.5, the first release
candidate has released.  Nothing unusual stands out.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc2..v6.5-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-07-10 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.5-rc1-only.png)
