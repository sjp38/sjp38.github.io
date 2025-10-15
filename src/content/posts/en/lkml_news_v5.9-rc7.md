---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-09-22T07:07:32+02:00
lastmod: 2020-09-22T07:07:32+02:00
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

[PATCH v3 00/10] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200921132611.1700350-1-elver@google.com

The third version of KFENCE patchset is uploaded.


Machine lockups on extreme memory pressure (Shakeel Butt)
---------------------------------------------------------

https://lkml.kernel.org/r/CALvZod4FWLsV9byrKQojeus7tMDhHjQHFF5J_JpNsyB0HkaERA@mail.gmail.com

Shakeel reports a machine lockup due to extreme memory pressure.  It's locked
up on memcg's vmpressure `sr_lock`, which is irq-unsafe.  And the lockup made
in IRQ.  He proposes a solution simply changing the lock with irq-safe one, but
he also admits it's not a maintainable solution.  Therefore, he asks if others
has similar problems and if so, what was the solution.


[PATCH v6 0/6] mm: introduce memfd_secret system call to create "secret" memory areas (Mike Rapoport)
-----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200924132904.1391-1-rppt@kernel.org

Sixth version of the `memfd_secret` patchset.  It aims to provide "secret"
mappings, mostly for the guests.


Linux 5.9-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj1SJmva5pQxT-XZkMREOa+iJuy0K8-zua0K=vF-Jz7zw@mail.gmail.com

All of the v5.9 gating issues including the VM bugs are finally fixed.
However, because the fixes came in fairly late, Torvalds says he would release
rc8 next week, instead of the v5.9.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc7..v5.9-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-09-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc7-only.png)
