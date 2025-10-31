---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.8-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-01-23T06:43:17-08:00
lastmod: 2024-01-23T06:43:17-08:00
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

Project: Improving the PCP allocator (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/Za6RXtSE_TSdrRm_@casper.infradead.org

Matthew introduces an idea to improve the PCP allocator, roughly saying,
keeping only compound memory on the PCP list.


[PATCH v2 0/3] Enable >0 order folio memory compaction (Zi Yan)
---------------------------------------------------------------

https://lkml.kernel.org/r/20240123034636.1095672-1-zi.yan@sent.com

Zi enables larger than zero order folio compaction, which is the prerequisite
for large folio support.


[PATCH v2 1/3] mm: make vm_area_struct anon_name field RCU-safe (Suren Baghdasaryan)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240123231014.3801041-1-surenb@google.com

For lockless `/proc/pid/maps` reads, this patch makes `anon_name` field of
`vm_area_struct`, which is the only one field that need to be accessed for
reading the file but not RCU-protected, to be protected by RCU.


[PATCH 0/3] Memory management patches needed by Rust Binder (Alice Ryhl)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20240124-alice-mm-v1-0-d1abcec83c44@google.com

Alice sent patches for making abstractions that needed by the Rust
implementtion of the Binder driver.


[LSF/MM TOPIC] Making pseudo file systems inodes/dentries more like normal file system (Steven Rostedt)
-------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240125104822.04a5ad44@gandalf.local.home

Steven Rostedt proposes an LSFMM topic about a new pseudo file system called
eventfs, which aims to be used for not only tracefs but also something like
debugfs.


[RFC] Memory tiering kernel alignment (David Rientjes)
------------------------------------------------------

https://lkml.kernel.org/r/75f21150-1e12-4f4b-e578-e170e4fea18b@google.com

David asks people if they are interested in having a workgroup for Linux
kernel's tiered memory management support.


[LSF/MM/BPF TOPIC] MM: Mapcount Madness (David Hildenbrand)
-----------------------------------------------------------

https://lkml.kernel.org/r/049e4674-44b6-4675-b53b-62e11481a7ce@redhat.com

David Hildenbrand proposes an LSFMM topic for discussing about folio mapcount
area ongoing works.


[LSF/MM/BPF TOPIC] Memory allocation profiling (Suren Baghdasaryan)
-------------------------------------------------------------------

https://lkml.kernel.org/r/CAJuCfpGixJHag+71RZzzTHKC2ra4DpRZMozpxujegFVamJUOGA@mail.gmail.com

Suren proposes an LSFMM topic for discussing the process and new requirements
for memory allocation profiling, which second version of the patchset is
available and currently working on compiler supports which discussed at LPC
2023.


Linux 6.8-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com

Linus Torvalds releases the second release candidate for Linux v6.8.  It
contains fixes for small annoying issues in rc1 including amdgpu scheduling
hang issue and zstd compression related btrfs bug.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.8-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2022-01-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/linux_stat_v6.8-rc2-only.png)
