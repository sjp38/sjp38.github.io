---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-11-22T07:35:46-08:00
lastmod: 2022-11-22T07:35:46-08:00
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

[PATCH 00/12] Introduce CONFIG_SLUB_TINY and deprecate SLOB (Vlastimil Babka)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20221121171202.22080-1-vbabka@suse.cz

Vlastimil has posted a mail[1] for a discussion about SLOB deprecation.  As no
one has objected at the idea so far, Vlastimil has sent a patchset for that.

[1] https://lore.kernel.org/all/b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz/


[RFC PATCH v1 0/4] Introduce merge identical pages mechanism (Alexey Romanov)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20221121190020.66548-1-avromanov@sberdevices.ru

This RFC patchset introduces a mechanism for merging identical compressed
pages, which could be common in zram like use cases.


[PATCH v2 -next 1/2] mm/slb: add is_kmalloc_cache() helper function (Feng Tang)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221123123159.2325763-1-feng.tang@intel.com

There is a bit specifying whether a kmem_cache is a kmalloc cache or not.  This
commit adds a helper function for checking the bit to let other components like
kasan to have simplified code.


Low TCP throughput due to vmpressure with swap enabled (Ivan Babrou)
--------------------------------------------------------------------

https://lkml.kernel.org/r/CABWYdi0G7cyNFbndM-ELTDAR3x4Ngm0AehEp5aP0tfNkXUE+Uw@mail.gmail.com

This report says a commit controlling vmpressure behavior has regressed
throughput of TCP.


[RFC PATCH V1] mm: Disable demotion from proactive reclaim (Mina Almasry)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20221122203850.2765015-1-almasrymina@google.com

`memory.reclaim` memcg file does both demotion and reclaim.  This is not ok for
applications of tiers in the middle class which demotion is ok but reclaim is
too much.  This patch proposes to have reclaim-only and demotion-only
mechanism.


Linux 6.1-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgUZwX8Sbb8Zvm7FxWVfX6CGuE7x+E16VKoqL7Ok9vv7g@mail.gmail.com

Unfortunately, last week was not that quiet.  Linus says this would mean he
will have another extra rc week for 6.1.  Because that means the next merge
window for 6.2 will be during the holiday season, he also asks people to aware
the rule, everything for merge window should be ready _before_ the merge window
opens.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc7..v6.1-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-11-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc5 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.1-rc7-only.png)
