---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.7-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-10-31T07:04:49-07:00
lastmod: 2023-10-31T07:04:49-07:00
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

NUMA + THP test suites? (John Hubbard)
--------------------------------------

https://lkml.kernel.org/r/21812f89-c1a0-4ca0-9f73-54f20c4d29ef@nvidia.com

John asks tets suite for NUMA and THP that can be useful for testing patches
for the topics.


[PATCH v4 0/1] mm: report per-page metadata information (Sourav Panda)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20231031223846.827173-1-souravpanda@google.com

This patch adds per-node and global page metadata information to sysfs and
procfs, to let users know how much memory is being used by the metadata.


[GIT PULL] MM updates for 6.7-rc1 (Andrew Morton)
-------------------------------------------------

https://lkml.kernel.org/r/20231101145447.60320c9044e7db4dba2d93e3@linux-foundation.org

Andrew sent memory management subsystem pull request for Linux v6.7-rc1 to
Linus Torvalds.


[GIT PULL] Non MM updates for 6.8-rc1 (Andrew Morton)
-----------------------------------------------------

https://lkml.kernel.org/r/20231102143341.9e83402cf087ba82e2b4760c@linux-foundation.org

Andrew sent non-mm updates for v6.7-rc1 to Torvalds.  The subject should be a
typo ;)


[PATCH V2 0/3] mm: page_alloc: fixes for early oom kills (Charan Teja Kalla)
----------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1699104759.git.quic_charante@quicinc.com

Charan found early OOM issue and made fixes.


[GIT PULL] memblock update for v6.7 (Mike Rapoport)
---------------------------------------------------

https://lkml.kernel.org/r/20231106183258.GP2824@kernel.org

Mike sent memblock pull request to Linus Torvalds.  Not a big pull request with
one commit.


[RFC PATCH 00/86] Make the kernel preemptible (Ankur Arora)
-----------------------------------------------------------

https://lkml.kernel.org/r/20231107215742.363031-1-ankur.a.arora@oracle.com

This huge RFC patchset tries to make kernel's two preemption models (voluntary
vs full, a.k.a RT) unified.


Shrinking struct page progress (Matthew Wilcox)
-----------------------------------------------

https://lkml.kernel.org/r/ZUvdrzFdD8ZHF/mP@casper.infradead.org

Matthew shares a patch the allows `make allnoconfig` without `page->index` and
`page->mapping`.


[PATCH v2 0/7] mm: remove page idle and young wrapper (Kefeng Wang)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20231110033324.2455523-1-wangkefeng.wang@huawei.com

This patchset converts use of page idle/young functions with those for filio.


Linux 6.7-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whuO0zmuxp_yorYFWdcrALpqjRPhWkmEy+7wcCnnDcPNA@mail.gmail.com

The first candidate for v6.7 Linux kernel is released after the two weeks of
merge window.  The window was the biggiest one of the git history, in terms of
the number of commits.  The bcachefs merge, which included whole history of the
development, also committed to the big changes, but even without it, this merge
window was the biggest one.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.16-rc3..v6.7-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-11-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v6.7-rc1-only.png)
