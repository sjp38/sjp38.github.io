---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-06-16T07:14:05+02:00
lastmod: 2020-06-16T07:14:05+02:00
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

[PATCH v7] mm: Proactive compaction (Nitin Gupta)
-------------------------------------------------

https://lkml.kernel.org/r/20200615143614.15267-1-nigupta@nvidia.com

7th version of the proactive compaction patchset.  This version fixes compile
error while THP is disabled.


Maintainers / Kernel Summit 2020 submissions (Theodore Y. Ts'o)
---------------------------------------------------------------

https://lkml.kernel.org/r/20200615155839.GF2863913@mit.edu

There were only 5 submissions for the kernel summit talk, and no submission for
the maintainers summit.  Ted asks people to submit until this week.


[PATCH v6 0/6] workingset protection/detection on the anonymous LRU list
------------------------------------------------------------------------

https://lkml.kernel.org/r/1592371583-30672-1-git-send-email-iamjoonsoo.kim@lge.com

The sixth version of the workingset protection for the LRU's corner case that
comes in when a scanning of large object is made.  This version reflects new
LRU balance model and updated the performance evaluation setup.


`+ scripts-deprecated_terms-recommend-denylist-allowlist-instead-of-blacklist-whitelist.patch added to -mm tree`
----------------------------------------------------------------------------------------------------------------

https://marc.info/?l=linux-mm-commits&m=159242954415572&w=2

The patches for stop spreading of the terms, 'blacklist' and 'whitelist', are
finally merged in the '-mm' tree.

The second version of the patchset[1] was merged in there before, but the
maintainer of the 'checkpatch.pl' complained about use of 'spelling.txt'.
Therefore the author asked '-mm' tree maintainer, Andrew, to drop the patch and
made v3 and v4[2] of the patchset to convince the 'checkpatch.pl' maintainer.
After some debates, the patchset has introduced by a recent LWN article[3] and
merged again into the '-mm' tree.

[1] https://lore.kernel.org/lkml/20200609122549.26304-1-sjpark@amazon.com/
[2] https://lore.kernel.org/lkml/20200611062550.20113-1-sjpark@amazon.com/
[3] https://lwn.net/Articles/823224/


[PATCH] mm: Use unsigned types for fragmentation score
------------------------------------------------------

https://lkml.kernel.org/r/20200618010319.13159-1-nigupta@nvidia.com

This commit is for the proactive compaction.  It calculates ``fragrmen score``
for the compaction.  This commit simply converts the type for it from ``int``
to ``unsigned int``.


[RFC PATCH v3 0/1] Add rwsem "contended hook" API and mmap_lock histograms
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20200618222225.102337-1-axelrasmussen@google.com

This patch adds tracepoints for ``mmap_lock``, to know how badly it is
contended.


Linux 5.8-rc2
-------------

`https://lkml.kernel.org/r/CAHk-=whXm00G4DJ-L2XSPS+TFU_-mcL0qgcMVq62mCzuUZsCwQ@mail.gmail.com`

Though the 5.8 merge window was biggest merge window of the Linux kernel
development history, rc2 release is just as usual.  Torvalds says rc2 isn't
particularly big or scary, and falls right in the normal range.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc3..v5.8-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-06-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc2-only.png)
