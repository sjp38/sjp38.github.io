---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-07-09T06:36:14-07:00
lastmod: 2024-07-09T06:36:14-07:00
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

[RFC][PATCH 0/4] slab: Allow for type introspection during allocation (Kees Cook)
---------------------------------------------------------------------------------

https://lore.kernel.org/20240708190924.work.846-kees@kernel.org

Kees posted this RFC patch, which allows `kmalloc()` be able to know the type
of the object that it is requested to allocate memory for.  It is done by
letting `kmalloc()` optionally receives the pointer instead of the size.


[Invitation] Linux MM Alignment Session on guest_memfd() mapping, hugepages, and page pinning on Wednesday
----------------------------------------------------------------------------------------------------------

https://lore.kernel.org/197a2f19-c71c-fbde-a62a-213dede1f4fd@google.com

David invites MM community to another instance of the MM alignment.  It will
address `guest_memfd()` mapping, hugepages, and page pinning and led by Elliot
Berman and Fuad Tabba.


[MAINTAINERS SUMMIT] Device Passthrough Considered Harmful? (Dan Williams)
--------------------------------------------------------------------------

https://lore.kernel.org/

Dan proposes yet another maintainers summit topic.


[PATCH] mm/cma: export total and free number of pages for CMA areas (Frank van der Linden)
------------------------------------------------------------------------------------------

https://lore.kernel.org/20240709163053.2514760-1-fvdl@google.com

Frank posted a patch for exporting the total and free number of CMA pages per
area via new CMA sysfs files, namely `total_pages` and `available_pages`.


[PATCH v1 0/2] mTHP allocation stats for file-backed memory (Ryan Roberts)
--------------------------------------------------------------------------

https://lore.kernel.org/20240711072929.3590000-1-ryan.roberts@arm.com

Ryan posted a patchset for exposing file-backed memory's mTHP allocation stats.
He also mentions he is planning to build folio size restriction.


Linux 6.10 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wjV_O2g_K19McjGKrxFxMFDqex+fyGcKc3uac1ft_O2gg@mail.gmail.com

After the seventh week from the close of the merge window, Linus Torvalds
released Linux v6.10.  He says the last week was not quiet as much as the
proceeding ones but not that much to deserve an extra rc week.
