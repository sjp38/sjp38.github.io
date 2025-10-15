---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-10-27T07:10:48+01:00
lastmod: 2020-10-27T07:10:48+01:00
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

[PATCH 0/9] More THP fixes (Matthew Wilcox)
-------------------------------------------

https://lkml.kernel.org/r/20201026183136.10404-1-willy@infradead.org

Several THP fixes.


[PATCH v5 0/9] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201027141606.426816-1-elver@google.com

The fifth version of the KFENCE.


[PATCH -V2 0/2] autonuma: Migrate on fault among multiple bound nodes (Huang Ying)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201028023411.15045-1-ying.huang@intel.com

This patch is for multiple NUMA nodes bounded application's AutoNUMA balancing.


[PATCH v6 0/9] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201029131649.182037-1-elver@google.com

The sixth version of KFENCE patchset came out quite quickly than before.  Jann
says now there are only minor issues.


Linux 5.10-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiGc62spBHh+i1yH9sVLpCqZBznUF8QdO7H5772qO1xqQ@mail.gmail.com

As usual, the rc2 released.  It is a little big bigger than usual, and a lot of
the diffstat is due to removal of MIC drivers for some hardware and ABI
documents formatting for easy parsing.  These made Torvalds feels a little bit
odd about this release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc2..v5.10-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-11-02 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc2-only.png)
