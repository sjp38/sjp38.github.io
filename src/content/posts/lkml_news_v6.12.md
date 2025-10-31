---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.12"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-11-12T06:38:12-08:00
lastmod: 2024-11-12T06:38:12-08:00
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

[PATCH 0/4] move per-vma lock into vm_area_struct (Suren Baghdasaryan)
----------------------------------------------------------------------

https://lore.kernel.org/20241111205506.3404479-1-surenb@google.com

Suren posted a patch moving `vm_lock` back into `vm_area_struct` after
confirming the performance regression found before happens only on limited
cases (old Broadwell microarchitecture).


[PATCH] lib/alloc_tag: Remove the sysctl configuration to prevent users from disabling it at runtime (Hao Ge)
-------------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20241108075004.131911-1-hao.ge@linux.dev

Hao tries to remove runtime memory allocation profiling on/off knob, since he
believes it is only making users confused.


[GIT PULL] hotfixes for 6.12 (Andrew Morton)
--------------------------------------------

https://lore.kernel.org/20241112164128.20f96b224ec3e2be9403fee2@linux-foundation.org

Andrew posted the hotfixes pull request for Linux v6.12 to Linus Torvalds.


[PATCH RFC 0/6] SLUB percpu sheaves (Vlastimil Babka)
-----------------------------------------------------

https://lore.kernel.org/20241112-slub-percpu-caches-v1-0-ddc0bdc27e05@suse.cz

Vlastimil posted an RFC for adding per-cpu array based caching layer to SLUB,
which can be opted-in by the users.


[GIT PULL] slab updates for 6.13 (Vlastimil Babka)
--------------------------------------------------

https://lore.kernel.org/03ec75a9-aade-4457-ac21-5649116afa98@suse.cz

Vlastimil posted the slab pull request for v6.13.


Linux 6.12 (Linus Torvalds)
---------------------------

https://lore.kernel.org/CAHk-=wgtGkHshfvaAe_O2ntnFBH3EprNk1juieLmjcF2HBwBgQ@mail.gmail.com

After the normal seven weekly candidates, Linus Torvalds released Linux v6.12.
