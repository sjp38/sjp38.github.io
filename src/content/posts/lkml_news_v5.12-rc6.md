---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.12-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-03-30T07:35:52+02:00
lastmod: 2021-03-30T07:35:52+02:00
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

[RFC] NUMA balancing: reduce TLB flush via delaying mapping on hint page fault (Huang Ying)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210329062651.2487905-1-ying.huang@intel.com

NUMA balancing shots down TLBs on all CPUs that recently run hint-faulted
process during the migration of the hint-faulted page to appropriate node.
This commit delays the TLB shootdown to reduce the overhead.  With pmbench, it
reduced TLB shooting IPI up to 99%, though it didn't makde visible benchmark
score changes.


[RFC v2 00/43] PKRAM: Preserved-over-Kexec RAM (Anthony Yznaga)
---------------------------------------------------------------

https://lkml.kernel.org/r/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com

Second revision after a while.  This patchset makes a part of memory to be
exported as a file system to user space and let the content of the memory
preserved while the system is rebooted using kexec.  The user space programs
could restart fast regardless of system reboot by using that as a temporary
place to put their data.


[PATCH v2 1/2] kunit: add a KUnit test for SLUB debugging functionality (Oliver Glitta)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210330120436.4591-1-glittao@gmail.com

This commit makes `SLUB_RESILIENCY_TEST` macro, which is hardcoded as not
defined and therefore couldn't be used in normal case without kernel
modification, to be able to be defined with kernel configuration so that the
code hidden behind the macro could be used in kunit.


[PATCH v6 00/27] Memory Folios (Mattew Wilcox)
----------------------------------------------

https://lkml.kernel.org/r/20210331184728.1188084-1-willy@infradead.org

This is the sixth version of the page folio patchset.  This helps handling
complex compound pages in simpler way.


[PATCH 00/10] [v7][RESEND] Migrate Pages in lieu of discard (Dave Hansen)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20210401183216.443C4443@viggo.jf.intel.com

This patchset is for the usual tieremed memory system, which configured with
DRAM and a slower auxiliary memory such as persistent memory.  The system
starts allocation with DRAM and do reclamation once DRAM is filled up.  Then,
from a point, it starts falling over to the slower auxiliary memory.  As a
result, new allocations could result in slow auxiliary memory while there is a
space in DRAM, and the data reclaimed from DRAM is discarded even though there
was a space in the auxiliary memory.  This patchset makes the DRAM reclaimation
to migrate the pages to the auxiliary memory instead.


Linux 5.12-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whK9=wafv+cSLCGqFGPBbgp67Dut3jKCnWB--8y7Lxonw@mail.gmail.com

Last release (rc5) make Linus a little bit worried, but this week release is
somewhat positively tiny one.  He says the release schedule will be as usual
unless something different happens within next two weeks.
