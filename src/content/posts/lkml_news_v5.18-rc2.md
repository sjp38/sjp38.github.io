---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-04-05T07:45:57+02:00
lastmod: 2022-04-05T07:45:57+02:00
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

[PATCH v7 00/70] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20220404143501.2016403-1-Liam.Howlett@oracle.com

The seventh version of the Maple tree patchset has posted.  Liam is explicitly
asking Andrew to merge it in -mm.


LSF/MM/BPF: 2022: Call for Proposals VIRTUAL OPTION (Josef Bacik)
-----------------------------------------------------------------

https://lore.kernel.org/linux-mm/YksmQSfuIx%2FOiNA8@localhost.localdomain/

CFP for virtual attendee of LSF/MM/BPF has posted.  The virtual instance of
LSF/MM/BPF will be hosted on Zoom.


mmotm 2022-04-04-17-10 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220405001100.410E3C2BBE4@smtp.kernel.org

The mmotm snapshot has updated.  It's rebased on v5.18-rc1, added 39 patches,
modified 46 patches, and dropped 18 patches.  In total, 184 patches in the
queue.


[LSF/MM TOPIC] Process (Matthew Wilcox)
---------------------------------------

https://lkml.kernel.org/r/Yky4xQn+9/ZBgqpd@casper.infradead.org

Matthew is suggesting to have a session in LSF/MM about the mm tree process.


mmotm 2022-04-05-15-54 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220405225436.AFE86C385A0@smtp.kernel.org

Andrew uploaded another mmotm.  It's still based on 5.18-rc1, added 5 new
patches, modified 16 patches, and dropped 1 patch.  In total, 188 patches in
the queue.


[PATCH v10 00/14] Multi-Gen LRU Framework (Yu Zhao)
---------------------------------------------------

https://lkml.kernel.org/r/20220407031525.2368067-1-yuzhao@google.com

The 10th version of MGLRU patchset has posted.


[PATCH v3 0/4] memcg: introduce per-memcg proactive reclaim (Yosry Ahmed)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220408045743.1432968-1-yosryahmed@google.com

This patch adds another knob for per-memcg proactive reclaim, `memory.reclaim`.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220408130819.a89195e527ce58dfbe0700b9@linux-foundation.org

Andrew has sent 9 patches for fixes of various subsystems, mainly mm.


Linux 5.18-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wh0+DYC2+Aeu2=vfUtGaDqVuKxKrxyhwQFoG89rcynzww@mail.gmail.com

As usual, the second release candidate of Linux 5.18 has out in Sunday
afternoon.  All the things looks quite normal, or at least not odd.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc2..v5.18-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.18-rc2-only.png)
