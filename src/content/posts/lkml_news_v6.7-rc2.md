---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-11-17T07:34:48-08:00
lastmod: 2023-11-17T07:34:48-08:00
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

[PATCH v7 00/10] Small-sized THP for anonymous memory (Ryan Roberts)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20231115132734.931023-1-ryan.roberts@arm.com

The seventh revision of small-sized anonymout memory THP is posted.


[PATCH v2 00/14] Transparent Contiguous PTEs for User Mappings (Ryan Roberts)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231115163018.1303287-1-ryan.roberts@arm.com

This patchset makes opportunistic and transparent contpte mappings for user
memory when it meets the requirement.


[GIT PULL] hotfixes for 6.7-rc2 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20231117140848.02adcf56c301bb3ab85ae75a@linux-foundation.org

MM subsystem hotfixes for rc2 has sent to Linus Torvalds.


Linux 6.7-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj6j3U5r8ixVf_RQXwRYD03DuEqnX2ZsfYwvB-9YxQNLA@mail.gmail.com

Last week was having LPC and maintainers summit, so Linus expected the rc2 be
small, but it resulted in slightly larger than the average.  Linus says nothing
bad or scary though.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.16-rc3..v6.7-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-11-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.7-rc2-only.png)
