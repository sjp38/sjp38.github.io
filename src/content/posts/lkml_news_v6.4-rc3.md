---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-05-16T07:02:19-07:00
lastmod: 2023-05-16T07:02:19-07:00
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

[PATCH v3 00/11] Introduce cmpxchg128() -- aka. the demise of cmpxchg_double() (Peter Zijlstra)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230515075659.118447996@infradead.org

This patchset introduces an alternative for `cmpxchg_double()`, namely
`cmpxchg128()`, and replace the old usages of `cmpxchg_double()`.  This is
because Linus hates `cmpxchg_double()`[1].

[1] https://lore.kernel.org/all/Y2U3WdU61FvYlpUh@hirez.programming.kicks-ass.net/T/#u


[PATCH 0/6] Memory Mapping (VMA) protection using PKU - set 1 (Jeff Xu)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230515130553.2311248-1-jeffxu@chromium.org


[Invitation] Linux MM Alignment Session on Code Tagging on Wednesday (David Rientjes)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAE-26VDomF_pZybGjgCBJZuWusX0z3MTEJmkwtuQXx3PyrN6fw@mail.gmail.com

Google is hosting Linux MM alignment session.  This time, the Code Tagging will
be discussed, as a continuation of the LSF/MM/BPF session.


[PATCH v2 0/5] Encapsulate PTE contents from non-arch code (Ryan Roberts)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20230518110727.2106156-1-ryan.roberts@arm.com

Ryuan posted the second version of his patchset that improves encapsulation of
pte entries from non-architecture dependent code that directry dereferencing
`pte_t` pointers.


[GIT PULL] hotfixes for 6.4-rc2 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230518155606.326cc8a860382d3a08cf5e21@linux-foundation.org

Andrew sent hotfixes pull request to Linus Torvalds.


Linux 6.4-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgL4Sa64qUZkpAs06t9UKoNyAYqBpzmukefJz8P8sa2=Q@mail.gmail.com

After another week, another release candidate for Linux v6.4 has released.  No
huge change but just usual fixes for vairous subsystems are included.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc4..v6.4-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-05-22 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.4-rc3-only.png)
