---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-03-17T07:11:15+01:00
lastmod: 2021-03-17T07:11:15+01:00
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

File THP and HWPoison (Matthew Wilcox)
--------------------------------------

https://lkml.kernel.org/r/20210316140947.GA3420@casper.infradead.org

THP is not splitted for file-backed pages when it got memory failure.  This
mail describes the problem in detail and propose some change to mitigate it.


Issue with kfence and kmemleak (Luis Henriques)
-----------------------------------------------

https://lkml.kernel.org/r/YFDf6iKH1p/jGnM0@suse.de

Luis found a problem when kmemleak and kfence is used together.  A fix is made
by Marco.


[PATCH v4 00/13] Introduced multi-preference mempolicy (Feng Tang)
------------------------------------------------------------------

https://lkml.kernel.org/r/1615952410-36895-1-git-send-email-feng.tang@intel.com

This is the fourth version of the patchset.  It allows programs to set multiple
preferred nodes using new mempolicy called `MPOL_PREFERRED_MANY`.


We are now in linux-next! (Miguel Ojeda)
----------------------------------------

https://lkml.kernel.org/r/CANiq72nbNxpps+p4wYp03ncrbGH9FFoTfHQZwg_vGdPO41eGmQ@mail.gmail.com

The Rust support for Linux kernel development is merged in linux-next.  This
doesn't necessarily mean it will be merged in the mainline, but the authors aim
to be merged in v5.13 or v5.14.


[PATCH v5 0/5] Make alloc_contig_range handle Hugetlb pages (Oscar Salvador)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20210317111251.17808-1-osalvador@suse.de

Fifth version of the patchset making `alloc_contig_range()` to handle HugeTLB
pages.


Linux 5.12-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whDxybSS63==ycQiNobvamDmoyxQo1JL-31Tup8azbeWw@mail.gmail.com

The fourthe release is out without particular strange things.  Rather than
that, it's quite normal.  Torvalds says everything looks pretty normal, despite
the rc1 hiccup.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.1-rc3..v5.12-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-03-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.12-rc4-only.png)
