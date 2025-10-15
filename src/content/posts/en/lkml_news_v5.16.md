---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-01-04T07:09:18+01:00
lastmod: 2022-01-04T07:09:18+01:00
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

[PATCH v4 00/32] Separate struct slab from struct page (Vlastimil Babka)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220104001046.12263-1-vbabka@suse.cz

The work for seperating `struct slab` from `struct page` for making the `struct
page` simpler is updated to fourth version.  As the patchset was in -next tree
for a while, Vlastimil would sent a pull request of this to Linus.


[PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree -v1: Eliminate the Linux kernel's "Dependency Hell" (Ingo Molnar)
------------------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/YdIfz+LMewetSaEB@gmail.com

Ingo Molnar posted 2297 patches for making kernel build faster, by cleaning up
the header files dependency.  It achieves great build time optimization, though
the number of patches is somewhat making people wonder if it would be merged as
is.


[PATCH v6 0/9] Multigenerational LRU Framework (Yu Zhao)
--------------------------------------------------------

https://lkml.kernel.org/r/20220104202227.2903605-1-yuzhao@google.com

The sixth version of the MGLRU patchset.  There's no summary on changes from
fifth version of the patchset, but seems the code is almost same but having
more benchmark results.  Yu asks Linus and Andrew if this can be considered to
be merged in v5.17 based on the benchmark results.  Linus simply says he will
leave this to Andrew.


[PATCH] mm/migration: Add trace events for THP migrations (Anshuman Khandual)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/1641531575-28524-1-git-send-email-anshuman.khandual@arm.com

This patch adds two trace events for PMD-based THP migration without split.
More specifically, it makes `set_pmd_migration_entry()` and
`remove_migration_pmd()` to trigger the tracepoints.


[GIT PULL] slab for 5.17 (Vlastimil Babka)
------------------------------------------

https://lkml.kernel.org/r/fa6573eb-9d5c-ef49-06b1-157c16efb868@suse.cz

Vlastimil has sent pull request of slab changes for v5.17 to Linus Torvalds.
The changes include the separation of `struct slab` from `struct page`.  This
makes `struct page` simpler and `struct slab` be easily changed in future.


Linux 5.16 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wgUkBrUVhjixy4wvrUhPbW-DTgtQubJWVOoLW=O0wRKMA@mail.gmail.com

The v5.16 Linux kernel has released, as expected.  No many changes since the
v5.16-rc8, as the extra week was only due to the holidays.  This also means the
merge window for v5.17 is opening.  Linus will have travel during the window,
so he hopes many early pull requests, and doesn't feel good to do the work on
road with his laptop, as he wants to do more local build testing.  That said,
he also believes the automated test works well.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc7..v5.16.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-01-10 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
