---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-09-08T07:12:49+02:00
lastmod: 2020-09-08T07:12:49+02:00
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

[PATCH RFC 00/10] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200907134055.2878499-1-elver@google.com

This patchset introduces another kernel use-after-free detection
infrastructure, called Kernel Electric-Fence (KFENCE).  Unlike KASAN, this
trades the performance for precision and as a result it incurs near zero
performance overhead so that it can be enabled in the production.


[PATCH 00/11] Remove assumptions of THP size (Matthew Wilcox)
-------------------------------------------------------------

https://lkml.kernel.org/r/20200908195539.25896-1-willy@infradead.org

Matthew is working for variable sized THP.  For start of the work, this
patchset changes the assumption that THP will be PMD size by introducing
`thp_nr_pages()` and let the other VM code to use it.


[PATCH] memcg: introduce per-memcg reclaim interface (Shakeel Butt)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20200909215752.1725525-1-shakeelb@google.com

Sometimes the workload is mixed with latency sensitive ones and latency
tolerative ones.  The kernel does not have a way to distinguish those.  It's
rather well known to the users.  Therefore, this patchset allow the userspace
to trigger reclaim specific memory cgroup.


[PATCH v13 0/5] KASAN-KUnit Integration (David Gow)
---------------------------------------------------

https://lkml.kernel.org/r/20200910070331.3358048-1-davidgow@google.com

13th version of the KASAN-KUnit integration patchset.


Ways to deprecate /sys/devices/system/memory/memoryX/phys_device ? (David Hildenbrand)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/21852ccb-bd06-9281-7c8e-485ec02f2883@redhat.com

In this mail, David introduces how `phys_device` file has added in the kernel,
updated, and finally been not useful at all but only makes concern in backward
compatibility with some user space tools.  He asks what is the better
intermediate step towards the complete removal of the interface.  Just making
it return '0' always, or making it supported on the backward compatibility
concerning arch, s390x, only.


mm: fix memory to node bad links in sysfs (Laurent Dufour)
----------------------------------------------------------

https://lkml.kernel.org/r/20200911134831.53258-1-ldufour@linux.ibm.com

The firmware could expose memory layout that some region are interleaved in
multiple NUMA nodes.  Then, the memory blocks wrongly assigned to the multiple
nodes in sysfs.  This causes BUG_ON() when the block is hot-unplugged and the
hot-plugged again, due to the sysfs inconsistency detection.

This patchset fixes the problem.


Linux 5.9-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjLVdzdX09kS324Q=GoRn0uPCnr-sovqVCdJcUxVdkJCQ@mail.gmail.com

Torvalds sees the gray world due to the wildfires but he also sees the release
is quite normal.  Just as normal as usual rc5.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc5..v5.9-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-08-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc5-only.png)
