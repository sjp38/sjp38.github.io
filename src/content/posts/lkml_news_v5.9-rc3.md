---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LkML New v5.9-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-08-25T07:52:02+02:00
lastmod: 2020-08-25T07:52:02+02:00
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

[RFC -V3 0/5] autonuma: Optimize memory placement for memory tiering system (Huang Ying)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200825002354.17038-1-ying.huang@intel.com

The third RFC of autonuma for help placing of data items on systems utilizing
both DRAM and PMEM as different NUMA nodes.


Linux 5.9-rc3
-------------

https://lkml.kernel.org/r/CAHk-=wiD1yujm_WvWLYL7gZsWMvZyWMg1rfU7dWmnYYc3a7Gsg@mail.gmail.com

This week rc release is also quite normal.  The 'fallthought' comment
conversion made fairly evenly distributed changes.  Torvalds says it was quite
calm.  Indeed, only one patchset got my interest this week.  I guess it was
maybe due to the Linux Plumbers Conference.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc3..v5.9-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-08-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc3-only.png)
