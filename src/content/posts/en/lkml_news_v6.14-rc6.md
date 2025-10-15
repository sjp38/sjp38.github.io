---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-03-04T06:54:33-08:00
lastmod: 2025-03-04T06:54:33-08:00
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

[PATCH v15 0/9] Rust support for mm_struct, vm_area_struct, and mmap (Alice Ryhl)
---------------------------------------------------------------------------------

https://lore.kernel.org/20250304-vma-v15-0-5c641b31980a@google.com

Alice Ryhl posted the fiftennth version of Rust binding for major mm API.


[RFC PATCH 0/4] Kernel daemon for detecting and promoting hot pages (Bharata B Rao)
-----------------------------------------------------------------------------------

https://lore.kernel.org/20250306054532.221138-1-bharata@amd.com

Bharata posted an RFC patch set for igniting discussion about one source that
provides page access information with an example.  The patch uses AMD IBS
driver as the source.


[RFC PATCH 0/5] Introduce FDBox, and preserve memfd with shmem over KHO (Pratyush Yadav)
----------------------------------------------------------------------------------------

https://lore.kernel.org/20250307005830.65293-1-ptyadav@amazon.de

Pratyush posted an RFC patch set for keeping memfd and shmem over reboot vis
KHO.


Linux 6.14-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whWKLW6k4NSCDq2SzfAKm4NM2fPj=+dgNwrceozd_cc9Q@mail.gmail.com

Linus released the sixth candidate of Linux v6.14.  Torvalds mentions there is
no special thing to report and everything is on the track.
