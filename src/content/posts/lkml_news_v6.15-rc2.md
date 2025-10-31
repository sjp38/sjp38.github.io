---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-04-09T07:08:04-07:00
lastmod: 2025-04-09T07:08:04-07:00
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

[PATCH v2 0/3] Implement numa node notifier (Oscar Salvador)
------------------------------------------------------------

https://lore.kernel.org/20250408084153.255762-1-osalvador@suse.de

Oscar found 5/10 memory notifier users are actually interested in only NUMA
level change, and proposes numa node notifier.


[RFC PATCH v2] Introduce Hierarchical Per-CPU Counters (Mathiew Desnoyers)
--------------------------------------------------------------------------

https://lore.kernel.org/20250408160508.991738-1-mathieu.desnoyers@efficios.com

Mathiew proposes a hierarchical per-cpu counter that can provide better
scalability on multi CPU machines.


[RFC PATCH 00/14] Virtual Swap Space (Nhat Pham)
------------------------------------------------

https://lore.kernel.org/20250407234223.1059191-1-nphamcs@gmail.com

Nhat proposes virtual swap space, which was also presented at LSFMMBPF a few weeks ago.


[PATCH v16 0/9] Rust support for mm_struct, vm_area_struct, and mmap (Alice Ryhl)
---------------------------------------------------------------------------------

https://lore.kernel.org/20250408-vma-v16-0-d8b446e885d9@google.com

Alice posted the 16th version of Rust support for fundamental mm structs.  It
has merged into mm-new.


 Free Reserved Memory and return to the Buddy Allocator (motasem zaaroura)
--------------------------------------------------------------------------

https://lore.kernel.org/CAL+YV0=kskPZ4YNUANAN2u0Kr38DHUTUBuhX3nJHmPAzwCZ05w@mail.gmail.com

motasem shares their problem around reserved memory and proposes their solution
for freeing and returning those to buddy allocator.


[RFC PATCH 0/7] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE (Chen Linxuan)
------------------------------------------------------------------------------

https://lore.kernel.org/E9B8B40E39453E89+20250411105306.89756-1-chenlinxuan@uniontech.com

Chen proposes adding a kernel config for avoiding inlining of functions, to
help easier tracing of functions.


Linux 6.15-rc2 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wi=9W+46NB85mJ9By2OB9ROLYVB4Z3au4qi0aYXDepd5w@mail.gmail.com

Linus released the second release candidate for Linux 6.15.  He mentions the
rc1 was larger than usual, but rc2 looks pretty much in the line in terms of
the size and statistics.
