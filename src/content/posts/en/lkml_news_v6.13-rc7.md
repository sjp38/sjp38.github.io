---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.13-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-01-07T07:27:02-08:00
lastmod: 2025-01-07T07:27:02-08:00
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

[PATCH] tools/mm: Introduce a tool to handle entries in allocinfo (Hao Ge)
--------------------------------------------------------------------------

https://lore.kernel.org/20250106112103.25401-1-hao.ge@linux.dev

Hao posted a patch adding a tool for handling of the kernel's memory allocation
profilier output.


[Invitation] Linux MM Alignment Session on Cgroup-based THP Control on Wednesday (David Rientjes)
-------------------------------------------------------------------------------------------------

https://lore.kernel.org/5535fc79-c566-93a0-6134-bfdf1cf5171a@google.com

David invites people for next Linux MM Alignment session.  The topic will be
cgroup-based THP control, led by Gutierez Asier, who proposed the
[idea](https://lore.kernel.org/linux-mm/8e55d735-b65d-428f-8689-8f0b729d56c4@huawei.com/T/).


Swap Min Odrer (Daniel Gomez)
-----------------------------

https://lore.kernel.org/20250107094347.l37isnk3w2nmpx2i@AALNPWDAGOMEZ1.aal.scsc.local

Daniel proposes next MM alignment session topic for supporting higher swap
allocation minimum order, for high capacity SSDs that require >4KiB write size.


[RFC 0/4] mm: Remove pfn_t type (Alistair Popple)
-------------------------------------------------

https://lore.kernel.org/cover.a7cdeffaaa366a10c65e2e7544285059cc5d55a4.1736299058.git-series.apopple@nvidia.com

Alistair posted an RFC patch removing `pfn_t` type, which will be no more be
necessary once ongoing works from him and Dan.


[LSF/MM/BPF TOPIC] Non-lru page migration in a memdesc world (David Hildenbrand)
--------------------------------------------------------------------------------

https://lore.kernel.org/2612ac8a-d0a9-452b-a53d-75ffc6166224@redhat.com

David proposes an LSFMMBPF topic for non-lru page migration problem for a
future that memdesc is being used.


[RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios. (Gregory Price)
---------------------------------------------------------------------------

https://lore.kernel.org/20250107000346.1338481-1-gourry@gourry.net

Gregory posted the third version of the patch series for enabling promotion of
unmapped page cache folios when NUMA balancing-based memory tiering is being
used.


[LSF/MM/BPF TOPIC] Physical LRU scanning feasibility (Lorenzo Stoakes)
----------------------------------------------------------------------

https://lore.kernel.org/83bebb7f-f157-4179-b7ec-b25b2ee4270d@lucifer.local

Lorenzo proposes an LSFMMBPF topic for disussing feasibility and possible
optimizations for physical address based LRU scanning.


[RFC 00/11] khugepaged: mTHP support (Nico Pache)
-------------------------------------------------

https://lore.kernel.org/20250108233128.14484-1-npache@redhat.com

Nico posted an RFC patch series for supporting multi-zized THP on khugepaged.


State Of The Page (January 2025) (Matthew Wilcox)
-------------------------------------------------

https://lore.kernel.org/Z37pxbkHPbLYnDKn@casper.infradead.org

Matthew shares the current state of `struct page` optimization project with
next things to do.  He believes it can make a big milestone this year, and make
the size of `struct page` 32 bytes.


[LSF/MM/BPF TOPIC] Large folio (z)swapin (Usama Arif)
-----------------------------------------------------

https://lore.kernel.org/58716200-fd10-4487-aed3-607a10e9fdd0@gmail.com

Usama proposes an LSFMMBPF topic for swapin of large folios.


Linux 6.13-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjrP_uH7_2h7_P+qAO9o5wmQRnhpiivsq1dti4xsM-_9w@mail.gmail.com

Linus Torvalds released the seventh candidate for 6.13.  He feels everything is
back to speed after the holiday weeks, and will release 6.13 next week, unless
something odd happens.
