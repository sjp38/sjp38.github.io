---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-06-29T07:11:39+02:00
lastmod: 2021-06-29T07:11:39+02:00
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

incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210628193256.008961950a714730751c1423@linux-foundation.org

The first pull request from Andrew Morton for the v5.14 merge window.


[PATCH v3 00/18] Folio conversion of memcg (Matthew Wilcox)
-----------------------------------------------------------

https://lkml.kernel.org/r/20210630040034.1155892-1-willy@infradead.org

This patchset was a part of the memory folio patchset, but has split out to
individual patchset.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210630184624.9ca1937310b0dd5ce66b30e7@linux-foundation.org

Rest of the -mm tree, which dependent on things in -next.  Andrew will trickle
that over next week, before the merge window is closed.


[PATCH 0/5] writeback: Fix bandwidth estimates (Jan Kara)
---------------------------------------------------------

https://lkml.kernel.org/r/20210705161610.19406-1-jack@suse.cz

When the storage device is not fully busy, the writeback throughput estimation
can be wrongly zero.

This patchset fixes the issue and cleans up related code.


[PATCH Part1 RFC v4 00/36] Add AMD Secure Nested Paging (SEV-SNP) Guest Support (Brijesh Singh)
-----------------------------------------------------------------------------------------------

This patchset series makes Linux to support Secure Encryptd Paging (SEV-SNP) of
AMD.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210707175950.eceddb86c6c555555d4730e2@linux-foundation.org

Another pull request from Andrew Morton.  Below patchsets looks interesting.

- "mm: introduce memfd_secret system call to create "secret" memory areas", v20
- "Add build ID to stacktraces", v6


Linux 5.14-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjB5XBk4obhMPfrU3mnOakV9VgHAYOo-ZGJnB2X0DnBWA@mail.gmail.com

Usual two weeks of the merge winodw has passed and now the first release
candidate for 5.14 is ready.  This release is just usual in size, though the
regular size doesn't always means there will be only regular amount of issues.

Most of the changes are for AMD drivers headers.  Other than that, most changes
are for drivers.  Remaining changes are well spread to architectures and
various core kernel parts.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc2..v5.14-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-07-12 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc1-only.png)
