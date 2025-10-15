---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-08-02T17:40:09-07:00
lastmod: 2022-08-02T17:40:09-07:00
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

[PATCH] mm: vmscan: fix extreme overreclaim and swap floods (Johannes Weiner)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20220802162811.39216-1-hannes@cmpxchg.org

Johannes found proactive reclamation using `memory.reclaim` sometimes reclaim
more pages than requested on specific cgroup use cases.  This patch resolves
the issue so that the proactive reclamation doesn't over-reclaim pages.


[RFC PATCH 0/4] propose a auto-run mode for ksm (Xu Xin)
--------------------------------------------------------

https://lkml.kernel.org/r/20220803100306.1653382-1-xu.xin16@zte.con.cn

KSM operation management is quite manual and sometimes inefficient if not well
managed.  This patchset introduces auto-run mode that can operate KSM in a
better way.


[GIT PULL] MM updates for 5.20-rc1 (Andrew Morton)
--------------------------------------------------

https://lkml.kernel.org/r/20220803133541.18b82ec9344ed0e8b975fe5b@linux-foundation.org

Pullrequest from Andrew Morton to Linus Torvlads for the mm queue has posted.
It contains almost all of the mm changes.  Andrew notes that the hope was to
merge Liam's maple tree first, stabilize it, then merge MGLRU.  However, maple
tree didn't make it and therefore not included in this pull request. 

So current plan is to merge MGLRU into -mm soon and then mapletree.  The hope
now is to merge them in the mainline by 5.21-rc1 (Or, 6.1-rc1?).


[PATCH v2 0/2] mm: Remember a/d bits for migration entries (Peter Xu)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20220804203952.53665-1-peterx@redhat.com

We set a page as old and clean when migrating it.  As a result, the access
information is lost.  This patch makes the information to be preserved.


[PATCH v3] mm: add thp_utilization metrics to /proc/thp_utilization (Alexander Zhu)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220805184016.2926168-1-alexlzhu@fb.com

This patch adds a tool that scans all physical memory for anonymous THP and
reports the real utilization of the THPs for knowing how well THP is used.


[PATCH v2 0/5] mm/memfd: MFD_NOEXEC for memfd_create (Jeff Xu)
--------------------------------------------------------------

https://lkml.kernel.org/r/20220805222126.142525-1-jeffxu@google.com

memfd file's default permission includes execute permission.  As it is
undesirable on systems that all filesystems are intedned to be mounted without
exec permission, this patchset implements a new flag for `memfd_create()`
called `MFD_NOEXEC`.


[PATCH v13 0/9] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220808062601.836025-1-aneesh.kumar@linux.ibm.com

Thirteenth version of the patchset for making memory tier explicit for better
demotion of pages.


[PATCH v2] mm: add thp_utilization metrics to debugfs (Alexander Zhu)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20220809014950.3616464-1-alexlzhu@fb.com

Second version of the patchset for adding THP utilization information.  It
moves the metric from `procfs` to `debugfs` in this version.


[PATCH v2 00/16] Allocate and free frozen pages (Matthew Wilcox)
----------------------------------------------------------------

https://lkml.kernel.org/r/20220809171854.3725722-1-willy@infradead.org

This patchset adds APIs to allocate and free pages which are in a frozen state.
This is a step towards the future which `struct page` doesn't have a refcount.


[RFC PATCH] Introduce sysfs interface to disable kfence for selected slabs. (Imran Khan)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220811072551.2506005-1-imran.f.khan@oracle.com

As we have kfence interest in only specific slab objects like `dentry` or
`ext4_*`, this patch introduces a sysfs interface for disabling kfence for
specific slabs.


State of the Page (August 2022) (Matthew Wilcox)
------------------------------------------------

https://lkml.kernel.org/r/YvV1KTyzZ+Jrtj9x@casper.infradead.org

As `struct page` size is 64 bytes, the array of `struct page` objects, called
`memmap`, commonly consumes about 1.6% of memory.  Matthew tries to size it
down to 8 byte so that the overhead could be down to 0.2%, which could be
acceptable.  In this mail, he shares the state of the progress.


[PATCH v14 00/10] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220812055710.357820-1-aneesh.kumar@linux.ibm.com

Fourteenth version of the patchset for improving memory tiers construction and
demotion has posted.


[PATCH v2 0/5] propose auto-run mode of ksm and its tests (Xu Xin)
------------------------------------------------------------------

https://lkml.kernel.org/r/20220812101102.41422-1-xu.xin16@zte.com.cn

Second version of the patchset for adding auto-run mode of ksm has posted.


Linux 6.0-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgRFjPHV-Y_eKP9wQMLFDgG+dEUHiv5wC17OQHsG5z7BA@mail.gmail.com

After the two weeks of the merge window, about 13.5k non-merge, 800+ merge
commits have merged in the mainline tree and 6.0-rc1 has released.  Linus
emphasizes the increment of the major version number nothing but the minor
version number has been too large to remember.  He also notes that he wanted
Rust infrastructure and multi-gen LRU to be merged in this release but those
didn't make it.  He estimates Linux 6.0 would be released in early October, and
asks people to help testing for that.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc2..v6.0-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-08-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.0-rc1-only.png)
