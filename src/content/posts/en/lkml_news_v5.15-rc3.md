---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-09-20T07:48:48+02:00
lastmod: 2021-09-20T07:48:48+02:00
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

[RFC PATCH] Introducing lockless cache built on top of slab allocator (Hyeonggon Yoo)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210919164239.49905-1-42.hyeyoo@gmail.com

The block layer now has a lockless cache, which increased its IOPS.  This RFC
generalizes it so that it can be used in some other area, such as NAPI.


[PATCH v5 0/3] virtio-mem: disallow mapping virtio-mem memory via /dev/mem (David Hildenbrand)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210920142856.17758-1-david@redhat.com

This patchset makes a basic infrastructure to exclude some physical memory
regions that marked as `IORESOURCE_SYSTEM_RAM` from `/dev/mem` access, even
though they are not marked as `IORESOURCE_BUSY`.


BoF at LPC: Documenting the Heterogeneous Memory Model Architecture (Felix Kuehling)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com

A BoF session for documentation of heterogeneous memory model, which let memory
of GPU-like accelerators aggregated with system RAM, is proposed.


mmotm 2021-09-21-16-54 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210921235437.zcAiZPmxd%akpm@linux-foundation.org

MMOTM updated.  0 patch dropped, 30 patches added, and 13 patches modified.


Struct page proposal (Ken Overstreet)
-------------------------------------

https://lkml.kernel.org/r/YUvWm6G16+ib+Wnb@moria.home.lan

In this mail, Ken describes one common point from Matthew and Johannes in the
Folios discussion, and proposes new `struct page`.  It contains only two
pointers, so the memory overhead for `struct page` objects becomes only 0.4%.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210924154257.1dbf6699ab8d88c0460f924f@linux-foundation.org

Pull request from Andrew Morton for various fixes.


[PATCH 0/2] mm/mprotect: avoid unnecessary TLB flushes (Nadav Amit)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20210925205423.168858-1-namit@vmware.com

Memory-unprotect using usefaultfd (i.e., userfaultfd IOCTL) triggers a TLB
flush even though no architectural data but only a software flag is updated.
This patchset tries to solve the issue by not tailoring the specific scenario
but consolidating the interfaces for TLB batching.  This patchset is based on
an old RFC.

Linux 5.15-rc3 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgoE8XBPVA6Mu4CygxX9TE0FgWaAsVUJOe8KQH-CzEcAA@mail.gmail.com

Partly because of the `Werror` change, 5.15 rc2 was not so calm.  Now seems the
things wound down and it became normal, Torvalds says.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc2..v5.15-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-09-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.15-rc3-only.png)
