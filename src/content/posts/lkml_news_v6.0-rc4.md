---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-08-30T08:15:04-07:00
lastmod: 2022-08-30T08:15:04-07:00
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

[RFC PATCH 00/28] per-VMA locks proposal (Suren Baghdasaryan)
-------------------------------------------------------------

https://lkml.kernel.org/r/20220829212531.3184856-1-surenb@google.com

The VMA lock scalability issue is still there.  This RFC patchset shows the
proof of the concept for the per-VMA lock idea, which was discussed in LSF/MM
this year, as part of the SPF discussion.


[RFC PATCH 00/30] Code tagging framework and applications (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220830214919.53220-1-surenb@google.com

This RFC patchset introduces code tagging framework which can identify a
specific location in the source code when compile.  Using the framework, we can
do memory allocation tracking, dynamic fault injection, latency tracking, etc.


[GIT PULL] slab fix for 6.0-rc4 (Vlastimil Babka)
-------------------------------------------------

https://lkml.kernel.org/r/72c237d6-df43-fc3b-4948-6d9a34ef3ba8@suse.cz

Vlastimil sent a slab fix pull request to Linus for v6.0-rc4.


[Resend RFC PATCH] mm: introduce `__GFP_TRACKLEAK` to track in-kernel allocation (Zhaoyang Huang)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1662116347-17649-1-git-send-email-zhaoyang.huang@unisoc.com

It's hard to debug memory leaks in kthread and drivers as they could fetch
memory via direct `alloc_pages()` calls.  This patches solves this by
introducing yet another `GFP` flag, `__GFP_TRACELEAK` and reuse `kmemleak`
mechanism.


Linux 6.0-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiqix9N5P0BXrSSOXjPZxMh=wDDRJ3sgf=hutoTUx0nZQ@mail.gmail.com

Another normal week has passed and the fourth release candidate for Linux v6.0
has released.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc5..v6.0-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-09-05 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.0-rc4-only.png)
