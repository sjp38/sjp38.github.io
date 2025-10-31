---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-04-27T07:01:06+02:00
lastmod: 2021-04-27T07:01:06+02:00
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

[PATCH v3] mm/compaction:let proactive compaction order configurable (chukaiping)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/1619313662-30356-1-git-send-email-chukaiping@baidu.com

Third version of the patchset making compaction order lower than 9.  Machines
using 1GB hugetlbfs huge pages could be an example user of this feature.


[PATCH v4] mm/compaction: let proactive compaction order configurable (chukaiping)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/1619576901-9531-1-git-send-email-chukaiping@baidu.com

Fourth version of the patchset posted quite quickly.


[PATCH 00/94] Introducing the Maple Tree (Liam Howlett)
-------------------------------------------------------

https://lkml.kernel.org/r/20210428153542.2814175-1-Liam.Howlett@Oracle.com

This huge patchset introduces an RCU-safe range based B-tree called maple tree.
It is mainly designed to be used for scalable virtual memory areas management.


[PATCH v3] mm: improve mprotect(R|W) efficiency on pages referenced once (Peter Collingbourne)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210429214801.2583336-1-pcc@google.com

After removing write protection of a page using `mprotect()`, any writes to the
page result in page faults and copy-on-write, even though the page is
referenced by only a single PTE, which incur some performance overhead.  This
patch optimizes this problem.


inocming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210429225251.02b6386d21b69255b4f6c163@linux-foundation.org

The pull request from Andrew Morton for v5.13.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210504183219.a3cc46aee4013d77402276c5@linux-foundation.org

The remainder of the main mm/ queue for v5.13.  This includes below patchsets.

- Make `alloc_contirg_range` handle Hugetlb pages
- Prohibit pinning pages in `ZONE_MOVABLE`


[PATCH v9 00/96] Memory folios (Matthew Wilcox)
-----------------------------------------------

https://lkml.kernel.org/r/20210505150628.111735-1-willy@infradead.org

This patchset once called page folios, but now renamed into memory folios.
This helps managing non-4KiB pages cleanly and efficiently.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210506180126.03e1baee7ca52bedb6cc6003@linux-foundation.org

Pull request for every remaining paches in -mm tree.


Linux 5.13-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiWTU+=wK9pv_YG01rXSqApCS_oY+78Ztz5-ORH5a-kvg@mail.gmail.com

After the two weeks of merge window, first rc1 for v5.13 released.  Fairly big
merge window compared to last one.  Most changes are spread over all
subsystems, though some subsystems show big, but not so important changes that
makes the picture overshadowed.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc2..v5.13-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc1-only.png)
