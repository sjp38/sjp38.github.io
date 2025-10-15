---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-12-19T06:37:26-08:00
lastmod: 2023-12-19T06:37:26-08:00
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

[PATCH v5 0/4] mm/ksm: Add ksm advisor (Stefan Roesch)
------------------------------------------------------

https://lkml.kernel.org/r/20231218231054.1625219-1-shr@devkernel.io

Stefan posted the fifth version of the patchset for automatic and efficient
tuning of kernel samepage merging.


[PATCH -next v4 0/2] Make memory reclamation measurable (Bixuan Cui)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20231220012123.2787-1-cuibixuan@vivo.com

This patchset adds a new tracer to `shrink_active_list()`,
`shrink_inactive_list()`, and `shrinker->count_objects()` to make memory
recycling mesaurable with bpf.


[RFC PATCH 1/1] mm: mark folio accessed in minor fault (Zhaoyang Huang)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20231220102948.1963798-1-zhaoyang.huang@unisoc.com

Inactive mapped folio is promoted to active only when it is scanned in
`shrink_inactive_list()`.  This RFC patch marks in accessed in minor fault.


LSF/MM/BPF: 2024: Call for Proposals (Daniel Borkmann)
------------------------------------------------------

https://lkml.kernel.org/r/4343d07b-b1b2-d43b-c201-a48e89145e5c@iogearbox.net

LSFMM+BPF 2024 CFP is out.  It will be held from May 13 to May 15 in Salt Lake
City.  Invitation request should be sent by 2024-03-01.


[PATCH] MAINTAINERS: remove hugetlb maintainer Mike Kravetz (Mike Kravetz)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20231220220843.73586-1-mike.kravetz@oracle.com

Mike Kravetz is stepping away from hugetlb maintainer.  Muchun Song will
continue maintaining it.


[PATCH v2 00/17] kexec: Allow preservation of ftrace buffers (Alexander Graf)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231222193607.15474-1-graf@amazon.com

Alexander posted second version of kexec handover, which allows preserving
kernel information across kexec-based boots.


Linux 6.7-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjDbR1oNZtqTNE4n8MHbzi028JFKSCvyW88hw+0GO=P+A@mail.gmail.com

Due to the holidays, Linus released the seventh candidate of Linux v6.7 on
Saturday.  He also again announces he will release one more rc kernel next
week, again due to the holidays.  The rc7 kernel is a bit bigger than rc6, but
not hugely so.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-12-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/linux_stat_v6.7-rc7-only.png)
