---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-05-18T07:11:13+02:00
lastmod: 2021-05-18T07:11:13+02:00
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

RCU tests for Maple Tree (Paul E. McKenney)
-------------------------------------------

https://lkml.kernel.org/r/20210517154048.GA2013926@paulmck-ThinkPad-P17-Gen-1

Paul is asking if there are rcu-related tests for Maple Tree other than
`rcu_loop()` and `rcu_val()` that Paul needs to looking for.


[PATCH v20 0/7] mm: introduce memfd_secret system call to create "secret" memory areas (Mike Rapoport)
------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210518072034.31572-1-rppt@kernel.org

The 20th version of the patchset that implements 'secret' mappings backed by a
file descriptor.


[PATCH v3 00/14] Multigenerational LRU Framework (Yu Zhao)
----------------------------------------------------------

https://lkml.kernel.org/r/20210520065355.2736558-1-yuzhao@google.com

Third version of multi-gen LRU patchset is posted.  No many changes but fixed a
bug and rebased on v5.13-rc2.


[LSF/MM TOPIC] mm documentation (Mike Rapoport)
-----------------------------------------------

https://lkml.kernel.org/r/YKYkKTZsWZg88tWd@kernel.org

Another LSF/MM topic proposal for improving documentation of MM.


Linux 5.13-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiUwtRp+jjCMd9x8O90iD_YHVBQzJoKCsT9e06L7qob3Q@mail.gmail.com

Unlike the expectation, this week's release is very small.  This is interesting
because rc3 is usually the time real fixes coming in.  However, this is the
smallest rc3 in the 5.x series.  Would not because there is no problem at all,
but people are not sending fixes yet.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc3..v5.13-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-05-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc3-only.png)
