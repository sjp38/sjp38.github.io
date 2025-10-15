---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-10-06T07:12:49+02:00
lastmod: 2020-10-06T07:12:49+02:00
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

[PATCH RFC v2] Opportunistic memory reclaim (Andrea Righi)
----------------------------------------------------------

https://lkml.kernel.org/r/20201005081313.732745-1-andrea.righi@canonical.com

This patch introduces new file under memcg, 'memory.swap.reclaim' that allow
users to incur Reclaim even before the memory pressure happens, to help
reducing system memory footprint and speed up hibernation/VM migration time,
etc.


[PATCH v2 0/2] Add tracepoints around mmap_lock acquisition (Axel Rasmussen)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20201007184403.1902111-1-axelrasmussen@google.com

This patchset adds tracepoints for ``mmap_lock`` to use that for analysis of
the contention.


[RFC][PATCH 0/9] [v4][RESEND] Migrate Pages in lieu of discard (Dave Hansen)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20201007161736.ACC6E387@viggo.jf.intel.com

This commit makes the tiered-memory operation to do migration instead of
reclamation.


Linux 5.9 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wi-u86++np80GQvgDuARdt9xpBNho6SjHLmYgm8jibGag@mail.gmail.com

As expected, Linux v5.9 released.  Torvalds says the changes in last week was a
little bit more that he hoped, but there was no scary change.  So, the merge
window for v5.10 has open!

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19..v5.9.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-10-12 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
