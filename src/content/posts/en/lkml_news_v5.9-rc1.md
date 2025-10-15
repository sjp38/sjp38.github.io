---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-08-04T07:08:27+02:00
lastmod: 2020-08-04T07:08:27+02:00
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

mm: sort freelist by rank number (Cho KyongHo)
----------------------------------------------

https://lkml.kernel.org/r/1596435031-41837-1-git-send-email-pullip.cho@samsung.com

LPDDR5 has severan ranks and there are ranks switching delay.  Therefore, it
would be better to do accesses in same ranks if possible.  This patch sorts
freelist by the rank number so that near future allocation can be done in same
rank.


``[RFC-PROTOTYPE 1/1] mm: Add __GFP_FAST_TRY flag (Uladzislau Rezki)``
----------------------------------------------------------------------

https://lkml.kernel.org/r/20200803163029.1997-1-urezki@gmail.com

This is the rfc of the patch for the Paul's last ask.  The memory objects to be
freed by RCU are stored in the per-cpu array.  When the array is full, RCU
allocates new block of array and link it after the current one.  This strategy
is taken over the RCU head linked list to improve locality and thus reduce the
cache misses.  The allocation should be made under atomic context.  However,
the memory allocator makes lockdep compain if ``CONFIG_PROVE_RAW_LOCK_NESTING``
is on.  Also, it doesn't allow atomic context memory allocation if
``CONFIG_PREEMPT_RT`` is on, as it converts ``spinlock_t`` into sleepable
variant.

To overcome the problem, this patch introduces ``__GFP_FAST_TRY`` flag so that
the memory allocator can work in the case.


[PATCH v11 0/6] KASAN-KUnit Integration (David Gow)
---------------------------------------------------

https://lkml.kernel.org/r/20200805042938.2961494-1-davidgow@google.com

This patchset makes KUnit to be able to fail tests wen unexpected KASAN error
occurs and vice versa.


[PATCH v3 0/6] mm / virtio-mem: support ZONE_MOVABLE (David Hildenbrand)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20200804072408.5481-1-david@redhat.com

While virtio-mem allows to online fully plugged memory blocks to
``ZONE_MOVABLE``, it dows not allow to online partially-plugged memory blocks
to ``ZONE_MOVABLE``.  This commit makes it available.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20200806231643.a2711a608dd0f18bff2caf2b@linux-foundation.org

Andrew sent a pull request containing 163 patches to Torvalds.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20200811182949.e12ae9a472e3b5e27e16ad6c@linux-foundation.org

Another pull request from Andrew to Torvalds.  This pull request contains
"workingset protection/detection on the anonymous LRU list", and "proactive
compaction", which also reviewed by this post series.


[patch 18/39] mm/madvise: check fatal signal pending of target process (Andrew Morton)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200815003102.dzZiwVm-K%akpm@linux-foundation.org

The ``madvise_process()`` series has included in the pull request from Andrew
to Linus.  It was rejected from v5.8 due to its weird patch sequence regarding
its pidfd support.  Unfortunately, Torvalds don't like the signal handling of
the patch at this time.


Linux 5.9-rc1 (Linus Torvalds)
------------------------------

``https://lkml.kernel.org/r/CAHk-=wiwfkKp93C+yLqKWAU0ChBdeBDUhgOk09_=UQ8gOKbV3w@mail.gmail.com``

The merge window for v5.9 has finished, and the first rc released.  It was much
normal than v5.8.  The most interesting changes in my viewpoint are the
anonymous pages workingset detection/protection and the proactive compaction.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc2..v5.9-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-07-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc1-only.png)
