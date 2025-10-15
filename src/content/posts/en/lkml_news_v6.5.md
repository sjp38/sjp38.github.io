---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-08-22T03:44:10-07:00
lastmod: 2023-08-22T03:44:10-07:00
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

[PATCH] maple_tree: shrink struct maple_tree from 24 to 16 bytes on LP64 (Mateusz Guzik)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230821225145.2169848-1-mjguzik@gmail.com

This patchset moves `ma_root` field to be placed after `ma_flags` to plug a
padding hole of `struct mape_tree`, to reduce the size of the struct.


idea for scalable and almost waste-free percpu counter alloc (was: Re: [PATCH 0/2] execve scalability issues, part 1) (Mateusz Guzik)
-------------------------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAGudoHH-b5R+COHUtns92NTzSVeT1ECMHb22SEcH_108Pi0FTQ@mail.gmail.com

Mateusz is suggesting another idea for scalable and almost-waste-free percpu
counter alloc.


[PATCH RFC] delayacct: add memory reclaim delay in get_page_from_freelist (Wen Yu Li)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/SH0PR01MB058780B26AB21BEB8E76B6BBC11CA@SH0PR01MB0587.CHNPR01.prod.partner.outlook.cn

`get_page_from_reelist()` also does memory reclaim due to memory loads, but it
is not counted as the memory reclaim delay statistics for `__node_reclaim()`.
This patch makes it to be counted as such.


[PATCH] mm: page_alloc: remove stale CMA guard code (Johannes Weiner)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20230824153821.243148-1-hannes@cmpxchg.org

For historical reason, movable allocations could be disallowed from CAM.
However, commit 8e3560d963d2 made that's not really needed.  This commit
further remove the obsolete constraint.


[GIT PULL] hotfixes for 6.5 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20230825111108.898f1600c365d22f74e52c70@linux-foundation.org

Andrew sent a few more hotfixes for v6.5 to Linus Torvalds.


[PATCH] slub: Introduce CONFIG_SLUB_RCU_DEBUG (Jann Horn)
---------------------------------------------------------

https://lkml.kernel.org/r/20230825211426.3798691-1-jannh@google.com

This patch adds SLUB debugging feature for making KASAN available to catch
use-after-free in `SLAB_TYPESAFE_BY_RCU` slabs.


Linux 6.5 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wgmKhCrdrOCjp=5v9NO6C=PJ8ZTZcCXj09piHzsZ7qqmw@mail.gmail.com

After the seven release candidates, Linus Torvalds released v6.5 Linux kernel
without delay.  He still worries if it was calm just because many maintainers
are in their vacation, but he thinks it might be he being paranoid.  This also
means the merge window for v6.6 is open.


Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc1..v6.5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-08-27 | ~/lazybox/gnuplot/plot.py \
