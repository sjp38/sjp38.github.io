---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-03-01T07:11:16+01:00
lastmod: 2022-03-01T07:11:16+01:00
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

[PATCH/RESEND] mm: add ztree - new allocator for use via zpool API (Ananda)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220228110546.151513-1-a.badmaev@clicknet.pro

Ztree is another zpool backend that superior with regard to the worst execution
time.

mmotm 2022-02-28-14-45 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220228224600.44415C340EE@smtp.kernel.org

mmotm has updated.  It's rebased on 5.17-rc6, added 56 new patches, modified 85
patches, and dropped 55 patches.  In total, 378 patches are in the queue.


[PATCH -V14 0/3] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220301085329.3210428-1-ying.huang@intel.com

The 14th version of the AutoNUMA improvement patch for tiered memory system has
posted.


[LSF/MM/BPF TOPIC] Potential silent data loss caused by hwpoisoned page cache (Yang Shi)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAHbLzkp0PomtRoSmdv=waWTHtVUPZvTBGt1v7ynirGyw4iPFQw@mail.gmail.com

Yang Shi introduces the potential silent data loss due to the page cache THP
split patch and how to solve the issue.  He is preparing patches and suggests
to discuss in LSF/MM/BPF of this week.


mmotm 2022-03-02-16-53 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220303005351.D6F91C004E1@smtp.kernel.org

The mmotm tree has updated.  It's based on 5.17-rc6, added 44 patches, modified
64 patches, and dropped no patch.  In total, 418 patches in the queue.


[PATCH] mm: madvise: MADV_DONTNEED_LOCKED (Johannes Weiner)
-----------------------------------------------------------

https://lkml.kernel.org/r/20220303212956.229409-1-hannes@cmpxchg.org

Because `MADV_DONTNEED` doesn't work for `mlock()`-ed ranges, and working it
around by explicitly calling `munlock()` before `madvise()` needs unnecessary
syscalls and vma locks, this patch adds another `madvise()` flag for the case.


[LSF/MM/BPF TOPIC] Changes in RCU over the past few years (Paul E. McKenney)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20220304035116.GA8858@paulmck-ThinkPad-P17-Gen-1

Paul E. McKenney is proposing to have a time for quickly introducing the RCU
changes that made in past few years and discuss about its usage and possible
future changes in LSF/MM/BPF of this year.


mmotm 2022-03-03-21-24 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220304052444.C157EC340E9@smtp.kernel.org

Andrew Morton updated -mm tree.  It's based on v5.17-rc6, added 11 new patches,
modified 9 patches, and dropped 6 patches.  In total, 428 patches in the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220304202822.d47f8084928321c83070d7d7@linux-foundation.org

Andrew sent 8 fixes to Linus Torvalds.


[RFC] Mechanism to induce memory reclaim (David Rientjes)
---------------------------------------------------------

https://lkml.kernel.org/r/5df21376-7dd1-bf81-8414-32a73cea45dd@google.com

David Rientjes is proposing a memcg based memory reclaim induce mechanism,
which could be used for various underlying reclaim mechanism, for proactive
reclamation.


Linux 5.17-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjkkYX8OvTv60+XvQkAK4Pg0QC0Hn-4+n7Q0t1+QWw7Sw@mail.gmail.com

The release candidate that assumed to be the last one before Linux v5.17 is
out.  Everything looks normal, so v5.17 would be released in the next week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc6..v5.17-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-03-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc7-only.png)
