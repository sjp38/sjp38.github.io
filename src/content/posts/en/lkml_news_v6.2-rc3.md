---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-01-03T07:29:24-08:00
lastmod: 2023-01-03T07:29:24-08:00
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

[PATCH] zram: correctly handle all next_arg() cases (Sergey Senozhatsky)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20230103030119.1496358-1-senozhatsky@chromium.org

Handle NULL `val` pointer case from zram's arguments handling.


[RFC PATCH 00/25] Upstream kvx Linux port (Yann Sionneau)
---------------------------------------------------------

https://lkml.kernel.org/r/20230103164359.24347-1-ysionneau@kalray.eu

This patchset adds support of Kalray's kvx family kv3-1 CPU architecture.


[PATCH 00/46] Based on latest mm-unstable (85b44c25cd1e). (James Houghton)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20230105101844.1893104-1-jthoughton@google.com

This patchset introduces HugeTLB high-Granularity Mapping (HGM), which teaches
HugeTLB how to map HugeTLB pages at high granularity like how THPs PTE-mapped.


LSF/MM/BPF: 2023: Call for Proposals (Josef Bacik)
--------------------------------------------------

https://lkml.kernel.org/r/Y7hDVliKq+PzY1yY@localhost.localdomain

The call for proposal of LSF/MM/BPF of 2023 has posted.  It will be held from
May 8 to May 10 at Vancouver, Canada.


[LSF/MM/BPF BoF] Session for CXL memory (Viacheslav A.Dubeyko)
--------------------------------------------------------------

https://lkml.kernel.org/r/F75E3DE0-CDF2-407A-9AF7-8EAE1D177559@bytedance.com

A LSF/MM/BPF BoF session proposal for CXL memory has posted.


Linux 6.2-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjwrqFcC9-KkfboqATYwLfJHi_8Z5mTrJh=nf8KT_SjUA@mail.gmail.com

Linus Torvalds released the third release candidate for Linux 6.2.  After the
quiet holidays that made last release small, it started look a lot more normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc4..v6.2-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-01-09 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.2-rc3-only.png)
