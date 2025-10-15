---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Lkml_news_v5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-11-18T08:46:06+01:00
lastmod: 2020-11-18T08:46:06+01:00
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

[PATCH v9 0/9] mm: introduce memfd_secret system call to create "secret" memory areas (Mike Rapoport)
-----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201117162932.13649-1-rppt@kernel.org

The 9th version of the memfd_secret patchset.


[patch V4 0/8] mm/highmem: Preemptible variant of kmap_atomic & friends (Thomas Gleixner)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201118194838.753436396@linutronix.de

As the name suggests, this patchset allow the code using `kmap_atomic` and
similar things to be preemptible.  This incur some overhead to highmem, but
Thomas claims highmem was always slow.


[PATCH 0/7] Split huge pages to any lower order pages and selftests. (Zi Yan)
-----------------------------------------------------------------------------

The patchset adds support for any order pages that could be used as a pagecache
THP after Matthew's work.


Linux 5.10-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiYHcVOuZo8LNn__OgqY_ePW3BSPW8FxZbfChrT8SHnuw@mail.gmail.com

This is the biggest rc5 in the 5.x series.  The changes looks normal to Linus,
but the rc5 releases are normally supposed to start calmdown and shrink.  Linus
also note that he hope things to calm down.  If not, the 5.10 release might
come out in the holiday season.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc5..v5.10-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-11-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc5-only.png)
