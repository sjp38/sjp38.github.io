---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-01-11T07:35:47+01:00
lastmod: 2020-01-11T07:35:47+01:00
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


OOM killer not nearly agressive enough?
---------------------------------------

https://lkml.kernel.org/r/20200107204412.GA29562@amd

The author if this mail, Pavel updated his userspace to x86-64 and encountered
chromium's memory hogging.  He was required to kill the chromium himself,
because OOM killer didn't kill it.  He asks whether this means OOM killer is
not aggressive enough.


[PATCH 0/4] introduce memory hinting API for external process
-------------------------------------------------------------

https://lkml.kernel.org/r/20200110213433.94739-1-minchan@kernel.org

Minchan has previously posted the patchset introducing the `MADV_COLD`,
`MADV_PAGEOUT` and external `madvise()` able code change.  However, he has
split the patchset into two part.  And, the first part, which adds `MADV_COLD`
and `MADV_PAGEOUT` has been merged to the mainline.  This patchset is the
second part of the patchset.  Now he aims to let processes to be able to do
`madvise()` to other processes.


Linux 5.5-rc6
-------------

https://lkml.kernel.org/r/CAHk-=wjZRs-nL2SQ3syoyC8-Ycaj-AcH18UHe2b3GV0ayf0ZjQ@mail.gmail.com

This release was also very calm.  Linus suspects it was due to the holiday.
Therefore, he thinks the 5.5 release will be after '-rc8', this time.  But,
it's not fixed plan.  If things go well, he might release the 5.5 only after
'-rc7' as usual.

Most changes for rc6 was for drivers.
