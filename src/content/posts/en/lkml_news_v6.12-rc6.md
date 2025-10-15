---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-10-28T22:03:33-07:00
lastmod: 2024-10-28T22:03:33-07:00
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

[GIT PULL] hotfixes for 6.12-rc6 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20241028203743.3fe4d95463aaafe23a239b51@linux-foundation.org

Andrew posted mm hotfixes for v6.12-rc6.


[PATCH v2 0/4] mm: add more kernel parameters to control mTHP (Maíra Canal)
---------------------------------------------------------------------------

https://lore.kernel.org/20241029002324.1062723-1-mcanal@igalia.com

Maira posted a patch series for adding kernel parameters to control mTHP for
shmem.


[Invitation] Linux MM Alignment Session on Memory Error Detector on Wednesday (David Rientjes)
----------------------------------------------------------------------------------------------

https://lore.kernel.org/9242f7cc-6b9d-b807-9079-db0ca81f3c6d@google.com

David invites kernel developers to another MM alignment session.  The topic is
how to make user-space control memory failure recovery.


[PATCH 0/6] futex: The remaining futex2 bits (Peter Zijlstra)
-------------------------------------------------------------

https://lore.kernel.org/20241025090347.244183920@infradead.org

Peter posted a patch series for futex2 including NUMA-aware futex2.


[Invitation] bi-weekly guest_memfd upstream call on 2024-10-31 (David Hildenbrand)
----------------------------------------------------------------------------------

https://lore.kernel.org/ae794891-fe69-411a-b82e-6963b594a62a@redhat.com

David invits developers to the `guest_memfd` upstream call series.


[RFC PATCH v3 0/6] Direct Map Removal for guest_memfd (Patrick Roy)
-------------------------------------------------------------------

https://lore.kernel.org/20241030134912.515725-1-roypat@amazon.co.uk

Patrick posted an RFC removing VM guest memory from the host kernel's direct
map as a mitigation against Spectre-style problems.


[RFC PATCH 0/3] Cgroup-based THP control (Asier Gutierrez)
----------------------------------------------------------

https://lore.kernel.org/20241030083311.965933-1-gutierrez.asier@huawei-partners.com

Asier posted an RFC patch for making THP controllable per cgroup.


[GIT PULL] slab fixes for 6.12-rc6 (Vlastimil Babka)
----------------------------------------------------

https://lore.kernel.org/fcd42c5a-0350-4073-951f-4a8332b7b3de@suse.cz

Vlastimil posted slab fixes pull request for Linux 6.12-rc6.


[RFC PATCH] docs/mm: add VMA locks documentation (Lorenzo Stoakes)
------------------------------------------------------------------

https://lore.kernel.org/20241101185033.131880-1-lorenzo.stoakes@oracle.com

Lorenzo posted an RFC for VMA locking documentation.


Linux 6.12-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whORbp07SkmAUbXTRtjk7imEgWXReGMaeteMg-gAFU_cA@mail.gmail.com

Linus released the sixth candidate for Linux v6.12 after a week.  It is a bit
bigger than usual, but in the normal range, and changes are spread among usual
subsystems.
