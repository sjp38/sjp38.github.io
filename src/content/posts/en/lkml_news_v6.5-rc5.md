---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-08-01T06:57:11-07:00
lastmod: 2023-08-01T06:57:11-07:00
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

[PATCH] MAINTAINERS: Add maple tree mailing list (Liam R. Howlett)
------------------------------------------------------------------

https://lkml.kernel.org/r/20230731175542.1653200-1-Liam.Howlett@oracle.com

Maple tree has its own development mailing list at `infradead.org`.  This patch
adds it on the MAINTAINERS file.


Maple Tree Work 2023/08 (Laim R. Howlett)
-----------------------------------------

https://lkml.kernel.org/r/20230801194820.alch3ot7pvrgig5v@revolver

Liam shares monthlee update of maple tree work progress and todo for avoid
conflict.


[RFC PATCH 0/2] vmrd: dynamic guest VM memory resizing daemon (Sudarshan Rajagopalan)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1690836010.git.quic_sudaraja@quicinc.com

Sudarshan posted an RFC for dynamic guest VM memory resizing based on the
guest's memory demand.


[PATCHSET 0/3] xfs: maintainer transition for 6.6 (Darrick J. Wong)
-------------------------------------------------------------------

https://lkml.kernel.org/r/169091989589.112530.11294854598557805230.stgit@frogsfrogsfrogs/

XFS maintainer, Darrick, steps down from XFS maintainer.  He summarizes the
reason of the decision, document details about XFS maintainership, and
nominates next maintainer for the filesystem.


[PATCH v6 00/38] New page table range API (Matthew Wilcox)
----------------------------------------------------------

https://lkml.kernel.org/r/20230802151406.3735276-1-willy@infradead.org

This patchset changes the page table entries setup APIs, namely `set_ptes()`,
`update_mmu_cache_range()`, `flush_dcache_folio()`, and `flush_icache_pages()`.


[PATCH v3 0/6] make vma locking more obvious (Suren Baghdasaryan)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20230803172652.2849981-1-surenb@google.com

Suren found vma locking improvements with Linus and Jann during the recnet vma
locking patch, and sent a patch.


Linux 6.5-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whaG-mWjWphLJ6C-fGU9gRHLpMrTt2caCcjX4nDpQA6vg@mail.gmail.com

The fifth release candidate for Linux v6.5 continues looking pretty normal.
Other than data race annotation in networking and a couple of network drivers,
most patches are small enough.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc6..v6.5-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-08-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.5-rc5-only.png)
