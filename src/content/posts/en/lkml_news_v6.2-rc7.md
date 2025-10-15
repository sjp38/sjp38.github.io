---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-01-31T07:50:12-08:00
lastmod: 2023-01-31T07:50:12-08:00
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

[LSF/MM/BPF TOPIC] CXL Fabric Manager (FM) architecture (Viacheslav A.Dubeyko)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/7F001EAF-C512-436A-A9DD-E08730C91214@bytedance.com

A topic suggestion for LSF/MM/BPF.  It suggests to discuss about Fabric Manager
(FM) architecture, which requires configuration tool, daemon, and QEMU
emulation of CXL hardware features.


[PATCH V2 0/3] sched/numa: Enhance vma scanning (Ragghavendra K T)
------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1675159422.git.raghavendra.kt@amd.com

A patchset for improving access scanning for NUMA balancing.  This uses
per-thread VMA scanning idea from Mel.


LSFMMBPF proposal [MM]: Lazy RCU memory reclaim (Joel Fernandes)
----------------------------------------------------------------

https://lkml.kernel.org/r/Y9o+FWwoLUdp2ees@google.com

Joel proposes an LSF/MM/BPF session for introducing lazy RCU, which adds
multi-seconds delays in RCU memory reclaim for power saving on Android and
ChromeOS.


[LSF/MM/BPF TOPIC] mm docs (Mike Rapoport)
------------------------------------------

https://lkml.kernel.org/r/Y9qje+k0a77UlOwd@kernel.org

Mike proposes an LSF/MM/BPF session for discussing mm documentation
improvements.


[RFC PATCH v1 0/2] Ignore non-LRU-based reclaim in memcg reclaim (Yosry Ahmed)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230202233229.3895713-1-yosryahmed@google.com

Non-LRU-based reclaimed pages are counted as LRU-based reclaim.  This patchset
makes the counter to ignore those pages to avoid overestimated counts.


Linux 6.2-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whSVeeQN9vO-WSxFkNs0zbUJEBqND-1VO8OJtmu_sn_nw@mail.gmail.com

Seventh release candidate for Linux 6.2 has released with fair small size.
Torvalds says it's almost ready to be released as 6.2 next week, but he will do
one more rc release due to the holidays at the beginning of 6.2 release, as
promised.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11..v6.2-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-02-06 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.2-rc7-only.png)
