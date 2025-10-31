---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-04-02T06:37:44-07:00
lastmod: 2024-04-02T06:37:44-07:00
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

[PATCH v3 0/7] mm/kvm: Improve parallelism for access bit harvesting (James Houghton)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240401232946.1837665-1-jthoughton@google.com

James posted the third version of the patchset for adding KVM's
test-and-clear-access-bits fast path that doesn't take `mmu_lock`.  It is RFC
because the author wants to do more performance tests, and unusre if the arm64
part is correct.


[PATCH] mm, mmap: remove vma_merge() (Vlastimil Babka)
------------------------------------------------------

https://lkml.kernel.org/r/20240401192623.18575-2-vbabka@suse.cz

After the successful removal of SLAB, Vlastimil suggests to remove
`vma_merge()`.  But the patch has sent on 2024-04-01 :)


[PATCH v3] mm: add per-order mTHP alloc_success and alloc_fail counters (Barry Song)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240403035502.71356-1-21cnbao@gmail.com

This patch sets up the framework for per-order mTHP allocation success/fail
counters, which could help profiling system.


[PATCH v4 0/4] Memory management patches needed by Rust Binder (Alice Ryhl)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20240404-alice-mm-v4-0-49a84242cf02@google.com

Alice sent the fourth version of the patchset for making changes in memory
mangement subsystem that needed by Rust-written Binder.


Linux choosing to swap despite having 250G of file memory available (Frits Hoogland)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/C55D835F-1412-4FB2-AA3B-70425E270D0F@gmail.com

Frits asks a question about the linux' behavior that they don't understand.


[RFC PATCH v3 0/7] DAMON based tiered memory management for CXL memory (Honggyu Kim)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240405060858.2818-1-honggyu.kim@sk.com

Honggyu sent the third RFC patchset for DAMON-based tiered memory management.


More annoying code generation by clang (Linus Torvalds)
-------------------------------------------------------

https://lkml.kernel.org/all/CAHk-=whHWjKK1TOMT1XvxFj8e-_uctJnXPxM=SyWHmW63B_EDw@mail.gmail.com/

Linus Torvalds shares his thought on clang's annoying code generation behavior.


[PATCH 1/1] mm: change inlined allocation helpers to account at the call site (Suren Baghdasaryan)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240404165404.3805498-1-surenb@google.com

Suren posted a patch to make the memory allocation profiling accounts call
sites of inlined functions instead of the functions themselves.


[RFC PATCH v3 0/7] DAMON based tiered memory management for CXL memory (Honggyu Kim)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240405060858.2818-1-honggyu.kim@sk.com

Honggyu posted the third version of DAMON-based tiered memory management
patchset.


[GIT PULL] hotfixes for 6.9-rc3 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240405114018.48d320803e1b3920f68f9f96@linux-foundation.org

Andrew sent hotfixes pull request to Linus Torvalds.


Linux 6.9-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whDuqyVC6xMkOnNt2EeTd-s4uqa3sYghj5UzkELFW2bpw@mail.gmail.com

Linus Torvalds released the third candidate for Linux v6.9-rc3.  This is not
usual as it has many fixes for bcachefs.  Linus says it is not weird since
bcachefs is definitely not stable for now.  Hence he concludes this is not
really all that big.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ relstat.py --since 2022-04-08 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.9-rc3-only.png)
