---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.9-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-09-01T07:20:35+02:00
lastmod: 2020-09-01T07:20:35+02:00
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

[PATCH v9 0/3] introduce memory hinting API for external process (Minchan Kim)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200901000633.1920247-1-minchan@kernel.org

After the rejection, this patchset posted again.  Linus's opinion about
dropping the ``task_struct`` to ``do_madvise`` and Christian's comment
regarding compat syscall entry has resolved.

And, this patchset merged in the '-mm' tree again.  Hopefully it will be merged
in mainline by 5.10!


[PATCH v6 0/3] Anonymous VMA naming patches (Sumit Semwal)
----------------------------------------------------------

https://lkml.kernel.org/r/20200901091901.19779-1-sumit.semwal@linaro.org

This is reposting of old patchset which Colin Cross sent before.  Sumit Semwal
repost this mainly due to its necessary for Android on mainline kenrnel.


[RFC PATCH 00/16] 1GB THP support on x86_64 (Zi Yan)
----------------------------------------------------

https://lkml.kernel.org/r/20200902180628.4052244-1-zi.yan@sent.com

This patchset makes 1GB THP available on x86_64.


[PATCH] mm: workingset: ignore slab memory size when calculating shadows pressure (Roman Gushchin)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200903230055.1245058-1-guro@fb.com

`count_shadow_nodes()` function returns the memory size for LRU pages and slab.
This makes sense in non-memcg case, but in memcg case, this doesn't make sense
as the shadow nodes themselves are backed by slabs.  Also, recent commit
fb2f2b0adb98 ("mm: memcg/slab: reparent memcg kmem_caches on cgroup removal")
makes the per-lruvec slab counters on non-leaf cgroup inaccurate.  For the
reason, this commit redefines the `count_shadow_nodes()` to not count the slab
memory.


Linux 5.9-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgdq1XfoECVoZyr5+j+LM7oG31DhEhSoju=DQFBdSvEsw@mail.gmail.com

Unlke last week, this week release has unusually many changes.  Maybe the
changes for last week came this week.  Nonetheless, it's not outlier.  Changes
are spread well.  So, Torvalds says he can't say it's calmed down, but also he
doesn't worry about this too much.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.19-rc4..v5.9-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-09-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.9-rc4-only.png)
