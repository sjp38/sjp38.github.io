---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-02-14T07:02:05-08:00
lastmod: 2023-02-14T07:02:05-08:00
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

[PATCH] mm/userfaultfd: Support operation on multiple VMAs (Muhammad Usama Anjum)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230213104323.1792839-1-usama.anjum@collabora.com

`mwriteprotect_range()` handle only single VMA, but there are usecases which
need to handle multiple VMAs in a memory range of interest.  This commit fixes
the case.


[v2 PATCH 0/5] Introduce mempool pages bulk allocator and use it in dm-crypt (Yang Shi)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230214190221.1156876-1-shy828301@gmail.com

Noticeable overhead on disc encryption due to page allocations have found.  The
overhead was because the allocation logic in dm-crypt allocates one page in
each pass of a loop.  This patchset introduces a new bulk allocator API and use
it for dm-crypt.


[PATCH v3 00/35] Per-VMA locks (Suren Baghdasaryan)
---------------------------------------------------

https://lkml.kernel.org/r/20230216051750.3125598-1-surenb@google.com

Third version of the patchset for improving vma locking overhead has posted.


[LSF/MM/BPF TOPIC] Using hardware counters to determine hot/cold pages
----------------------------------------------------------------------

https://lkml.kernel.org/r/6bbf2c47-05ab-b78c-3165-2eff18962d6d@linux.ibm.com

PowerPC provides access counter and access affinity details at configurable
page size granularity.  Aneesh propose to introduce it and discuss about the
best ways to integrate it in the Linux kernel.


[LSF/MM/BPF TOPIC] Scalable Pagefaults (Matthew Wilcox)
-------------------------------------------------------

https://lkml.kernel.org/r/Y+/f9slIaK195fRX@casper.infradead.org

Matthew is proposing yet another topic for continueing the page faults multi
CPU scalability issue.  He hopes the per-VMA locks patchset to be merged in at
least mm tree by the time, and be able to discuss further improvements.


Linux 6.2 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wio46vC4t6xXD-sFqjoPwFm_u515jm3suzmkGxQTeA1_A@mail.gmail.com

Linux v6.2 has released as expected, with the extended schedule.  There were
some more fixes for some regressions, but Linus didn't merge those because the
maintainers didn't push.  Those would be merged in stable release of 6.2,
later.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc2..v6.2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-02-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
