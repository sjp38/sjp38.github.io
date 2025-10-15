---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-12-29T07:36:53+01:00
lastmod: 2021-12-29T07:36:53+01:00
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

[RFC v2] mm: introduce page pin owner (Minchan Kim)
---------------------------------------------------

https://lkml.kernel.org/r/20211228175904.3739751-1-minchan@kernel.org

Second version of the RFC for page pinning owner feature, which can be useful
for tracking down who pins which page and therefore why contiguous pages
allocation or migration fails.


mmotm 2021-12-29-20-07 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211230040740.SbquJAFf5%akpm@linux-foundation.org

MM of the moment has updated.  It's rebased on v5.16-rc7, adds 32 new patches
to the queue, drops 11 patches from the queue, and modifies 100 existing
patches.  In total, 360 patches are in the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211230201202.d9bcb24678cc3d9d503579a0@linux-foundation.org

Two more mm fixes have pull-requested to Linus Torvalds.


Linux 5.16-rc8 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg=3dEpPGhz8YvJUDWhFW_GUeASBGmqyw3aPQRfB3ki9w@mail.gmail.com

As expected, unusual rc8 has made for 5.16.  And also as expected, this is a
quite tiny rc.  Torvalds will release 5.16 next week.  He also encourages
subsystem maintainers to send pull request early if possible, because he will
have a travel during the next merge window.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc6..v5.16-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-01-03 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc8 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc8-only.png)
