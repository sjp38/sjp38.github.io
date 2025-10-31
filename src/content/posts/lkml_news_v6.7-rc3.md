---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-11-21T06:33:44-08:00
lastmod: 2023-11-21T06:33:44-08:00
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

[PATCH v6 0/4] page_owner: print stacks and their counter (Oscar Salvador)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20231120084300.4368-1-osalvador@suse.de

This patchset introduces a new read-only file `page_owner_stacks`.  This can be
useful for getting the relationship between stacks and allocation/free without
fiddling with pages.


[PATCH v3 0/8] riscv: ASID-related and UP-related TLB flush enhancements (Samuel Holland)
-----------------------------------------------------------------------------------------

https://lkml.kerenl.org/r/20231122010815.3545294-1-samuel.holland@sifive.com

A patchset for improving some TLB flush inefficiencies in risc-v.


[RFC] mm: Multi-gen LRU: fix use of mm/page_idle/bitmap (Henry Huang)
---------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1700719508.git.henry.hj@antgroup.com

Page Idle Tracking is unabled to be used when MGLRU is enabled.  This RFC patch
fixes it.


[PATCH v3 0/3] samples: introduce cgroup events listeners (Dmitry Rokosov)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20231123071945.25811-1-ddrokosov@salutedevices.com

This patchset adds a new memcg events linstener that can be effecive at
monitoring memory events and managing counter changes in runtime.


Linux 6.7-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj1q-Ek=VTzcKT42q8QJqYfmEzDvu-wpCc_oSERq+naWg@mail.gmail.com

The third release candidate for v6.7 has released.  It has a couple of big
Realtek phy code reverts and some more changes, but mostly fairly small,
according to Linus.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.16-rc4..v6.7-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-11-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.7-rc3-only.png)
