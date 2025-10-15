---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-03-15T07:02:08+01:00
lastmod: 2022-03-15T07:02:08+01:00
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

mmotm 2022-03-14-22-42 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220315054352.5B187C340E8@smtp.kernel.org

The -mm tree is updated.  It is rebased on 5.17-rc8, added 20 new patches,
modified 10 patches, and dropped 2 patches.  In total, 475 patches in the
queue.


[LSF/MM TOPIC] Better handling of negative dentries (Mattew Wilcox)
-------------------------------------------------------------------

https://lkml.kernel.org/r/YjDvRPuxPN0GsxLB@casper.infradead.org

There could be millions of negative dentries on a system having large memory
and no memory pressure, because the number of negative dentries is constrained
only by memory size.  Because this could results in slow inotify, high memory
usage, and poor lookup performance, Matthew is proposing to discuss about a
solution in the LSF/MM of this year.


mmotm 2022-03-16-17-42 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220317004304.95F89C340E9@smtp.kernel.org

-mm tree has updated.  It's based on 5.17-rc8, added 10 new patches, modified 3
patches, and dropped 4 patches.  In toal, 481 patches in the queue.


[PATCH v2] mm: add access/dirty bit on numa page fault (Bibo Mao)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20220317065033.2635123-1-maobibo@loongson.cn

This patch adds dirty or access bit for platforms that doesn't support hardware
page table walks.


Linux 5.17 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wj4fFjx2pgbGNBM4wJs3=eReZ05EQyprzgT2Jv8qJ2vJg@mail.gmail.com

The extended one week for 5.17 was very calm, so the Linux v5.17 is out.  This
also means the merge window for v5.18 is open.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6..v5.17.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-03-21 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
