---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-05-17T07:09:37-07:00
lastmod: 2022-05-17T07:09:37-07:00
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

[RFC] Add swappiness argument to memory.reclaim (Yosry Ahmed)
-------------------------------------------------------------

https://lkml.kernel.org/r/CAJD7tkbDpyoODveCsnaqBBMZEkDvshXJmNdbk51yKSNgD7aGdg@mail.gmail.com

Yosry is proposing to add swappiness argument to `memory.reclaim` cgroup file
to provide a way to enforce user policy on a stateless per-reclaim basis.


[PATCH v11 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------

https://lkml.kernel.org/r/20220518014632.922072-1-yuzhao@google.com

The eleventh version of the patchset for MGLRU has posted.  Maybe this has
revised based on the comments from LSFMM.


[PATCH] memcg: provide reclaim stats via 'memory.reclaim' (Vaibhav Jain)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220518223815.809858-1-vaibhav@linux.ibm.com

This patch extends the `memory.reclaim`, the memcg's proactive reclaim knob, to
provide the statistics of the reclaimation.


Linux 5.18 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wjiqyoH6qntYvYTjR1F2L-pHtgX9esZMRS13iktCOJ1zA@mail.gmail.com

There was no surprise in last week, so the v5.18 has released as scheduled.
This also means the merge window for v5.19 has opened.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6..v5.17.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-05-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
