---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: Mon, 09 Dec 2024 11:18:02 -0800
lastmod: Mon, 09 Dec 2024 11:18:02 -0800
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

[Invitation] Linux MM Alignment Session on Slow-tier Page Promotion on Wednesday (David Rientjes)
-------------------------------------------------------------------------------------------------

https://lore.kernel.org/52a4867a-f330-4d3f-2da8-0919bc49c6ea@google.com

David Rientjes invites MM people to the next alignment session.  The topic is
slow-tier page promotion, led by RaghavendraKT from AMD.  They have RFC, too:
https://lore.kernel.org/linux-mm/20241201153818.2633616-1-raghavendra.kt@amd.com/T/#t


[PATCH mm-unstable 00/17] mm: Introduce arch_mmap_hint() (Kalesh Singh)
-----------------------------------------------------------------------

https://lore.kernel.org/20241210024119.2488608-1-kaleshsingh@google.com

Kalesh posted a patch that introducing per-architecture `mmap_hint()`
implementation and fixing the mmap hint being ignored due to THP in some cases.


[Invitation] bi-weekly guest_memfd upstream call on 2024-12-12 (David Hildenbrand)
----------------------------------------------------------------------------------

https://lore.kernel.org/b9567cbf-8ad7-440a-8768-f4e7dbd2b5f7@redhat.com

David invites people to next bi-weekly guest memfd upstream call, which would
be the last one of 2024.


[PATCH] MAINTAINERS: update MEMORY MAPPING section (Lorenzo Stoakes)
--------------------------------------------------------------------

https://lore.kernel.org/20241211105315.21756-1-lorenzo.stoakes@oracle.com

After the
[discussion](https://lore.kernel.org/20241206191600.45119-1-lorenzo.stoakes@oracle.com)
on adding every vma-related files to VMA section of MAINTAINERS file, Lorenzo
posted a patch moving all files to MEMORY MAPPING section and remove VMA
section.


LSF/MM/BPF: 2025: Call for Proposals (Michal Hocko)
---------------------------------------------------

https://lore.kernel.org/Z1wQcKKw14iei0Va@tiehlicka

Michal posted CFP for LSF/MM/BPF 2025.  It will be held March 24-26 at
Montreal.


Linux 6.13-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wh7Wjqo_e1bLeEijGkDaw7XcD3+F5kLZYkJfah8wS=evg@mail.gmail.com

Linus released the third candidate of Linux 6.13.  In spite of the holidays
season timing, the changelog looks very normal.
