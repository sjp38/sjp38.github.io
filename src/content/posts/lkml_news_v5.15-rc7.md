---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-10-19T07:39:33+02:00
lastmod: 2021-10-19T07:39:33+02:00
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

incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20211018151438.f2246e2656c041b6753a8bdd@linux-foundation.org

19 mm subsystem fix patches have sent to Linus Torvalds.


[PATCH v11 1/3] mm: rearrange madvise code to allow for reuse (Suren Baghdasaryan)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20211019215511.3771969-1-surenb@google.com

This commit refactor some madvise code for vma updates so that those can be
reused by `prctl`.


mmotm 2021-10-20-20-40 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211021034104.F6VxKBQcG%akpm@linux-foundation.org

Andrew updated mmotm.  It's based on 5.15-rc6, adds 74 new patches modifies 29
existing patches, and drops 22 patches.  In total, 366 patches in the queue.


Linux 5.15-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wi1+boAQyckdiYXuBkybN4H_7OT569MwgyetWAfTExeEA@mail.gmail.com

This time, the release has been delayed about one day, not because of any
kernel trouble, but Linus' travel.  Rather than that, the rc7 is quite normal,
and it turned out that the big rc6 was just due to a timing issue.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc6..v5.15-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-10-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v5.15-rc7-only.png)
