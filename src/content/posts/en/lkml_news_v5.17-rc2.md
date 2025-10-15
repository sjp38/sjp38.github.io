---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.17-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-01-25T07:32:08+01:00
lastmod: 2022-01-25T07:32:08+01:00
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

[PATCH 0/7] Allocate module text and data separately (Christophe Leroy)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1643015752.git.christophe.leroy@csgroup.eu

Powerpc book3s/32 can set execute permission in 256 MiB segments granularity
instead of page granularity.  This patchset therefore allow module data be
allocated in vmalloc rea instead of module area.


[PATCH 0/4] mm/memcg: Address PREEMPT_RT problems instead of disabling it. (Sebastian Adrzej Siewior)
-----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220125164337.2071854-1-bigeasy@linutronix.de

This patchset enables `MEMCG` for `PREEMPT_RT` instead of disabling it.


[LSF/MM/BPF TOPIC] Folios (Matthew Wilcox)
------------------------------------------

https://lkml.kernel.org/r/YfGxPKBRdR8FKDcv@casper.infradead.org

Matthew Wilcox is proposing LSF/MM/BPF topic on Folios, for filesystem point of
view and mm crowd.


mmotm 2022-01-26-21-04 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220127050456.M1eh-ltbc%akpm@linux-foundation.org

mmotm tree has updated.  Compared to the previous snapshot, it's rebased on
5.17-rc1, adds 117 new patches, modifies 20 existing patches, and drops 313
patches.  In total, 164 patches in the queue.


[PATCH 00/16] Introduce memblock simulator (Karolina Drobnik)
-------------------------------------------------------------

https://lkml.kernel.org/r/cover.1643206612.git.karolinadrobnik@gmail.com

Memblock, which is a boot time memory allocator, is not easy to test and debug
because it's used in the boot time only.  For testing and debugging more
easily, this patchset adds memblock simulator as a tool.


LSF/MM/BPF: 2022: Call for Proposals (Josef Bacik)
--------------------------------------------------

https://lore.kernel.org/all/YfGnDRM%2FPe4jzbSr@localhost.localdomain/

LSF/MM/BPF, which has canceled for last 2 years, is trying again to be held
this year, from 2022-05-02 to 2022-05-04 at the Palm Springs, California.  The
invitation request should be submitted by 2022-03-01.


[PATCH -V11 0/3] NUMA balancing: optimize memory placement for memory tiering system (Huang Ying)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220128082751.593478-1-ying.huang@intel.com

This patchset optimizes memory management on DRAM/PMEM tiered memory system.


[PATCH v2 00/35] Speculative page faults (Michel Lespinasse)
------------------------------------------------------------

https://lkml.kernel.org/r/20220128131006.67712-1-michel@lespinasse.org

Another version of speculative page faults patchset, which aims to improve the
multi-core scalability of vma management.  The author says this revision is
simpler and more bisectable approach.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220128181341.2103de95948608a65958ae40@linux-foundation.org

12 patches for fixing mm are sent from Andrew Morton to Linus Torvalds.


[PATCH v2 0/3] mm/page_owner: Extend page_owner to show memcg information (Waiman Long)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220129205315.478628-1-longman@redhat.com

Waiman found severe memory consumption due to offlined `mem_cgroup` structures
on systems having huge number of containers.  To ease the investigation, this
patch extends the `page_owner` debugging tool to show memch information.


Linux 5.17-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg4NYVVC58vBAD6Hd6MFfY4AG-aAUHtBCYQBcsKz+4XOg@mail.gmail.com

The second release candidate for v5.17 is out.  The stat looks a little bit
different than usual due to late NFS client merge.  But, other parts look ok.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.6-rc2..v5.17-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-11-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.17-rc2-only.png)
