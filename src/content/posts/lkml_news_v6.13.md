---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-01-14T07:09:05-08:00
lastmod: 2025-01-14T07:09:05-08:00
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

[LSF/MM/BPF TOPIC] Predictive readahead of dentries (Shyam Prasad N)
--------------------------------------------------------------------

https://lore.kernel.org/CANT5p=rxLH-D9qSoOWgjYeD87uahmZJMwXp8uNKW66mbv8hmDg@mail.gmail.com

Shyam proposes an LSFMM topic for dentries readahead, like that of filesystems.


[PATCH v9 00/17] reimplement per-vma lock as a refcount (Suren Baghdasaryan)
----------------------------------------------------------------------------

https://lore.kernel.org/20250111042604.3230628-1-surenb@google.com

Suren continues revisioning of his per-vma lock optimization, and posted the
ninth version of it, with changed title.


[Feedback Needed] Hypervisor live update biweekly meeting time (David Rientjes)
-------------------------------------------------------------------------------

https://lore.kernel.org/2908e4ab-abc4-ddd0-b191-fe820856cfb4@google.com

David announces start of a bi-weekly syncup for hypervisor live update, which
was a topic of last year's MM alignment session, and asking feedback about the
time proposal.


[RFC] mm/swap.c: Enable promotion of unmapped MGLRU page cache pages (Donet Tom)
--------------------------------------------------------------------------------

https://lore.kernel.org/20250115120625.3785-1-donettom@linux.ibm.com

Donet Tom posted an RFC patch that extends Gregory's patch series to enable
unmapped MGLRU page cache pages promotion on memory tiering.


[LSF/MM/BPF TOPIC] Improving large folio writeback performance (Joanne Koong)
-----------------------------------------------------------------------------

https://lore.kernel.org/CAJnrk1a38pv3OgFZRfdTiDMXuPWuBgN8KY47XfOsYHj=N2wxAg@mail.gmail.com

Joanne proposes an LSFMMBPF topic for dirty large folios writeback performance,
especially for the writeback granularity and balancing.


[LSF/MM/BPF TOPIC] Virtual Swap Space (Nhat Pham)
-------------------------------------------------

https://lore.kernel.org/20250116092254.204549-1-nphamcs@gmail.com

Nhat proposes a LSFMMBPF topic for virtual swap space, which was floated by Rik
since 2011 and also discussed on LSFMMBPF last year.


[LSF/MM/BPF TOPIC] memory persistence over kexec (Mike Rapoport)
----------------------------------------------------------------

https://lore.kernel.org/Z44BJw_t8gDgUnLv@kernel.org

Mike proposes an LSFMMBPF topic for kexec handover-based memory persistence
over reboots.


Linux 6.13 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wiprabAQcCwb3qNhrT5P50MJNqunC9JU5v99kdvM-2rsg@mail.gmail.com

Linus Torvalds released the 6.13 as expected.  The last week of the
stabilization was calm and normal.  Linus also shares the list of the guitar
pedal winners.
