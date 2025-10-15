---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-04-12T06:42:16+02:00
lastmod: 2022-04-12T06:42:16+02:00
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

Re: [PATCH v10 00/14] Multi-Gen LRU Framework (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/linux-mm/20220411191559.a844c7140faeba2e68d842b7@linux-foundation.org/

Andrew Morton's overall answer to MGLRU patchset.  He would merge the latest
MGLRU in -mm and -next, but would request broader update to the code.


mmotm 2022-04-12-21-05 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220413040610.06AAAC385A4@smtp.kernel.org

A snapshot of -mm has updated.  It added 79 new patches, modified 24 patches,
and dropped 10 patches.  In total, 257 patches in the queue.


[PATCH v2 0/5] mm: demotion: Introduce new node state N_DEMOTION_TARGETS (Jagdish Gediya)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220413092206.73974-1-jvgediya@linux.ibm.com

This patchset adds new memory node state `N_DEMOTION_TARGETS`, which indicates
the node is for demotion.  This helps a situation where DRAM-only memory numa
node having same node state.


[PATCH v2 00/12] mm: userspace hugepage collapse (Zach O'Keefe)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220414180612.3844426-1-zokeefe@google.com

Second version of the userspace hugepage collapse.  This patchset adds a new
MADV hint which allows user space to directly collapse hugepage.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220414191240.9f86d15a3e3afd848a9839a6@linux-foundation.org

14 patches for fixing various subsystems are sent from Andrew to Linus.


[PATCH rfc 0/5] mm: introduce shrinker sysfs interface (Roman Gushchin)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20220416002756.4087977-1-roman.gushchin@linux.dev

This patchset adds a new sysfs interface at `/sys/kernel/shrinker/`, which can
be used for fine control and debugging of the shrinkers.


[PATCH RFC lsfmm 0/6] mm: proactive reclaim and memory tiering topics (Davidlohr Bueso)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220416053902.68517-1-dave@stgolabs.net

Davidlohr is proposing a new LSFMM topic with an RFC patch which introducing
another sysfs interface for memory tier information exposure to the user space.


Linux 5.18-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgBR6P8EseYMjfMjxQ_oTpoQmL0qvKpAw04kP-HBgSGFg@mail.gmail.com

The third release candidate of 5.18 has prioritized to be released even on
Easter Sunday, so we have it now.  Everything looks quite normal, though email
changes in devicetree files and sound card probing error handling fixes are
making the diffstat a little bit odd.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc3..v5.18-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-02-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.18-rc3-only.png)
