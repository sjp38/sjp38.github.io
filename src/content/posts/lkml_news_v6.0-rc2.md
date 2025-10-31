---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-08-16T06:51:04-07:00
lastmod: 2022-08-16T06:51:04-07:00
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

[PATCH v14 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------

https://lkml.kernel.org/r/20220815071332.627393-1-yuzhao@google.com

Fourteenth version of MGLRU patch has rebased on the latest mm-unstable and
posted again.  This may be merged in the mm tree.


`folio_map` (Matthew Wilcox)
----------------------------

https://lkml.kernel.org/r/YvvdFrtiW33UOkGr@casper.infradead.org

Matthew explains his proposal on `folio_map` in detail and asks if others have
better ideas.


[PATCH v3] mm: add thp_utilization metrics to debugfs (Alexander Zhu)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20220818000112.2722201-1-alexlzhu@fb.com

This patch adds debugfs file for tracking how THP is utilized well.


[PATCH v15 00/10] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220818131042.113280-1-aneesh.kumar@linux.ibm.com

Fifteenth version of the patchset for improving memory tier construction and
demotion has posted.


Linux 6.0-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj_XDfMiVXuo6A98KF4MsXxtyuMP_OtOGw87xnKERcfAg@mail.gmail.com

The second rc release is out.  It's small as other rc2 releases also usually
are, but contains a fix for a virtio issue, which found during the merge window
and disrupted some automated tests.  Of course it contains fixes for more
subsystems.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc3..v6.0-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-08-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.0-rc2-only.png)
