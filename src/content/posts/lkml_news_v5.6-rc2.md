---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.6-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-02-11T07:37:21+01:00
lastmod: 2020-02-11T07:37:21+01:00
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

[RFC PATCH 0/3] DAMON: Implement The Data Access Pattern Awared Memory Management Rules
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20200210150921.32482-1-sjpark@amazon.com

This is an RFC patch from me that implementing simple way to run data access
pattern awared memory system using DAMON.  Proactive reclamation or access
awared THP promotion/demotion will be easily available using this change.


[PATCH 0/9] workingset protection/detection on the anonymous LRU list
---------------------------------------------------------------------

https://lkml.kernel.org/r/1581401993-20041-1-git-send-email-iamjoonsoo.kim@lge.com

This patchset is for improving kernel's reclamation scheme in a corner case
where pages which used only once evicting hot pages.  For example, if there are
hot working set and periodically a big region of memory is scanned, the hot
working set will be swapped out for each of the scan.  This patchset avoid the
problem by letting the scanning-like pages to be inserted into the inactive
list first.

Of course, for this change, accurate working set detection is necessary.  This
patchset detects the working sets mostly based on the previous scheme, but
extends it to deal with LRU well.


[PATCH v4 0/8] introduce memory hinting API for external process
----------------------------------------------------------------

https://lkml.kernel.org/r/20200212233946.246210-1-minchan@kernel.org

This is the fourth version of the patchset for `madvise_common()` system call.
Seems like the justification for the API itself has finished.


[LSF/MM/BPF TOPIC] AutoNUMA enhancements to optimize Tiered Memory
------------------------------------------------------------------

https://lkml.kernel.org/r/87mu9mhn10.fsf@yhuang-dev.intel.com

This is another LSF/MM session proposal.  As current kernel reclamation scheme
is designed for universal DRAMs, it doesn't work well with tiered memory.
Author has worked for AutoNUMA, which can find recently-accessed pages
regardless of memory pressure and even frequently-access pages.  The authors
want to discuss about this in the summit.


[LFS/MM/BPF Topic] User space OOM management on Chrome OS
---------------------------------------------------------

https://lkml.kernel.org/r/CAPz6YkUci9=d-nkoN9e8pb1eO3Wgchh1GTNSNdWc3kYuvoQdBg@mail.gmail.com

Another proposal for LSF/MM.  The author wants to share his experience of
memory management in Chrom OS development of 8 year, including their use of
Zram and per-process reclaim.


[LSF/MM/BPF TOPIC] Replacing mmap_sem with finer grained locks
--------------------------------------------------------------

https://lkml.kernel.org/r/CANN689EippvdwsHuhU-Aq=kNdk8-cAaCzPC7v=zbe6X302NteA@mail.gmail.com

A lot of LSF/MM proposals this week, maybe because the due is this week.  This
is old topic, but not solved yet.  Authors want to keep the discussion about
mmap splitting for multi CPU this year LSF/MM.


[LSF/MM TOPIC] Guest memory without struct page
-----------------------------------------------

https://lkml.kernel.org/r/1be38ae3-d51e-2661-d0ab-6ad8baefe804@oracle.com

`struct page` consumes about 1.5% of total memory.  Because the structure could
be unnecessary for hypervisors, the author want to save the 1.5%.


Linux 5.6-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wgqwiBLGvwTqU2kJEPNmafPpPe_K0XgBU-A58M+mkwpgQ@mail.gmail.com

`rc2` was calm as usual.  More than half of the changes are kvm documentation,
due to its conversion to ReST format.  'perf' change was also remarkable.
