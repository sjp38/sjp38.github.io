---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-07-19T07:26:27-07:00
lastmod: 2022-07-19T07:26:27-07:00
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

[RESEND PATCH v3] arm64: enable THP_SWAP for arm64 (Barry Song)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220718090050.2261-1-21cnbao@gmail.com

This patch enables `THP_SWAP` which can improve the swap performance for
transparent hugepages on ARM64 architecture.


[PATCH v12 00/69] Introducing the Maple Tree (Liam Howlett)
-----------------------------------------------------------

https://lkml.kernel.org/r/20220720021727.17018-1-Liam.Howlett@oracle.com

Maple tree has already merged in the mm-unstable but a new bug has found, so
the 12th version of the patchset has posted.


[PATCH v10 0/8] mm/demotion: Memory tiers and demotion (Aneesh Kumar K.V)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220720025920.1373558-1-aneesh.kumar@linux.ibm.com

Tenth version of the tier-demotion improvement patchset has posted.


[PATCH v2] mm/mprotect: Fix soft-dirty check in can_change_pte_writable() (Peter Xu)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220720220324.88538-1-peterx@redhat.com

This commit fixes soft-dirty checks for exclusive anonymous pages.  The cover
letter includes the test program for the check.


[PATCH mm-unstable 0/4] mm: fixes for userspace hugepage collapse, v7 (Zach O'Keefe)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220720140603.1958773-1-zokeefe@google.com

This patchset is for cleanup of `MADV_COLLAPSE` patches that needs to be
squashed in relevant patches in the mm tree.


Linux 5.19-rc8 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com

Mainly due to the retbleed mitigation, which developed under the hood and
therefore not tested by the public tests and the eyeballs, eighth release
candidate has released instead of the v5.19 this week.  No surprise here, as
usual release candidate week.  If everyone do their testing as normal, next
week we might see the v5.19.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.8..v5.19-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-07-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc8 releases in the last two years.

![rc8 release stat](/img/kernel_release_stat/v5.19-rc8-only.png)
