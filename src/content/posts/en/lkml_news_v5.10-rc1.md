---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-10-13T07:34:10+02:00
lastmod: 2020-10-13T07:34:10+02:00
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

[PATCH] mm: Make allocator take care of memoryless numa node (Xianting Tian)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20201012082739.15661-1-tian.xianting@h3c.com

CPUs in powerpc like architecture could have no local memory.  As the kernel
code doesn't care about it, this commit makes it to handle the case.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20201013164658.3bfd96cc224d8923e66a9f4e@linux-foundation.org

This is the pull request from Andrew Morton, the mm maintainer, for v5.10.


[PATCH v4 0/5] Speed up mremap on large regions (Kalesh Singh)
--------------------------------------------------------------

https://lkml.kernel.org/r/20201014005320.2233162-1-kaleshsingh@google.com)

Repost fo the patch series.  Change from v3 is only adding Kirill's Acked-by's.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20201015194043.84cda0c1d6ca2a6847f2384a@linux-foundation.org

Another pull request from Andrew Morton.  Changes for THP, which removes the
assumption on THP size seems interesting.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20201017161314.88890b87fae7446ccc13c902@linux-foundation.org

Yet another pull request from Andres Morton.  Minchan Kim's `process_madvise()`
patchset is in here.


Splitting a THP beyond EOF (Matthew Wilcox)
-------------------------------------------

https://lkml.kernel.org/r/20201020014357.GW20115@casper.infradead.org

Matthew shares a weird corner case that THP is used beyond the end of file and
his idea on the solution of this problem.


[PATCH] mm: don't wake kswapd prematurely when watermark boosting is disabled (Johannes Weiner)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201020175833.397286-1-hannes@cmpxchg.org

In case of multiple NUMA nodes systems, the watermark boosting related code
allow kswapd to wake up if one node's memory is full but other nodes have some
free memory.  This is for fragmentation handling, but this frequent kswapd work
makes some workloads slow.  This commit avoids such unnecessary kswapd wakeup.


[PATCH v4 0/1] Add tracepoints around mmap_lock acquisition (Axel Rasmussen)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20201020184746.300555-1-axelrasmussen@google.com

Fourth version of the patch adding tracepoints for `mmap_lock` acquisition.
This will help understanding and solving the mmap locking contention problem.


[PATCH 0/2] block layer filter and block device snapshot module (Sergei Shtepa)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/1603271049-20681-1-git-send-email-sergei.shtepa@veeam.com

This patchset introduce blk-filter, which allows to intercept BIO requests, and
blk-snap, which snapshots block device for backup.


Linux 5.10-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whcRFYSm0jj3Xh3xCyBaxCHA1ZMNO0h_gZso_WZFDUtiQ@mail.gmail.com

Two weeks of the merge window passed, and the 5.10-rc1 has released as a
result.  Torvalds says this is bigger than he expected.  This could be a
general upward trend, just a fluke, or due to delayed 5.9 release, Torvalds
says.  He also picks up the `set_fs()` removal change from Christoph as most
interesting change in this release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc2..v5.10-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-10-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc1-only.png)
