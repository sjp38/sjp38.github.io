---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-04-25T07:41:36-07:00
lastmod: 2023-04-25T07:41:36-07:00
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

[PATCH v2 0/2] Reduce lock contention related with large folio (Yin Fengwei)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230425084627.3573866-1-fengwei.yin@intel.com

Ryan found large anonymous folios exposes some lock contention unlike large
page cache folios, because anonymous mapping is allocated/freed more
frequently.  This patchset mitigates the lock contention by avoid acquiring
queue lock unnecessarily, and allowing batched large folio list adds to lru
list.


[PATCH v2 0/3] fs: multigrain timestamps (Jeff Layton)
------------------------------------------------------

https://lkml.kernel.org/r/20230424151104.175456-1-jlayton@kernel.org

This patchset makes file system to support not single-gran timestamp but
multi-gran timestamps.


[LSF/MM/BPF TOPIC] The future of memory tiering (David Rientjes)
----------------------------------------------------------------

https://lkml.kernel.org/r/7443f0e6-6be2-3320-60d9-03da0cca2987@google.com

David is suggesting a last minute LSF/MM/BPF topic, regarding the memory
tiering future.


[GIT PULL] MM updates for 6.4-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20230427153345.451d86681f9c6775ea579e5a@linux-foundation.org

Andrew Morton has posted a memory mangement subsystem udpates pull request for
v6.4-rc1.  This includes Suren's per-VMA locking of `mmap_lock`.


[PATCH v2 0/2] memcg: OOM log improvements (Yosry Ahmed)
--------------------------------------------------------

https://lkml.kernel.org/r/20230428132406.2540811-1-yosryahmed@google.com

This patchset brings back some unnecessarily changed cgroup v1 stat in OOM
logs, and make it less `printk()` internals reliant.


[PATCH 1/1] mm: change per-VMA lock statistics to be disabled by default (Suren Baghdasaryan)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230428173533.18158-1-surenb@google.com

Linus asked per-VMA lock statistics to be disabled by default, in reply to the
MM pull request.  Linus argues all such things for debug should be disabled by
default.  Suren sent a patch for the change.


[PATCH RFC net-next/mm V3 0/2] page_pool: new approach for leak detection and shutdown phase (Jesper Dangaard Brouer)
---------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/168269854650.2191653.8465259808498269815.stgit@firesoul

This patchset moves leak detection algorithm from `page_pool` to mm layer page
allocator when `CONFIG_DEBUG_VM` is on.


[PATCH 00/40] Memory allocation profiling (Suren Baghdasaryan)
--------------------------------------------------------------

https://lkml.kernel.org/r/20230501165450.15352-1-surenb@google.com

Suren has posted the code tagging patchset again, but this time focused on a
real usage of the infrastructure, memory allocation profiling.


[syzbot] Monthly mm report (May 2023) (syzbot)
----------------------------------------------

https://lkml.kernel.org/r/0000000000000a842e05fac4fa77@google.com

Syzbot reports issues found for memory management subsystem.  For the last 31
days, 2 issues were fixed and 7 new issues detected.  In total, 47 issues still
open while 212 have bee n fixed.


[GIT PULL] final MM updates for 6.4-rc1 (Andrew Morton) (0+ msgs) (Andrew Morton)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230503162432.24a580b6c1a7fd465ed6bc2d@linux-foundation.org

Andrew Morton sent last pull requests containing memory management subsystem
updates for v6.4.


[PATCH] sysctl: add config to make randomize_va_space RO (Michael McCracken)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230504213002.56803-1-michael.mccracken@gmail.com

This patch introduces a new config `RO_RANDMAP_SYSCTL`, which sets
`randomize_va_space` sysctl permission as `0444` to disabllow all runtime
changes.


Linux 6.4-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiUxm-NZ1si8dXWVTTJ9n3c+1SRTC0V+Lk7hOE4bDVwJQ@mail.gmail.com

After the two weeks, the first release candidate for Linux v6.4-rc1 has
released.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc2..v6.4-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-05-08 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.4-rc1-only.png)
