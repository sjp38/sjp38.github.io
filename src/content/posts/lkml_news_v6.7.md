---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-01-02T06:46:21-08:00
lastmod: 2024-01-02T06:46:21-08:00
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

[PATCH v3 0/7] hugetlb: parallelize hugetlb page init on boot (Gang Li)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20240102131249.76622-1-gang.li@linux.dev

The thrid version of hugetlb initialization prallelization patchset has posted.


[PATCH v3 00/11] Mitigate a vmap lock contention v3 (Uladzislau Rezki)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20240102184633.748113-1-urezki@gmail.com

Third version of `vmap lock` contention mitigation patch has posted.


[PATCH v6 0/2] Add swappiness argument to memory.reclaim (Dan Schatzberg)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20240103164841.2800183-1-schatzberg.dan@gmail.com

Sixth version of the patchset for letting `memory.reclaim` memcg file be used
with swappiness argument has posted.  Seems this version has merged into the mm
tree.


[LSF/MM/BPF TOPIC] Removing GFP_NOFS (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/ZZcgXI46AinlcBDP@casper.infradead.org

Matthew suggests an LSFMM topic for filesystem track.  He argues all the
related works for mm side is done, and its' the fs side turn.


[GIT PULL] slab updates for 6.8 (Vlastimil Babka)
-------------------------------------------------

https://lkml.kernel.org/r/a0511a72-711b-4c8f-b9d7-da95681000c1@suse.cz

Vlastimil sent the slab pull request for v6.8.  This includes the removal of
SLAB.


[GIT PULL] hotfixes for 6.8 (Andrew Morton)
-------------------------------------------

https://lkml.kernel.org/r/20240105114314.820c25628928c57f639058fe@linux-foundation.org

Andrew sent yet another hotfix pull request to Linus Torvalds.


Linux 6.7 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=widprp4XoHUcsDe7e16YZjLYJWra-dK0hE1MnfPMf6C3Q@mail.gmail.com

After the rc8 week, Linus released the v6.7 of Linux kernel.  It is the biggest
one of the history.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-01-08 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

