---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-06-11T06:34:49-07:00
lastmod: 2024-06-11T06:34:49-07:00
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

[PATCH 0/7] arm64 / x86-64: low-level code generation issues (Linus Torvalds)
-----------------------------------------------------------------------------

https://lore.kernel.org/20240610204821.230388-1-torvalds@linux-foundation.org

Linus Torvalds posted another version of runtime const patchset for not only
x86_64 but also arm64.  He mentions the work was motivated by his Altra box
that shows `__d_lookup_rcu()` like a horror.


[PATCH v2 1/2] virt: pvmemcontrol: control guest physical memory properties (Yuanchu Xie)
-----------------------------------------------------------------------------------------

https://lore.kernel.org/20240612021207.3314369-1-yuanchu@google.com

Yuanchu posted a patchset for letting guest control its physical memory
properties, security features and optimizations.


[PATCH 0/2] Introduce tracepoint for hugetlbfs (Hongbo Li)
----------------------------------------------------------

https://lore.kernel.org/20240612011156.2891254-1-lihongbo22@huawei.com

Hongbo posted a patchset for adding hugetlbfs debugging purpose tracepoints.


[MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals regarding regressions (Thorsten Leemhuis)
-------------------------------------------------------------------------------------------------------

https://lore.kernel.org/c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info

Thorsten proposes four maintainers summit topics related to regressions.


[PATCH v6 0/7] DAMON based tiered memory management for CXL memory (Honggyu Kim)
--------------------------------------------------------------------------------

https://lore.kernel.org/20240614030010.751-1-honggyu.kim@sk.com

Honggyu Kim posted sixth (including RFC series) version of the patchset for
implementing pages migration DAMOS action.


Linux 6.10-rc4 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgkq+TvS9DiZBpuvZBGBjZeyxHwsLcPH-H5W5pUn42S+w@mail.gmail.com

The fourth release candidate for Linux 6.10 is out.  There was a rather unusual
spike in the diffstat due to a parisc fix.  In spite of the spike, Torvalds
says it looks normal and pretty small.
