---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-12-02T07:16:10+01:00
lastmod: 2020-12-02T07:16:10+01:00
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

[PATCH] mm: mmap_lock: fix use-after-free race and css ref leak in tracepoints (Axel Rasmussen)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201130233504.3725241-1-axelrasmussen@google.com

This patch fixes a use-after-free bug that reported by syzbot.


[PATCH 0/6] prohibit pinning pages in ZONE_MOVABLE (Pavel Tatashin)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20201202052330.474592-1-pasha.tatashin@soleen.com

Pinned pages in `ZONE_MOVABLE` is a wellknown problem.  This patchset fixes the
issue by forcing pinning new page to allocated from a zone other than
ZONE_MOVABLE and migrating out existing pages from the zone during pinning.


[LSFMMBPF 2021] A status update (Josef Bacik)
---------------------------------------------

https://lkml.kernel.org/r/fd5264ac-c84d-e1d4-01e2-62b9c05af892@toxicpanda.com

The plan is not fixed yet, but they are trying to do LSFMMBPF 2021 as an
in-person conference in second half of 2021.  More detail will be shared again.
Hope the pandemic to be finished soon so that we can redo the in-person
conference.


Linux 5.10-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgtCzNv7ghB=1VK1fYe82GwiS8xdaXTDqcVzQKn4QfrXw@mail.gmail.com

The rc7 is quite normal.  Linus seems convincing.  v5.10 will be released next
week, unless something weird happens!

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc7..v5.10-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-12-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc7-only.png)
