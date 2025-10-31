---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-05-30T07:31:02-07:00
lastmod: 2023-05-30T07:31:02-07:00
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

[PATCH 00/12] mm: free retracted page table by RCU (Hugh Dickins)
-----------------------------------------------------------------

https://lkml.kernel.org/r/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com

This patchset aims to reduce `mmap_lock` contention by freeing retracted page
table by RCU, with preceding and succeeding patchsets.  This patchset was in
Google data center kernel for three years.


[PATCH] mm: madvise: fix uneven accounting of psi (Charan Teja Kalla)
---------------------------------------------------------------------

https://lkml.kernel.org/r/1685531374-6091-1-git-send-email-quic_charante@quicinc.com

For `madvise(MADV_PAGEOUT)` is called for folios, PSI for the folio is not
always accounted.  This patchset makes it be consistent by  always not
considering PSI for folios that are reclaimed through `madvise(MADV_PAGEOUT)`.


[PATCH 00/12] Introduce cmpxchg128() -- aka. the demise of cmpxchg_double() (Peter Zijlstra)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230531130833.635651916@infradead.org

Peter sent the third version of the patchset for introducing `cmpxchg128()`.
It is for replacing `cmpxchg_double()`.


[PATCH 0/4] vmstat bug fixes for nohz_full CPUs (Marcelo Tosatti)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20230530145234.968927611@redhat.com

This patchset fixes vmstat bugs on `nohz_full` CPUs that caused process stalls
under direct reclaim, and latency increases.


Linux 6.4-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wifuPqAFXQQTTLkp_+FMzxGFHpSG-hEtZazG-46s=noAw@mail.gmail.com

There was a timing dependent module loading hiccup in rc4.  The comit that
introduced the bug has reverted.  Other than that, no special thing in rc5.
Torvalds says it looks like in good shape.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc6..v6.4-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-06-05 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.4-rc5-only.png)
