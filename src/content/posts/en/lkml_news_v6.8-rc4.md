---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-02-06T06:34:11-08:00
lastmod: 2024-02-06T06:34:11-08:00
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

[PATCH] mm/cma: Add sysfs file 'release_pages_success' (Anshuman Khandual)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20240206045731.472759-1-anshuman.khandual@arm.com

This patch adds a new sysfs file for tracking the number of successfully
released pages from a given CMA heap area.  It aims to be hulpful at
determining available active CMA pages.


[PATCH v2] mm/demotion: print demotion targets (Li Zhijian)
-----------------------------------------------------------

https://lkml.kernel.org/r/20240206020151.605516-1-lizhijian@fujitsu.com

Li Zhijian sent a patch for printing demotion target information in case of
fallback for unmet requirements on the target node, directly to the kernel log.


[RFC 00/18] Pkernfs: Support persistence for live update (James Gowans)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20240205120203.60312-1-jgowans@amazon.com

James sent an RFC for a subsystem called `pkenfs`, which aims to help live
update of hypervisors.


[PATCH] mm/migrate: preserve exact soft-dirty state (Paul Gofman)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20240206084838.34560-1-usama.anjum@collabora.com

Migrating/compacting pages makes those pages dirty even if those were not dirty
before the migration.  This patchset makes the dirty bits preserved to avoid
the problem.


[PATCH] MAINTAINERS: update mm and memcg entries (Mike Rapoport)
----------------------------------------------------------------

https://lkml.kernel.org/r/20240208055727.142387-1-rppt@kernel.org

Mike posted a patch to add header files for memcg and mm on MAINTAINERS file.


[PATCH] mm/hugetlb: Ensure adequate CMA areas available for hugetlb_cma[] (Anshuman Khandual)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240209065036.1412670-1-anshuman.khandual@arm.com

Anshuman adds warning for a case that `MAX_CMA_AREAS` is smaller than
`MAX_NUMNODES`, which is the size for HugeTLB CMA area array.


[LSF/MM/BPF TOPIC] tracing the source of errors (Miklos Szeredi)
----------------------------------------------------------------

https://lkml.kernel.org/r/CAJfpegtw0-88qLjy0QDLyYFZEM7PJCG3R-mBMa9s8TNSVZmJTA@mail.gmail.com

Yet another LSFMM topic for letting tracking error number returned code.  Some
other existing solutions that can cover many such cases are also being
discussed.


Linux 6.8-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wg1c4Q1Ve6BG71DikHu-AEoKUUQoj1QbVdjwGQyTExqCw@mail.gmail.com

Linus Torvalds released the fourth release candidate of Linux v6.8.  He says
though there were NTFS3 fix dumps, the overall stat looks normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-02-12 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc4-only.png)
