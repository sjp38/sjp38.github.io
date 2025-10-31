---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-11-19T06:35:06-08:00
lastmod: 2024-11-19T06:35:06-08:00
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

[GIT PULL] MM updates for 6.13-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20241118193001.6aefcadd7426feafedf824e1@linux-foundation.org

Andrew posted memory management subsystem pull request for v6.13-rc1 to Linus
Torvalds.


[PATCHSET v5 0/17] Uncached buffered IO (Jens Axboe)
----------------------------------------------------

https://lore.kernel.org/20241114152743.2381672-2-axboe@kernel.dk

Jens is continuing his work on support of buffered IO that isn't page cache
persistent.  The motivation is the fact that device speed is getting faster
while reclaim is not.


[RFCv1 0/6] Page Detective (Pasha Tatashin)
-------------------------------------------

https://lore.kernel.org/20241116175922.3265872-1-pasha.tatashin@soleen.com

Pasha posted an RFC patch series for better debugging of page status.


[RFC PATCH 0/4] CXL Hotness Monitoring Unit perf driver (Jonathan Cameron)
--------------------------------------------------------------------------

https://lore.kernel.org/20241121101845.1815660-1-Jonathan.Cameron@huawei.com

CXL spec release [3.2](https://computeexpresslink.org/cxl-specification/)
introduces CXL hotness monitoring unit definition.  Jonathan posted this RFC
patch series that introducing the driver that allows using the hardware feature
from `perf`.


[RFC PATCH 0/4] Add support for File Based Memory Management (Bijan Tabatabai)
------------------------------------------------------------------------------

https://lore.kernel.org/20241122203830.2381905-1-btabatabai@wisc.edu

Bijan posted an RFC patch series for file-based memory managment that presented
on ATC'24.


[Invitation] Linux MM Alignment Session on Kexec Hand Over (KHO) on Wednesday (David Rientjes)
----------------------------------------------------------------------------------------------

https://lore.kernel.org/3913c651-9173-32ff-174b-1ac7c4ab1309@google.com

David announces the schedule and the topic for the next MM alignement session.
The topic will be the followup of the permanent guest memory support for live
update, specifically focused on only kexec hand over.


[PATCH v4 0/9] mm: workingset reporting (Yuanchu Xie)
-----------------------------------------------------

https://lore.kernel.org/20241127025728.3689245-1-yuanchu@google.com

Yuanchu posted the fourth version lruvec-based workingset reporting patch
series.


[RFC PATCH 0/4] Promotion of Unmapped Page Cache Folios. (Gregory Price)
------------------------------------------------------------------------

https://lore.kernel.org/20241127082201.1276-1-gourry@gourry.net

The AutoNUMA-based promotion cannot do the promotion of unmapped pages since
those are literally unmapped, and therefore no fault protection can be
installed.  Gregory posted a patch series for making this happen leveraging
`folio_mark_accessed()`.


Kexec HandOver (KHO) discussion recap and open questions (David Rientjes)
-------------------------------------------------------------------------

https://lore.kernel.org/52e189fa-bbb4-f031-8a64-716ddee14599@google.com

David summarizes the discussions about KHO that held on MM alignemnt session on
2024-11-27.


[RFC PATCH V0 0/10] mm: slowtier page promotion based on PTE A bit (Raghavendra K T)
------------------------------------------------------------------------------------

https://lore.kernel.org/20241201153818.2633616-1-raghavendra.kt@amd.com

Raghavendra posted an RFC patch series that introduces a kernel thread that
scans PTE Accessed bits and migrate hot pages on tiered memory systems.


Linux 6.13-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whiWXVxhd0BATPPd6t36HJ49vApdJXZOYuAJtRA5pRi1g@mail.gmail.com

After the two weeks of the merge window, Linus closes the window and releases
the first candidate of Linux v6.13.  Linus also notes that the release schedule
will not badly conflict with the year-end holidays.
