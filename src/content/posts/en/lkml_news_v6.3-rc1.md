---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-02-21T07:32:00-08:00
lastmod: 2023-02-21T07:32:00-08:00
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

[GIT PULL] MM updates for 6.3-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20230220135225.91b0f28344c01d5306c31230@linux-foundation.org

The mm updates pull request for v6.3-rc1 has posted by Andrew.


[GIT PULL] Compute Express Link (CXL) for 6.3 (Dan Williams)
------------------------------------------------------------

https://lkml.kernel.org/r/63f5a4e2277b1_c94229453@dwillia2-mobl3.amr.corp.intel.com.notmuch

A pull request for makincg CXL handling including CXL memory layout
parsing/updating and events/errors reporting has posted for v6.3.  Without this
patchset, currently the works are dependents on platform-firmware.


[RFC v2 0/5] tmpfs: add the option to disable swap (Luis Chamberlain)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20230223024412.3522465-1-mcgrof@kernel.org

This RFC adds noswap option to tmpfs.


[LSF/MM/BPF TOPIC] VM Memory Overcommit (T.J. Alumbaugh)
--------------------------------------------------------

https://lkml.kernel.org/r/CABmGT5H6t_agW=yY1U78tsV+chLoRf2=mcSc8GCYUD25PbxahQ@mail.gmail.com

Yet another proposal for memory overcommitted virtual machines systems has
posted.  T.J proposes host-side efficient access tracking of guests' memory for
host-guests independent case, and guest working set size notification mechanism
and ballooning improvement for host-guest cooperate case.


[LSF/MM/BPF TOPIC] Make bpf memory allocator more robust (Hou Tao)
------------------------------------------------------------------

https://lkml.kernel.org/r/2d29f66f-fcb1-ec76-c74f-d12495a9516f@huaweicloud.com

BPF memory allocator has introduced by Alexei Starovoitov in v6.1, but it has
some problems.  This LSF/MM/BPF topic proposal is for discussing it's
improvements.


[PATCH v4 00/33] Per-VMA locks (Suren Baghdasaryan)
---------------------------------------------------

https://lkml.kernel.org/r/20230227173632.3292573-1-surenb@google.com

Fourth version of the per-VMA locks patchset, which supposed to improve the vma
locking scalability, has posted.


LSFMMBPF proposal [MM]: Eliminate vmap/vmalloc lock contention (Uladzislau Rezki)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/Y/4vA1xdagP5UFVI@pc636

An LSF/MM/BPF topic proposal for improving vmap multi-CPU scalability, which is
currently limited by use of single spinlock, has posted.


[LSF/MM/BPF TOPIC] Cloud storage optimizations (Theodore Ts'o)
--------------------------------------------------------------

https://lkml.kernel.org/r/Y/7L74P6jSWwOvWt@mit.edu

Ted proposes a LSF/MM/BPF topic for cloud storage optimizations, such as giving
some useful hint for cloud storage to kernel.


[PATCH 1/1] psi: remove 500ms min window size limitation for triggers (Suren Baghdasaryan)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230301193403.1507484-1-surenb@google.com

Current PSI limits polling interval to 50ms for preventing too much cpu time is
used by too frequent polling.  This patchset tries to limit psi trigger
creation instead of limiting psi events latency.


[PATCHv3 0/4] zsmalloc: fine-grained fullness and new compaction algorithm (Sergey Senozhatsky)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230303073130.1950714-1-senozhatsky@chromium.org

This patchset reworks zsmalloc fullness grouping and classification for optimal
page selection.


Linux 6.3-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgr1D8hb75Z+nn+4LXUnosp0HM+gP+YJEcEav1DgTC=Cw@mail.gmail.com

After the two weeks of the merge window, first release candidate for v6.3 has
released.  The merge window was fairly nice and normal, as usual, Linus says.


Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc3..v6.3-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-03-06 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.3-rc1-only.png)
