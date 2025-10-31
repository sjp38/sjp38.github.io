---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-11-24T07:20:51+01:00
lastmod: 2021-11-24T07:20:51+01:00
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

[PATCH 0/3] page table check (Pasha Tatashin)
---------------------------------------------

https://lkml.kernel.org/r/20211123214814.3756047-1-pasha.tatashin@soleen.com

Due to reference count of `struct page` handling issue, some memory were leak
from a process and moved in another process.  This commit avoids such type of
bugs by checking page table at the time of entrieds insertion.


[PATCH 0/5] `*** Transparent Page Placement for Tiered-Memory ***` (Hasan Al Maruf)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211124163608.33015-1-hasanalmaruf@fb.com

This patchset augment AutoNUMA mechanism to promote pages from slow tier nodes
to toptier nodes.


mmotm 2021-11-24-15-49 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211124234931.iDJQctzrQ%akpm@linux-foundation.org

MMOTM updated.  It is now based on v5.16-rc2.  Compared to the last update, it
adds 75 new patches, modifies 43 existing patches, drops 18 patches.  In total,
174 patches are in the queue.


[PATCH v2] mm: split thp synchronously on MADV_DONTNEED and munmap (Shakeel Butt)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211125024523.2468946-1-shakeelb@google.com

This patch makes `madvise(MADV_DONTNEED)` to split THP synchronously, so that
memory usage drops as intended.  This version adds `munmap()` support.


[PATCH v1 0/2] virtio-mem: prepare for granularity smaller than MAX_ORDER - 1 (David Hildenbrand)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211126134209.17332-1-david@redhat.com

Currently, virtio-mem driver supports logical hot(un)plug in (`MAX_ORDER - 1`)
granularity (4 MiB on x86-64).  This makes hot(un)plug inflexible, and also
fails more likely on `ZONE_NORMAL`.  David is therefore planning to make it
works in pageblock granularity, which is 2 MiB on x86-64.  This patchset
prepares the work.


Linux 5.16-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgtC_D-irsmyC89JPE1mnAAGJTc8qaNwaqcNUrt66TDMw@mail.gmail.com

The third release candidate for v5.16 has released.  It's in the normal range
of size, though last week was the Thanksgiving week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc2..v5.16-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc3-only.png)
