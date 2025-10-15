---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-11-15T07:10:36-08:00
lastmod: 2022-11-15T07:10:36-08:00
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

[PATCH] mm: Make drop_caches keep reclaiming on all nodes (Jan Kara)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20221115123255.12559-1-jack@suse.cz

`drop_caches` works in somewhat loop-until-no-progress manner.  It could result
in not so aggressive reclamation.  This patch makes it to continue reclamation
on other node until every node makes no progress.


[RFC][PATCH 0/4] cachestat: a new syscall for page cache state of files (Nha Pham)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221115182901.2755368-1-nphamcs@gmail.com

Users can know the cache state of files using `mincore()` system call, but it
scales bad for large files.  This patchset adds a new system call called
`cachestat()`, which reports the cache state statistics of a file.


[PATCH bpf-next v3 0/6] execmem_alloc for BPF programs (Song Liu)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20221117010621.1891711-1-song@kernel.org

This patchset improves `bpf_prog_pack` performance improvement from 0.6% to
0.8% using 512 4KiB pages instead of 1 2MiB pages.


[PATCH] mm/cgroup/reclaim: Fix dirty pages throttling on cgroup v1 (Aneesh Kumar K.V)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221118070603.84081-1-aneesh.kumar@linux.ibm.com

This commit makes cgroupv1 to do the reclaim throttling after flusher wakes up,
to allow the flusher be able to writeback quickly enough on large memory
systems.


Linux 6.1-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjKJyzfJmOzBdEOqCFRc8Fh-rdGM4tvMXfW0WXbbHwV0w@mail.gmail.com

rc5 was bigger than usual, and the situation has not dramatically changed.  rc6
is also a bit larger than usual, though it doesn't look really scary, as it's
only mixed fixes spread around the subsystems.  Torvalds didn't decide to have
rc8 yet.  He says he will gonna see what will happen, at the moment.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc6..v6.1-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-11-21 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.1-rc6-only.png)
