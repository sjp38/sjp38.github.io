---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-07-28T07:07:40+02:00
lastmod: 2020-07-28T07:07:40+02:00
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

[PATCH v2 0/7] mm: introduce memfd_secret system call to create "secret" memory areas (Mike Rapoport)
-----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200727162935.31714-1-rppt@kernel.org

This is the second version of the secretmemfd.  In this version, the system
call has renamed to 'memfd_secret'.


[RFC PATCH 0/5] madvise MADV_DOEXEC (Anthony Yznaga)
----------------------------------------------------

https://lkml.kernel.org/r/1595869887-23307-1-git-send-email-anthony.yznaga@oracle.com

This patch introduces another madvise hint, ``MADV_DOEXEC``.  It preserves an
anonymous memory range across exec.


[RFC PATCH 0/6] decrease unnecessary gap due to pmem kmem alignment (Jia He)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20200729033424.2629-1-justin.he@arm.com

Because dax pmem as RAM device on arm64 makes the start address aligned with 1G
memblock size, the amount of memory space of it is limited.  This patch
decreases the alignment requirement to solve the problem.


Raw spinlocks and memory allocation (Paul E. McKenney)
------------------------------------------------------

https://lkml.kernel.org/r/20200730231205.GA11265@paulmck-ThinkPad-P72

Paul E. McKenney is asking mm people to add new ``GFP_`` flag for RCU.  In case
of raw atomic contexts, ``call_rcu()`` traditionally traversed a cache cold
linked list for the callbacks.  Instead, recently Uladzislau has made it to use
array instead of the linked list.  It showed non subtle benefit.  Now, how the
array should be allocated?  Because it's called within the raw atomic context,
it shouldn't hold the non-raw spinlock.  However, there is no ``GFP_`` flag for
such behavior.  Paul, hence, is asking mm people to add another ``GFP_`` flag
of the behavior.

[PATCH] mm: introduce reference pages (Peter Collingbourne)
-----------------------------------------------------------

https://lkml.kernel.org/r/20200731203241.50427-1-pcc@google.com

This patch introduces a new mmap flag, ``MAP_REFPAGE``.  It creates a mapping
backed by a reference page, which address is specified using the offset
argument to mmap.  Thus, reading the region can be done directly from the
reference page, and the writing to the region will do copy-on-write.

Linux 5.8 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wj+mDPbj8hXspXRAksh+1TmPjubc9RNEbu8EVpYyypX=w@mail.gmail.com

I was very curious what the name of this release will be, as the march to v5.8
seemed quite dynamic.  Torvalds also says he considered rc8 all the way to the
last minute.  He finally decided to release v5.8 instead of the v5.8-rc8.  I
titled this post in my estimation, and it fortunately turned out to be right :)

Torvalds explains though we had very large rc1 for this release, there were
really nothing scary.  Though there were header dependency problem last week,
Torvalds says it was always there annoying and he says about adoption of some
tooling.

So in the last week, there were the silly header file noise, dominant
networking pull request, and some RCU fixes.  And, the big release of 5.8 is
here now!

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18..v5.8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-07-27 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
