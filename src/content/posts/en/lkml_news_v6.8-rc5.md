---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-02-13T06:36:48-08:00
lastmod: 2024-02-13T06:36:48-08:00
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

[PATCH v3] cgroup2: New memory.max.effective like cgroup1 hierarchical_memory_limit (Jan Kratochvil)
----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/ZctiM5RintD_D0Lt@host1.jankratochvil.net

Unlike cgroup v1, which was able to find effective memory limit using
`hierarchical_memorylimit` and `hierarchical_memsw_limit` lines, cgoup v2
doesn't have such hierarchical information, so need to read all files in the
hierarchy to know the effective memory limit.  This patchset adds
`memory.max.effective` and `memory.swap.max.effective` to let users easily get
the information.


[PATCH v3 00/35] Memory allocation profiling (Suren Baghdasaryan)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20240212213922.783301-1-surenb@google.com

Suren posted the third and final version of the memory allocation profiling
patchset.  He says they aim to get this version merged in for v6.9.


[GIT PULL] hotfixes for 6.8-rc4 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20240210112006.05781090736edc6e02de7e19@linux-foundation.org

Andrew Morton posted hotfixes for 6.8-rc4 to Linus Torvalds.


[PATCH] mm: document memalloc_noreclaim_save() and memalloc_pin_save() (Vlastimil Babka)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240212182950.32730-2-vbabka@suse.cz

Vlastimil posted a patch for documentation of `memalloc_noreclaim_save()` and
`memalloc_pin_save()`.  Especially to make it clear `memalloc_noreclaim_save()`
is not only for avoid reclamation but also need to be used only in contexts
where the allocation is for freeing memory.


[PATCH] kasan/test: avoid gcc warning for intentional overflow (Arnd Bergmann)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240212111609.869266-1-arnd@kernel.org

With gcc-14, KASAN's out-of-bound test could generate warning.  This patch hide
it.


[PATCH v5 0/3] Enable >0 order folio memory compaction (Zi Yan)
---------------------------------------------------------------

https://lkml.kernel.org/r/20240214220420.1229173-1-zi.yan@sent.com

Zi Yan posted fifth version of the >0 order folio memory compaction.  It allows
>0 order free pages be used for the compaction without beingsplit into order-0
and then post-allocation processed but directly being used.


[PATCH v1 00/14] Fast kernel headers: split linux/mm.h (Max Kellermann)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20240215145602.1371274-1-max.kellermann@ionos.com

Max posted this patchset that aims to clean up the `mm.h` file and reduce
dependencies on it.


Linux 6.8-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi8vZD7EXZfob-yhfDERyfzWxzMOzG9FsOuaKU-v6+PHA@mail.gmail.com

The fifth release candidate for Linux 6.8 is released.  It is a bit larger than
Torvalds hoped, but nothing stands out.  Also, this release candidate contains
the new CVE process documentation.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-02-19 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc5-only.png)
