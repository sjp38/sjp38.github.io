---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-04-23T06:37:58-07:00
lastmod: 2024-04-23T06:37:58-07:00
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

[RFC PATCH 0/5] add mTHP support for anonymous share pages (Baolin Wang)
------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1713755580.git.baolin.wang@linux.alibaba.com

Baolin adds mTHP support for anonymous shared pages with this RFC patchset.
There are some todo items, though.


[LSF/MM/BPF TOPIC] SLAB BOF (Matthew Wilcox)
--------------------------------------------

https://lkml.kernel.org/r/ZiZy2VVpTQMjN-ko@casper.infradead.org

In this mail, Matthew introduces his radical idea around Slab allocator, which
decouples the objects from the page and proposes a BoF to discuss it with not
only Vlastimil but more audiences.


[PATCH v14 00/22] Add AMD Secure Nested Paging (SEV-SNP) Hypervisor Support (Michael Roth)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20240421180122.1650812-1-michael.roth@amd.com

Michael posted the fourteenth version of the SEV-SNP hypervisor support
patchset.


[PATCH 0/2] mm: introduce per-order mTHP split counters (Lance Yang)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20240424135148.30422-1-ioworker0@gmail.com

THP split statistics is not including PTE-mappted mTHP.  This patchset hence
introduces per-ordr mTHP split counters.


[PATCH 0/4] Improve anon_vma scalability for anon VMAs (Matthew Wilcox)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20240426144506.1290619-1-willy@infradead.org

Matthew posted a patchset that improving throuput by delaying `mmap_lock`
taking until it actually need it for assigning an `anon_vma` to the vma.
According to the Intel's kernel test robot, it makes 3x throughput improvement.
Specifically, the test case was `vm-scalability`.


[PATCH v2 0/7] memcg: reduce memory consumption by memcg stats (Shakeel Butt)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20240427003733.3898961-1-shakeel.butt@linux.dev

Memcg stats are maintained per-cpu and numa specific stats, and therefore the
memory overhead increases on large machines having many CPUs and NUMA nodes.
Shakeel posted a patchset to reduce the overhead by avoid allocating the memory
for non-memcg specific stats.


Linux 6.9-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=witYatGg+jW1kVu2Moq6yF2JNFe3wn7G0sMNhE=H=9voA@mail.gmail.com

The sixth candidate for Linux v6.9 is out.  Linus says everything is normal and
only documentation update diffstat is stading out, which is again not a
problem.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ relstat.py --since 2022-04-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.9-rc6-only.png)
