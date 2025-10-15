---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-08-18T07:15:40+02:00
lastmod: 2020-08-18T07:15:40+02:00
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

PROBLEM: Long Workqueue delays. (Jim Baxter)
--------------------------------------------

https://lkml.kernel.org/r/71aafe68-7fe0-6b77-ea8e-83edd3f16c8d@mentor.com

Jim Baxter encountered 6.5 seconds delay due to long workqueue delay.  He want
to ask if this is normal or real problem.


[RFC PATCH 0/8] memcg: Enable fine-grained per process memory control (Waiman Long)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200817140831.30260-1-longman@redhat.com

The memory cgroup v2 start reclamation if the amount of the memory of the
cgroup exceeds 'memory.high' and start OOM killing if if exceeds 'memory.max'.
Problem is, the OOM killer can kill any process.  This patchset makes the
target of the OOM killing can be selected by user.


[PATCH v5 0/2] Anonymous VMA naming patches (Sumit Semwal)
----------------------------------------------------------

https://lkml.kernel.org/r/20200819141650.7462-1-sumit.semwal@linaro.org

This patchset was originally sent by Colin Cross a long time ago but Sumit
Semwal reposting this as he realised that this patchset is needed for Android
to boot.


[PATCH RFC] mm: increase page waitqueue hash size (Nicholas Piggin)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20200819125349.558249-1-npiggin@gmail.com

Nicholas found the page waitqueue hash is a bit small on his 16 socket 1536
threads POWER9 system.  He increased the waitqueue hash size from 256 to 262144
and it made 182% performance improvement.


[PATCH 0/78] Transparent Huge Pages for XFS (Matthew Wilcox)
------------------------------------------------------------

https://lkml.kernel.org/r/20200821224522.GX17456@casper.infradead.org

Matthew's THP for file-backed pages now passes xfstests.  For this, he made 78
patches.  However, because no one really like to review 78 patches, he just
want to let people know this and a portion of the patches is already formatted
as 5 individual patchsets.  He hopes some of the patchsets to be merged in
v5.10.

Biggest change this patchset makes is variable-sized THPs.  He made this change
because filesystems would prefer a page size between `PAGE_SIZE` and
`PMD_SIZE`.  `PMD_SIZE` is the only one size for THP now.


Linux 5.9-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiy7qFBRVibt+kHoceCwsiPeMRZXDajq1oCsk+AUOU4cg@mail.gmail.com

The rc2 for 5.9 came out.  Nothing in particular.  Many fixes in file systems
because ext4 update came in late.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc2..v5.9-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-08-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc2-only.png)
