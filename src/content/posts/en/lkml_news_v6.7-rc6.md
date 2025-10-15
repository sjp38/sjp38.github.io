---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-12-12T07:07:30-08:00
lastmod: 2023-12-12T07:07:30-08:00
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

[Invitation] Linux MM Alignment Session on remap_file_pages on Wednesday (David Rientjes)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/46f97bec-3a48-e714-0a8d-b5206e1704ba@google.com

There will be the last Linux MM Alignment Session for re-introducing
`remap_file_pages()`, led by Matthew Wilcox, on 2023-11-13.


[PATCH] kernel: Introduce a write lock/unlock wrapper for tasklist_lock (Maria Yu)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231213101745.4526-1-quic_aiquny@quicinc.com

There are multiple scenarios for `tasklist_lock` that could lead to bad
responsiveness.  To mitigate the situation, this patch introduces a write
lock/unlock wrapper for `tasklist_lock`.


[PATCH 0/9] Finish two folio conversions (Matthew Wilcox)
---------------------------------------------------------

https://lkml.kernel.org/r/20231211162214.2146080-1-willy@infradead.org

This patchset finishes the folio conversions for `page_add_new_anon_ramp()` and
`lru_cache_add_inactive_or_unevictable()`.


[RFC PATCH v3 00/11] Introduce mseal() (Jeff Xu)
------------------------------------------------

https://lkml.kernel.org/r/20231212231706.2680890-1-jeffxu@chromium.org

Third version of the patchset introducing an architecture independent VMA
protection systemcall, `mseal()` has posted.


[RFC PATCH v2 0/2] Node migration between memory tiers (Srinivasulu Thanneeru)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231213175329.594-1-sthanneeru.opensrc@micron.com

This patchset supports node migration between tiers on sysadmin's demand.


[PATCH v4 0/4] mm/ksm: Add ksm advisor (Stefan Roesch)
------------------------------------------------------

https://lkml.kernel.org/r/20231213182729.587081-1-shr@devkernel.io

This patchset adds an automatic setting manager for `pages_to_scan` of ksm.


mm/DAMON: Profiling enhancements for DAMON (Aravinda Prasad)
------------------------------------------------------------

https://lkml.kernel.org/r/20231215074619.173787-1-aravinda.prasad@intel.com

A patchset for improving DAMON's accuracy using higher level page table
accessed bit has posted.  It is what used for a recent arXiv paper
(https://arxiv.org/pdf/2311.10275.pdf).


[GIT PULL] hotfixes for 6.7-rc6 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20231215071604.946a433bbc05a6409faf5a33@linux-foundation.org

Andrew sent hotfixes pull request for v6.7-rc6.  As a reply, Linus Torvalds
asking a plan to making MGLRU only one model.


Linux 6.7-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi17USyiO=G0yDXP62eqU3V6x3ck0HcnVMPKHNPsBP_ig@mail.gmail.com

Linus released the sixth release candidate for Linux v6.7.  Though Mellanox and
intel iavf ethernet driver, some legacy debugging code removal, and filesystems
including smb, btrfs, bcachefs and fuse got some unusual changes, but nothing
really stands out.  If we don't have extension of the rc period, v6.7 would be
released at 2024-01-01.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-12-18 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/linux_stat_v6.7-rc7-only.png)
