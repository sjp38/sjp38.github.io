---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-02-01T07:26:46+01:00
lastmod: 2022-02-01T07:26:46+01:00
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

[PATCH] selftests: kselftest framework: Provide "finished" helper (Kees Cook)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20220201013717.2464392-1-keescook@chromium.org

Users who want to use `ksft_exit()` need to figure out the internals of
kselftest.  This commit adds a helper function for that purpose, namely,
`ksft_finished()`.


[LSF/MM/BPF TOPIC] Handling of VMAs (Liam Howlett)
--------------------------------------------------

https://lkml.kernel.org/r/20220201150521.owa5axfsmpdvc7uo@revolver

Liam is pointing out the VMAs are quite complicately managed with their cache,
tree, linked list, and even reverse mapping.  As it now shows its limit with
the lock contention and complexity of the handling code, he wants to propose a
simpler new way for their management.


[LSF/MM/BPF TOPIC] The Maple Tree (Liam Howlett)
------------------------------------------------

https://lkml.kernel.org/r/20220201150633.jtlwrqfnh4xbhw2f@revolver

Maple tree is a RCU-safe range-based B-tree, which is designed to be used for
better VMAs management.  He proposes to discuss about how it could be used for
many complicated scenarios.


[LSF/MM/BPF TOPIC] mm documentation (Mike Rapoport)
---------------------------------------------------

https://lkml.kernel.org/r/YfmD9Pa92xousy5b@kernel.org

Mike Rapoport proposes to discuss how we can improve the mm documentation,
which is not so up to date for now.


[LSF/MM/BPF TOPIC] Consolidating representations of the physical memory (Mike Rapoport)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/YfmEtd3vg/x7uqXx@kernel.org

Currently, the physical memory is represented using multiple structures
including `memblock`, `iomem_resource`, 'System Ram', per-architecture
structures.  As this makes code inconsistent and complex, Mike is proposing to
use single abstraction having [start, end, flags], namely memblock.  He is
proposing to discuss about this further in LSF/MM/BPF.


[LSF/MM/BPF TOPIC] Amortising direct map fragmentation (Mike Rapoport)
----------------------------------------------------------------------

https://lkml.kernel.org/r/YfmFMvNu9oNGryjv@kernel.org

Direct map fragmentation, which causes split of the PUD and PMD-sized mappings
in the direct map can lead to performance degradation.  Mike proposes to
discuss about how we can improve the situation in LSM/MM/BPF.


mmotm 2022-02-01-16-04 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220202000522.A3834C340EB@smtp.kernel.org

Andrew updated the mmotm.  It's rebased on 5.17-rc2, added 78 new patches,
modified 25 existing patches, and dropped 16 patches.  In total, 226 patches in
the queue.


[PATCH] mm/damon: Add option to monitor only writes (Pedro Demarchi Gomes)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20220203131237.298090-1-pedrodemargomes@gmail.com

Pedro is proposing write-only monitoring for DAMON.  It's using soft-dirty bits
on virtual address space monitoring primitive.


mmotm 2022-02-03-21-58 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220204055842.0D8D0C004E1@smtp.kernel.org

Andrew updated the mmotm.  It's still based on 5.17-rc2.  This time, it added
20 new patches, modified 50 existing patches, and dropped 4 patches.  In total,
242 patches in the queue.


Linux 5.17-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wiKr3q0ABWL0me+ugjN87zBOFXnBi43=-rBu7+WDKwQVA@mail.gmail.com

The third candidate for v5.17 release has out with normal shape.  Filesystem
might have unusual diff stat, but it's not due to single one problematic part.
Changes for drivers are still dominating the stat, though.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc2..v5.17-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-02-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc3-only.png)
