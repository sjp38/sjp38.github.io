---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-09-04T06:10:40-07:00
lastmod: 2024-09-04T06:10:40-07:00
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

[PATCH 00/15] timers: Cleanup delay/sleep related mess (Anna-Maria Behnsen)
---------------------------------------------------------------------------

https://lore.kernel.org/20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de

A discussion started from a question about `acpi_os_sleep()` concluded the
documentation is outdated, and same for some code for the same reason.  This
patchset tries to update the documents and code.


[PATCH 0/2 v2] remove PF_MEMALLOC_NORECLAIM (Michal Hocko)
----------------------------------------------------------

https://lore.kernel.org/20240902095203.1559361-1-mhocko@kernel.org

Michal sent the second revision of `PF_MEMALLOC_NORECLAIM` removal patchset
with `Reviewed-by:` tags in a more formal version.


[GIT PULL] hotfixes for 6.11-rc7 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20240903202651.f258324d271b4813dfa8de7a@linux-foundation.org

Andrew sent hotfixes for 6.11-rc7 to Linus Torvalds.


[PATCH v2 0/6] page allocation tag compression (Suren Baghdasaryan)
-------------------------------------------------------------------

https://lore.kernel.org/20240902044128.664075-1-surenb@google.com

Suren posted several improvements for page allocation tagging including page
allocation references storing memory overhead reduction.


[PATCH -next] mm: introduce per-node proactive reclaim interface (Davidlohr Bueso)
----------------------------------------------------------------------------------

https://lore.kernel.org/20240904162740.1043168-1-dave@stgolabs.net

Davidlohr reposted the per-node proactive reclaim interface patch saying he now
believes the semantics and expectations became clearer.


[PATCH 0/2] uprobes,mm: speculative lockless VMA-to-uprobe lookup (Andrii Nakryiko)
-----------------------------------------------------------------------------------

https://lore.kernel.org/20240906051205.530219-1-andrii@kernel.org

Andrii sent a patch series for doing `vm_area` to `inode` to `uprobe` while
bypassing read-acquiring `mmap_lock` if possible.


[PATCH] mm: move mm flags to mm_types.h (Nanyong Sun)
-----------------------------------------------------

https://lore.kernel.org/20240905152622.1205046-1-sunnanyong@huawei.com

Nanyong posted a patch moving mm flags from `linux/sched/coredump.h` to
`linux/mm_types.h`, since the flags are not only for the core dump related
features anymore.


Linux 6.11-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=whHwbceFq8XCK2uLCK9_aGywqmgMq3Udp5OJwFvLixpEA@mail.gmail.com

Linus Torvalds did the seventh Linux v6.11 candidate release on the usual
Sunday time after returning to his regular timezone.  Linus says the size of
the rc7 is not really what he wanted.  It is bigger than not only usual rc7 but
even more than rc6 and rc5 were.  Also if he does the usual release of the
usual timeline, the next merge window will open during the maintainers summit
week.  Both the big size of the candidate and the conflict with travel are
possible reasons for delaying the release.  But he also says those are not
necessarily the reason since he shows no scary changes, and maintainers could
finish works before the maintianers summit travel.  So, we'll see how it will
go next Sunday.
