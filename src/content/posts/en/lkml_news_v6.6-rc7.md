---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-10-17T06:51:28-07:00
lastmod: 2023-10-17T06:51:28-07:00
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

[PATCH] x86/mm: drop 4MB restriction on minimal NUMA node size (Mike Rapoport)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231017062215.171670-1-rppt@kernel.org

Kernel can panic when less than 4MB NUMA node is configured.  The commit which
introduced the 4MB limit doesn't clearly explain the reason.  This patch drops
the limit.


[Invitation] Linux MM Alignment Session on Small-sized THPs on Wednesday (David Rientjes)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/76c2f454-5ab2-61db-a41f-a30f08a4aa1e@google.com

The next MM alignment session sill be lead by Ryan Roberts from ARM, for
small-sized THP.


[RFC PATCH v2 0/8] Introduce mseal() syscall (Jeff Xu)
------------------------------------------------------

https://lkml.kernel.org/r/20231017090815.1067790-1-jeffxu@chromium.org

A proposal of new system call for memory sealing, which protects mapping itself
against modifications.  The author explains this could be useful for mitigating
memory corruption issues.


[RFC PATCH v1] mm: zswap: Store large folios without splitting (Ryan Roberts)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20231019110543.3284654-1-ryan.roberts@arm.com

Zswap support only order zero pages.  This RFC patch make it allows large
folios.


[GIT PULL] slab fixes for 6.6-rc6 (Vlastimil Babka)
---------------------------------------------------

https://lkml.kernel.org/r/06eb77e9-a058-6b0d-d0f6-2f4733e6ca00@suse.cz

Vlastimil sends one more slab hotfix for v6.6 to Linus Torvalds.


Linux 6.6-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whqsbGgnoeYeEuP9fabaZrpPDA=SySMBe3TfQQqVMHvBA@mail.gmail.com

Things continue to look normal, though the rc7 is bigger than Torvalds wanted
to be.  Above the rc7 of 6.x kernels, only 6.1 was having a bigger rc7 than
this, and it had rc8.  Linus says he will release 6.6 anyway if next week is
quiet and normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15..v6.6-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-10-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.6-rc7-only.png)
