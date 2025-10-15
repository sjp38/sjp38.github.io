---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-03-20T07:09:29-07:00
lastmod: 2025-03-20T07:09:29-07:00
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

[RFC v1 0/3] Live Update Orchestrator (Pasha Tatashin)
------------------------------------------------------

https://lore.kernel.org/20250320024011.2995837-1-pasha.tatashin@soleen.com

Pasha posted an RFC patch series for Linux kernel live update that uses kexec
hand over as a way to preserve memory state from old kernel.


[GIT PULL] slab updates for 6.15 (Vlastimil Babka)
--------------------------------------------------

https://lore.kernel.org/2f7985a8-0460-42de-9af0-4f966b937695@suse.cz

Vlastimil posted Slab pull request for Linux v6.15 to Linus.


[PATCH v5 00/16] kexec: introduce Kexec HandOver (KHO) (Changyuan Lyu)
----------------------------------------------------------------------

https://lore.kernel.org/20250320015551.2157511-1-changyuanl@google.com

Changyuan posted the fifth version of kexec handover patch series.


[LSF/MM/BPF TOPIC v2] Unifying sources of page temperature information - what info is actually wanted? (Jonathan Cameron)
-------------------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250319124552.0000344a@huawei.com

Jonathan revised and posted his LSFMMBPF topic proposal for unified page
temperature information as v2.


[RFC 0/3] Guaranteed CMA (Suren Baghadasaryan)
----------------------------------------------

https://lore.kernel.org/20250320173931.1583800-1-surenb@google.com)

Surent posted an RFC patch series for guaranteed CMA, which guarantees success
of the allocation.


[LSF/MM/BPF TOPIC] Reentrant kmalloc usable from any context (Alexei Starovoitov)
---------------------------------------------------------------------------------

https://lore.kernel.org/CAADnVQ+=x31Rcjh6-qX1C+d2q0LBRCH=1gPqfKOaMXYx_fkQjw@mail.gmail.com

Alexei proposed another LSFMMBPF topic for flexible slab allocation context.


Linux 6.14 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wg7TO09Si5tTPyhdrLLvyYtVmCf+GGN4kVJ0=Xk=5TE3g@mail.gmail.com

Linux kernel 6.14 has released one day later than the usual schedule.  It was
not for an important tings but just because Linus forgot that it is the day.
All is well, and 6.15 merge window is open.
