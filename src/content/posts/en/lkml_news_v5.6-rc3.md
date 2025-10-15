---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.6-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-02-24T06:40:26+01:00
lastmod: 2020-02-24T06:40:26+01:00
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

[PATCH 0/2] slabinfo: parse all NUMA attributes
-----------------------------------------------

https://lkml.kernel.org/r/20200217084828.9092-1-tobin@kernel.org

The author of this patchset found some information regarding NUMA is missed in
slabinfo.  This patchset adds the info.


[PATCH v6 0/7] introduce memory hinting API for external process
----------------------------------------------------------------

https://lkml.kernel.org/r/20200219014433.88424-1-minchan@kernel.org

Sixth version of the patchset for new system call, 'madvise_process()'.
Changes are not so big.  Support null task argument and requestor's mm for
'io_madvise()'.


[PATCH] mm: Stop kswapd early when nothing's waiting for it to free pages
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20200219182522.1960-1-sultan@kerneltoast.com

Once kswapd is awaken, it does many things.  To avoid that, this patch stops
kswapd prematurely if it doesn't need to work to make and allocation succeed
anymore.


[PATCH v2 0/9] workingset protection/detection on the anonymous LRU list
------------------------------------------------------------------------

The second version of the patchset for workingset in LRU protection.  This
patchset avoids evicting workingset for scanning data.


Linux 5.6-rc3
-------------

`https://lkml.kernel.org/r/CAHk-=whGODQBDqPGcEFU8EVkNAzMK9+gK_sGaUNHSZnB=JL+_Q@mail.gmail.com`

The third rc3 release was a little bit small.  However, there were smaller rc3
and bigger rc3, either.  Torvalds says this is fairly normal rc3, though there
are too much noise in the signal to be sure about.
