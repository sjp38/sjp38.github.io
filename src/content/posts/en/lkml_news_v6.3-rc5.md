---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-03-28T07:31:57-07:00
lastmod: 2023-03-28T07:31:57-07:00
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

[PATCH] LoongArch: Add kernel address sanitizer support (Qing Zhang)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20230328111714.2056-1-zhangqing@loongson.cn

Loongarch has arch specific memory holes and mapping formula.  This patch adds
kasan support for Loongarch.


[PATCH v2 0/7] Split a folio to any lower order folios (Zi Yan)
---------------------------------------------------------------

https://lkml.kernel.org/r/20230329011712.3242298-1-zi.yan@sent.com

Currently, `split_huge_page()` splits huge page to only order 0 pages.  This
patchset adds support of splitting a huge page to any lower order pages.


[PATCHv9 00/14] mm, x86/cc: Implement support for unaccepted memory (Kirill A. Shutemov)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230330114956.20342-1-kirill.shutemov@linux.intel.com

Some virtual machine platforms such as intel TDX or AMD SEV-SNP requires memory
to be accepted by the guest before being used.  As the accepting process is
costly, this patchset allows the acceptance to be postpone until it is needed,
to reduce boot time and memory overhead.


[PATCH v3 0/3] Ignore non-LRU-based reclaim in memcg reclaim (Yosry Ahmed)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20230331070818.2792558-1-yosryahmed@google.com

Reclamation triggered via ``memory.reclaim`` counts pages that relcaimed based
on non-LRU mechanism.  This patchset addresses the issue.


[syzbot] Monthly mm report (syzbot)
-----------------------------------

https://lkml.kernel.org/r/00000000000032660805f8337db1@google.com

Syzbot is reporting monthly report for the issues it found with its fuzzing
tests.  During the last 30 days, 15 new issues were detected and 2 were fixed.
In total, 120 issues are still open and 197 have been fixed so far.


Linux 6.3-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi92YtfjcczOm20_mYkWZwKKjn+dCcrx8BL9n9f55MY5g@mail.gmail.com

The release for Linux v6.3 continues being normal and boring, so Linux likes
it.  Also the number of commits started decrease with this release candidate.
Linux expects the release is on track and it will be made as usual.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc7..v6.3-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-03 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.3-rc5-only.png)
