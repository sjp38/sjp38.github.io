---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-06-01T07:05:24+02:00
lastmod: 2021-06-01T07:05:24+02:00
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

[PATCH V3 0/2] mm: compaction: proactive compaction trigger by user (Charan Teja Reddy)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1622454385.git.charante@codeaurora.org

This patchset introduces `/proc/sys/vm/compaction_proactiveness` file, which
can trigger proactive compaction by writing it.


[RFC PATCH] mm/page_reporting: Adjust threshold according to MAX_ORDER (Gavin Shan)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210601033319.100737-1-gshan@redhat.com

The free pages reporting feature doesn't allow discontiguous pages that smaller
than `PAGE_REPORTING_MIN_ORDER`.  Current setting of it makes the feature to
never work on specific environment, because it is set to be equal to
`pageblock_order`.  This patchset mitigates the situation.


[LSF/MM TOPIC] mmap locking topics (Michel Lespinasse)
------------------------------------------------------

https://lkml.kernel.org/r/20210601044845.GA12713@lespinasse.org

Two topics for mmap locking issue, specificallyt speculative page faults and
fine grained locking are proposed.


[LSF/MM/BPF TOPIC] The Maple Tree (Liam Howlett)
------------------------------------------------

https://lkml.kernel.org/r/20210601223007.pvrns2kqqzuomdlm@revolver

Another LSF/MM topic for the maple tree.  It is a RCU-safe range-based B-tree.
It aims to be used for MM structures.  Liam proposes to discuss how to use it
and how it could be used for the file systems in LSF/MM.


[LSF/MM/BPF TOPIC] Handling of VMAs (Liam Howlett)
--------------------------------------------------

https://lkml.kernel.org/r/20210602150312.cjg3vhren2c5arp7@revolver

Liam is proposing another LSF/MM topic for VMA scalability.  He points out
current VMAs handling is unnecessarily complicated and therefore we need to
revisit it.  He also says he will post more patches before the conference.


[PATCH 0/2] Allow high order pages to be stored on PCP v2 (Mel Gorman)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20210603142220.10851-1-mgorman@techsingularity.net

Only order-0 pages are handled by the per-cpu page allocator (PCP).  This
patchset reduce PCP overhead and make it able to store high-order pages on PCP.


[PATCH v2 0/9] Remove DISCINTIGMEM memory model (Mike Rapoport)
---------------------------------------------------------------

https://lkml.kernel.org/r/20210604064916.26580-1-rppt@kernel.org

This patchset finally removes DISCONTIGMEM memory model, because SPARSEMEM is
replacing it.


Linux 5.13-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgxOqRbXUwQ73sMgxfOg9+B7BeTgZ6JP9oHR9BPhKGjOg@mail.gmail.com

Already fifth release candidate.  Nevertheless, Torvalds says the things not
really calmed down yet, so he hopes it to be calmed now.  Biggest fixes came
from networking, but other parts also have fair amount of fixes.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc5..v5.13-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-06-07 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc5-only.png)
