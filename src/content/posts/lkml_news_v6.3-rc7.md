---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-04-11T07:41:47-07:00
lastmod: 2023-04-11T07:41:47-07:00
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

[PATCH v5] mm: oom: introduce cpuset oom (Gang Li)
--------------------------------------------------

https://lkml.kernel.org/r/20230411134539.45046-1-ligang.bdlg@bytedance.com

This patch makes oomkiller to aware of numa nodes of processes that assigned
via cpuset so that real memory pressure tirggeered process can be picked as
victim of the pressure.


[LSF/MM/BPF TOPIC] Reducing zombie memcgs (T.J. Mercier)
--------------------------------------------------------

`https://lkml.kernel.org/r/CABdmKX2M6koq4Q0Cmp_-=wbP0Qa190HdEGGaHfxNS05gAkUtPA@mail.gmail.com`

Memcg lives in the kernel until the reference count drops to zero, even if it's
removed by userspace.  This zombie-like memcg consumes system resource and
makes kernel operations that get affected by the total number of memcg less
efficient.  This new topic suggestion is for discussion on a out-of-tree
solution for this problem.


[LSF/MM/BPF TOPIC] Sunsetting buffer_heads (Hannes Reinecke)
------------------------------------------------------------

https://lkml.kernel.org/r/6ca617db-5370-7f06-8b4e-c9e10f2fa567@suse.de

An LSF/MM/BPF proposal for phasing out `buffer_head`, which makes people bogged
down due to its complicated links into filesystems and mm.


[RFC v2 PATCH 00/17] variable-order, large folios for anonymous memory (Ryan Roberts)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230414130303.2345383-1-ryan.roberts@arm.com

Second RFC for implementing variable order large folios for anonyous memory has
posted.


Linux 6.3-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjwK59PegTZb9r=EVuCPwbigcbbby5AwEboMBgykhL-KA@mail.gmail.com

The seventh release candidate, which is the usually the last candidate of the
release, has released.  No special things though cgroup cpuset fix, which
merged in last week was somewhat Torvalds didn't like at that point.  It's
still not a releae blocker, though.  If things doesn't go very bad this week,
we will get the Linux v6.3 this sunday, as expected.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12..v6.3-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.3-rc7-only.png)
