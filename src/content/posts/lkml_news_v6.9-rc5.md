---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-04-16T06:39:33-07:00
lastmod: 2024-04-16T06:39:33-07:00
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

[RFC 0/3] Improve memory statistics for virtio balloon (zhenwei pi)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20240415084113.1203428-1-pizhenwei@bytedance.com

This RFC patchset exposes six new VM statistics in the guest to the host via
virtio-balloon.  The statistics include `oom-kill`, `alloc-stall`,
`scan-async`, `scan-direct`, `reclaim-async`, and `reclaim-direct`.


[PATCH] Documentation: coding-style: don't encourage `WARN*()` (Alex Elder)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20240414170850.148122-1-elder@linaro.org

Due to the `panic_on_warn` setting, even `WARN()` and its friends are not that
welcomed in multiple situations.  Alex posted a patchset to make this point
clearer.


[PATCH 0/5] mm: code and data partitioning improvements (Maxwell Bland)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20240416122254.868007168-1-mbland@motorola.com

Because of ASLR requirements and static `VMALLOC_START`/`VMALLOC_END`, managing
allocations for ensuring uninterleaved code/data pages is impossible.  It
results in inefficient page table modifications due to the fact the individual
PTE update is required.  This patch adds minimal arch-specific hooks that can
be used to mitigate the problem.


[PATCH v5 0/4] Memory management patches needed by Rust Binder (Alice Ryhl)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20240415-alice-mm-v5-0-6f55e4d8ef51@google.com

Alice sent the fifth version of the patchset for memory management subsystem
that are required for Rust Binder.


[PATCH v10 0/5] Introduce mseal (Jeff Xu)
-----------------------------------------

https://lkml.kernel.org/r/20240415163527.626541-1-jeffxu@chromium.org

Jeff posted the tenth version of the `mseal()` systemcall.


[GIT PULL] hotfixes for 6.9-rc5 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240418144340.2f5d96a1c4e0a8fd2dc9cb66@linux-foundation.org

Andrew Morton posted the hotfixes pull request to Linus Torvalds.


Linux 6.9-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgfck-6-2YcD3Bzhjo0E0L0g2HGSZksB9pzRCah=Y4HBw@mail.gmail.com

Linus Torvalds released the fifth candidate for Linux 6.9.  It contains
bcachefs fixes and perf tools header sync with the main kernel headers.  Other
than that, only fairly normal changes exist.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ relstat.py --since 2022-04-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.9-rc5-only.png)
