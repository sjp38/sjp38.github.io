---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-12-28T07:59:10-08:00
lastmod: 2022-12-28T07:59:10-08:00
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

[PATCH -next v3 0/7] mm: convert page_idle/damon to use folios (Kefeng Wang)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20221228113413.10329-1-wangkefeng.wang@huawei.com

Patchset for converting Idle Pages Tracking and DAMON to use Folios instead of
Page where possible has posted.


[PATCH 1/1] mm: fix vma->anon_name memory leak for anonymous shmem VMAs (Suren Baghdasaryan)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221228194249.170354-1-surenb@google.com

Shared anonymous pages VMA naming has a memory leak.  This patch fixes the
leak.


[QUESTION] about the maple tree and current status of mmap_lock scalability (Hyeonggon Yoo)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/EC51CFA7-2BC8-4F72-A7D4-3B1A778EDB37@gmail.com

Hyeonggon has asked the status and plan of `mmap_lock` scalability improvement.
Interesting discussion continues there.  Suren says he worked with Liam for
making the maple tree to sue per-vma lock and it is already almost done, and
would post the patch in 2023, probably in January.


Linux 6.2-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wim8DMRzjyYTJ3UbdqZ26keQyZSU02NZb-JY1=9OpcO1w@mail.gmail.com

Due to the holidays season, last week was quite calm, though there were several
pull requests for Linus Torvalds at the end of the week.  As a result, 6.2-rc2
has released, but with only small changes.  Linus expects the trend will
continue for rc3.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc3..v6.2-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-01-02 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.2-rc2-only.png)
