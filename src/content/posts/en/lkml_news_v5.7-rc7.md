---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.7-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-05-20T05:52:27+02:00
lastmod: 2020-05-20T05:52:27+02:00
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

[PATCH v5] mm: Proactive compaction (Nitin Gupta)
-------------------------------------------------

https://lkml.kernel.org/r/20200518181446.25759-1-nigupta@nvidia.com

The 5th version of the proactive compaction.  This patchset make the compaction
more proactive to make THP allocation easily success.


[PATCH -V2] swap: Reduce lock contention on swap cache from swap slots allocation (Huang Ying)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200520031502.175659-1-ying.huang@intel.com

After swap device is fragmented, there's no free swap cluster.  Therefore, each
swap logic of each CPU will linearly scan each swap cluster to find a free
slot.  As multiple CPUs can search the slot in same cluster, the swap cache
lock contention could increase.

This patchset reduces the lock contention by using percpu pointer for next
scanning cluster.  The pointer is set to random cluster.  This change is
applied to SSD swap device only.


[Ksummit-discuss] [TECH TOPIC] seccomp feature development (Kees Cook)
----------------------------------------------------------------------

https://lkml.kernel.org/r/202005200917.71E6A5B20@keescook

The first kernel summit technical topic.  Kees Cook want to talk about seccomp.


Linux 5.7-rc7
-------------

https://lkml.kernel.org/r/CAHk-=whan1CiRtcgBt-5SkW-ga_GeLH5+AO26RmK7vOA5yw9ng@mail.gmail.com

The rc6 was unexpectedly big, but rc7 is quite normal.  Torvalds says the
release schedule will not dealyed, unless something happens.

Also, Torvalds says he upgraded his main machine for the first time in about 15
years, from Intel machine to the AMD Threadripper 3970x.  His build is not 3
times faster!
