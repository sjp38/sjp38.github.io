---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-06-08T06:53:48+02:00
lastmod: 2021-06-08T06:53:48+02:00
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

[RFC PATCH V3] zram:calculate available memory when zram is used (wangyong)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/1623080354-21453-1-git-send-email-yongw.pur@gmail.com

This patchset adds a new entry called ``SwapAvailable`` in ``/proc/meminfo``.
It shows the memory savings when swap devices are used.  If zram is used, it
considers the compression ratio.


[PATCH v3 0/9] Remove DISCONTIGMEM memory model (Mike Rapoport)
---------------------------------------------------------------

https://lkml.kernel.org/r/20210608091316.3622-1-rppt@kernel.org

This patchset removes DISCONTIGMEM memory model, finally.  There are no more
architectures requiring it.


[LSF/MM/BPF TOPIC] Consolidating representations of the physical memory (Mike Rapoport)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/YMBxeYHBY55Ddkpr@kernel.org

Mike says the physical memory layout is quite simple but the kernel has so many
inconsistent structures for representation of it.  He suggests to use memblock
as the basis for the abstraction and discuss about this in the LSF/MM/BPF.


Re: Maintainers / Kernel Summit 2021 planning kick-off (Linus Torvalds)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/CAHk-=wiB6FJknDC5PMfpkg4gZrbSuC3d391VyReM4Wb0+JYXXA@mail.gmail.com

The maintainers/kernel summit 2021 was initially planned to be held in person,
but it changed to be held fully in virtual a few months ago, obviously due to
the COVID19.  Because the vaccination is going well, there were some
discussions regarding changing the decision or adjusting the plan somehow.  In
the thread, Enrico spoke about his negative opinion regarding the vaccination,
and Torvalds replied to him in this email.  Torvalds explains how vaccines
work, especially for mRNA vaccines, and ask people to be vaccinated to protect
their family and neighbors.  For someone insist on believing what anti-vax
says, he asks to at least 'SHUT THE HELL UP' on LKML.


[LSF/MM/BPF TOPIC] Improving alloc_contig_range() (David Hildenbrand)
---------------------------------------------------------------------

https://lkml.kernel.org/r/c8e21ac4-ace7-3176-8782-535bd6590583@redhat.com

David proposes to discuss about `alloc_contig_range()` for `ZONE_NORMAL`, for
problems of `MAX_ORDER`, slab shrinking, PCP handling, etc.


Idle THPs (Matthew Wilcox)
--------------------------

https://lkml.kernel.org/r/YMGKVmt8trMJ9kOP@casper.infradead.org

While working for the memory folio, Matthew found all tail pages would not set
as Idle.  He is asking if this is intended behavior.


[PATCH] mm: Mark idle page tracking as BROKEN (Matthew Wilcox)
--------------------------------------------------------------

https://lkml.kernel.org/r/20210612000714.775825-1-willy@infradead.org

As a followup of the Idle THPs question, Matthew and some MM developers
concluded it is not working as expected, and trying to remove that entirely.
As a first step, they are trying to mark it as `BROKEN`.  As an alternative, he
suggests userfaultfd like mechanisms.


Linux 5.13-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wi9so00V0_ZVBP8oSZpowoWu5VKKTswGz=nuYTpWkkqQA@mail.gmail.com

Nothing special in this release.  No scary reports Torvalds received, the size
is just as usual for this stage, and the diffstat looks good.  Torvalds says we
would have 5.13 in timely manner if this trend continues.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc6..v5.13-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-06-14 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc6-only.png)
