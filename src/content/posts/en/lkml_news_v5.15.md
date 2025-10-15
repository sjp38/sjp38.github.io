---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-10-27T07:09:11+02:00
lastmod: 2021-10-27T07:09:11+02:00
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

Dynamically allocated memory descriptors (Matthew Wilcox)
---------------------------------------------------------

https://lkml.kernel.org/r/YXcLqcFhDq3uUwIj@casper.infradead.org

In this mail, Matthew explains his idea on making `struct page` only two words
and how it could work with buddy allocator freelists.


[RFC] mm: Disable NUMA_BALANCING_DEFAULT_ENABLED and TRANSPARENT_HUGEPAGE on PREEMPT_RT (Sebastian Andrzej Siewior)
-------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211026165100.ahz5bkx44lrrw5pt@linutronix.de

Mel told RT patchset could incur spikes on NUMA machines when `NUMA_BALANCING`
and THP are turned on.  Sebastian request comments on disabling those on RT
enabled kernel by default, but still trying to find a good test for that.


mmotm 2021-10-27-18-32 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211028013301.pr6m56GoH%akpm@linux-foundation.org

The -mm of the moment tree is updated.  This update adds 69 patches, modify 68
patches, drops no patch.  435 patches in total in the -mm tree.


[PATCH] mm: Disable NUMA_BALANCING_DEFAULT_ENABLED and TRANSPARENT_HUGEPAGE on PREEMPT_RT (Sebastian Andrzej)
-------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211028143327.hfbxjze7palrpfgp@linutronix.de

After getting some feedback, this patch removed RFC tag.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211028143506.5f5d5e2cd1f768a1da864844@linux-foundation.org

11 patches for fixes of v5.15 are posted from Andrew to Linus.


[GIT PULL] Memory folios for v5.16 (Matthew Wilcox)
---------------------------------------------------

https://lkml.kernel.org/r/YX4RkYNNZtO9WL0L@casper.infradead.org

Matthew is sending the memory folios pull request again, for v5.16.  I
personally curious what feedback will come for this time.

This pull request merged in the mainline for v5.16.


Linux 5.15 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wjfbfQobW2jygMvgfJXKmzZNB=UTzBrFs2vTEzVpBXA4Q@mail.gmail.com

The 5.15 of Linux has released in the normal 9 weeks cycle, with DAMON.  It
started with pains due to the `-Werror`, but the pace has been normal soon.
This also means the merge window for 5.16 is open.  DAMON following patches for
DAMOS and DAMON-based proactive reclamation are in -next tree.  Let's see if
those will be merged in this merge window.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc7..v5.15.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
