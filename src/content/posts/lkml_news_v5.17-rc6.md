---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-02-22T07:25:14+01:00
lastmod: 2022-02-22T07:25:14+01:00
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

[PATCH -V13 0/3] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220221084529.1052339-1-ying.huang@intel.com

The AutoNUMA patchset for tiered memory system has revised again.


[LSF/MM/BPF TOPIC] page table reclaim (David Hildenbrand)
---------------------------------------------------------

https://lkml.kernel.org/r/7b908208-02f8-6fde-4dfc-13d5e00310a6@redhat.com

Some workloads allocates a lot of page tables.  As page tables are unmovable
and unreclaimable, this can contribute to memory pressure.  David is proposing
making it reclaimable and suggesting discussion in LSF/MM/BPF summit for the
idea.


[RFC PATCH 00/47] Address Space Isolation for KVM (Junaid Shahid)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20220223052223.1202152-1-junaids@google.com

This patch presents the idea and possible implementation of address space
isolation, which is a comprehensive security mitigation for several types of
speculative execution attacks.


mmotm 2022-02-23-21-20 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220224052137.BFB10C340E9@smtp.kernel.org

mmotm updated.  It's rebased on 5.17-rc5, added 109 new patches, modified 87
patches, and dropped 66 patches.  In total, 386 patches are in the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220225191021.f71538a3f43dc448110e88b6@linux-foundation.org

Andrew sent 12 patches to Linus Torvads for more fixes.


[REMINDER] LSF/MM/BPF: 2022: Call for Proposals (Josef Bacik)
-------------------------------------------------------------

https://lkml.kernel.org/r/YherWymi1E/hP/sS@localhost.localdomain

A reminder including a few updates on COVID related restrictions and virtual
components for the LSF/MM/BPF of this year.

mmotm 2022-02-24-22-38 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220225063927.29B1CC340E7@smtp.kernel.org

mmotm has updsated.  It adds 4 more patches, modifies 8 patches, and drops 12
patches.  378 patches in total.


Linux 5.17-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjWKEQUG2Z5a=2FGUfO5+choQ0jhszqyDmHfZoTXVJYJQ@mail.gmail.com

Linus released the sixth candidate for Linux 5.17.  He notes that the last week
wasn't normal, due to the Putin's meantal breakdown.  But, it didn't affected
kernel much, so the things continue to look normal.  However, some regressions
which reported right after rc1 is still not fixed.  Torvalds is asking the
subsystem maintainers to make priority.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc5..v5.17-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-02-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc6-only.png)
