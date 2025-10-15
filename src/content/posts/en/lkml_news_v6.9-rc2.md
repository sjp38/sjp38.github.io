---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-03-26T06:34:47-07:00
lastmod: 2024-03-26T06:34:47-07:00
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

[PATCH 0/2] support multi-size THP numa balancing (Baolin Wang)
---------------------------------------------------------------

https://lkml.kernel.org/r/cover.1711453317.git.baolin.wang@linux.alibaba.com

Baolin posted a patchset for making NUMA balancing algorithm for multi-sized
THP (mTHP) to follow the THP strategy as the basic support.


[PATCH v2 0/6] Improve visibility of writeback (Kemeng Shi)
-----------------------------------------------------------

https://lkml.kernel.org/r/20240327155751.3536-1-shikemeng@huaweicloud.com

Kemeng posted a patchset that adds two new debugfs file, `bdi/xxx/stats` and
`bdi/xxx/wb_stats` to show whole bdi and per-wb writeback information.


[PATCH v10] zswap: replace RB tree with xarray (Chris Li)
---------------------------------------------------------

https://lkml.kernel.org/r/20240326-zswap-xarray-v10-1-bf698417c968@kernel.org

Chris sent tenth version of the patchset for making zswap uses xarray instead
of rb tree.


[PATCH v5 0/6] Swap-out mTHP without splitting (Ryan Roberts)
-------------------------------------------------------------

https://lkml.kernel.org/r/20240327144537.4165578-1-ryan.roberts@arm.com

Ryan posted the fifth version of the patchset for making multi-zied THP (mTHP)
be swapped out without the need to split first.


[RFC] mm: Introduce uKSM for user-controlled KSM (Hui Zhu)
----------------------------------------------------------

https://lkml.kernel.org/r/20240329104035.62942-1-teawater@antgroup.com

Hui sent an RFC for extending KSM to allow users control the KSM via procfs.


[LSF/MM/BPF TOPIC] Multi-sized THP performance benchmarks and analysis on ARM64 (Yang Shi)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAHbLzkq5H6Pht1XbCEJDe_n7=99c=oPOaY+1Dy9d=2gwiHKcWA@mail.gmail.com

Yang Shi suggested a new LSFMM topic for sharing his mTHP benchmarks results.


[PATCH RFC 0/2] mTHP-friendly compression in zsmalloc and zram based on multi-pages (Barry Song)
------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240327214816.31191-1-21cnbao@gmail.com

Barry posted an RFC patchset for making zswap and zsmalloc be mTHP-friendly.
She mentions she found improvement on compression ratios and CPU utilization
decrease when large folios are compressed at a larger granularity.


[GIT PULL] hotfixes for 6.9-rc2 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240327113214.f0200bec5624169a86371797@linux-foundation.org

Andrew sent a hotfixes pull request to Linus Torvalds.


[RFC PATCH v3 0/8] mm: workingset reporting (Yuanchu Xie)
---------------------------------------------------------

https://lkml.kernel.org/r/20240327213108.2384666-1-yuanchu@google.com

Yuanchu posted an RFC patchset for reporting workingset of the system and
cgroups.


Linux 6.9-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjf=8JusO9TgkMfNziLjjSHdMOUpes_6f5m9_w+7taeBA@mail.gmail.com

Despite of the Easter, the 6.9-rc2 release has made without any delay.
Torvalds states that nothing stands out.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using
below command:

    $ git_helpers/relstat.py --since 2022-04-01 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/linux_stat_v6.9-rc2-only.png)
