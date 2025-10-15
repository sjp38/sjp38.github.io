---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-02-27T06:37:30-08:00
lastmod: 2024-02-27T06:37:30-08:00
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

[PATCH 1/1] mm/madvise: enhance lazyfreeing with mTHP in madvise_free (Lance Yang)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240225123215.86503-1-ioworker0@gmail.com

Lance improves `madvise_free_pte_range()` to handle large folios that smaller
than PMD-size and optimizes lazy-free of PTE-mapped smaller than PMD-size THPs
using this patch.


[RFC PATCH] mm: Add reclaim type to memory.reclaim (Yafang Shao)
----------------------------------------------------------------

https://lkml.kernel.org/r/20240225114204.50459-1-laoar.shao@gmail.com

This RFC patch extends `memory.reclaim` memcg file to receive type of memory to
reclaim.  It supports pagecache only, slabs only, and both.


[LSF/MM/BPF TOPIC] mm/mempolicy extentions for heterogeneous memory systems (Gregory Price)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/Zd2PFXSzYuMMxiQj@memverge.com

Gregory proposes an LSFMM topic for discussion of `mm/mempolicy` extension
ideas and ongoing works for efficient management of heterogeneous memory such
as CXL based ones.


[RFC PATCH v2 0/7] DAMON based 2-tier memory management for CXL memory (Honggyu Kim)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240226140555.1615-1-honggyu.kim@sk.com

Honggyu revised their patchset for extending DAMOS to support
promotion/demotion for their heterogeneous memory SDK.  They argue the
DAMON-based approach improves performance about 15-17% to 4-5% compared to the
default memory policy.


[LSF/MM/BPF TOPIC] untorn buffered writes (Theodore Ts'o)
---------------------------------------------------------

https://lkml.kernel.org/r/20240228061257.GA106651@mit.edu

Ted propose an LSF/MM topic for discussing the best interface as buffered,
untorn writes and what would be needed for the support.


[GIT PULL] hotfixes for 6.8-rc7 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240227145619.40b2f9b33dc2723df27f68c0@linux-foundation.org

Andrw sent hotfixes for Linux v6.8-rc7.


[LSF/MM/BPF TOPIC] Reclamation interactions with RCU (Paul E. McKenney)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/c6321dd1-ec0e-4fed-87cc-50d297d2be30@paulmck-laptop

Paul proposes an LSFMM topic for discussing mutual understanding between memory
reclaim and RCU.


[LSF/MM/BPF TOPIC] Sharing page tables across processes (mshare) (Khalid Aziz)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/ac4411f4-5faa-4df7-8d19-b2f62e10e0c9@oracle.com

Sharing pages among processes cannot get the advantage of sharing pages among
threds, since the amount of memory consumed by page tables can exceed the size
of the share data.  Khalid sent proposals and patches for this problem that
allows sharing page tables among processes, and proposes an LSFMM topic for
further discussions.


[LSF/MM/BPF TOPIC] Address Space Isolation (Brendan Jackman)
------------------------------------------------------------

https://lkml.kernel.org/r/CA+i-1C169s8pyqZDx+iSnFmftmGfssdQA29+pYm-gqySAYWgpg@mail.gmail.com

Brendan proposes an LSFMM topic for sharing progress of address space
isolation, which helps protecting sensitive data from CPU vulnerabilities, and
discuss chanllenges.


[PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing (Helen Koike)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240228225527.1052240-1-helen.koike@collabora.com

Helen posted this patchset for making kernel CI without any need for specific
infrastructure.  A demo [video](https://www.youtube.com/watch?v=TWiTjhjOuzg)
and rendered
[documentation](https://koike.pages.collabora.com/-/linux/-/jobs/298498/artifacts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html)
are available.


[LSF/MM/BPF TOPIC] Swap Abstraction "the pony" (Chris Li)
---------------------------------------------------------

https://lkml.kernel.org/r/CAF8kJuMQ7qBZqdHHS52jRyA-ETTfHnPv+V9ChaBsJ_q_G801Lw@mail.gmail.com

Chris suggests a continued discussion of VFS-like swap system as yet another
LSFMM topic.  It aims to re-architect the whole swap backend from the scratch.


[LSF/MM/BPF TOPIC] TAO: THP Allocator Optimizations (Yu Zhao)
-------------------------------------------------------------

https://lkml.kernel.org/r/20240229183436.4110845-1-yuzhao@google.com

Yu proposes yet another LSFMM topic for THP improvement with a patchset.  It
introduces THP zones, shattering of THP, and `struct page` optimization for THP
which resembles that of HugeTLB.


[PATCH v2] mm/vmstat: Add order's information for extfrag_index and unusable_index (Hao Ge)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240229141443.99408-1-gehao@kylinos.cn

Hao posted a patch for adding order information to `extfrag/extfrag_index`
under the debugfs for better understanding of the situation.


Linux 6.8-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgwt9b3yMxAQRCVJ0Jh6-4Dz1Fgo2au7g_U9VWVxXoS6Q@mail.gmail.com

The seventh release candidate for 6.8-rc7 is released.  The week was pretty
calm, as much as Linus wanted.  Linus therefore says we'll have the final 6.8
next weekend unless some bad surprosies happen.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-03-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc7-only.png)
