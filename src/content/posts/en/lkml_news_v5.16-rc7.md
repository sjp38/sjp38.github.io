---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-12-21T09:01:07+01:00
lastmod: 2021-12-21T09:01:07+01:00
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

[PATCH v5 00/16] Optimize list lru memory consumption (Muchun Song)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20211220085649.8196-1-songmuchun@bytedance.com

Fifth version of the patchset for reducing lru memory consumption.  This
version fixes a sleep-in-atomic-context bug which is reported by the kernel
test robot, applies some requests from Johannes, and collect Acked-by from
Johannes.


[PATCH 0/2] Add a new scheme to support demotion on tiered memory system (Baolin Wang)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1640077468.git.baolin.wang@linux.alibaba.com

This patchset makes DAMOS supports demotion of memory regions.


mmotm 2021-12-22-19-02 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211223030245.4khVQJi6f%akpm@linux-foundation.org

mmotm based on v5.16-rc6 has updated.  It adds 44 new patches, modifies 11
pre-existing patches, and drops one patch.  In total, 339 patches are in the
queue.


remove Xen tmem leftovers (Christoph Hellwig)
---------------------------------------------

https://lkml.kernel.org/r/20211224062246.1258487-1-hch@lst.de

Cleancache and Frontswap were used for Xen tmem driver, but it has removed in
2019.  However, some hooks are remaining in the source tree.  This patchset
removes cleancache and unused parts of frontswap.


[RFC] mm/migration: Add trace events for THP migrations (Anshuman Khandual)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/1640328398-20698-1-git-send-email-anshuman.khandual@arm.com

This RFC patch adds two trace events, namely `set_migration_pmd` and
`remove_migration_pmd` for tracing PMD-based THP migration without split.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211224211127.30b60764d059ff3b0afea38a@linux-foundation.org

Andrew Morton sent 9 patches for fixes of several subsystems including DAMON to
Linus.


Linux 5.16-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgV_v+Enop3TwRFtJY74UjQtw=kfOzGXTQscLx2syW6Eg@mail.gmail.com

Seventh release candidate for v5.16 also looks pretty normal.  Nevertheless,
this could be due to the holidays season.  Linus will extend the staging window
at least one week, as he told before.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc5..v5.16-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-12-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc7-only.png)
