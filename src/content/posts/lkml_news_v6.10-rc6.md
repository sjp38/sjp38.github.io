---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.10-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-06-25T06:39:34-07:00
lastmod: 2024-06-25T06:39:34-07:00
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

[PATCH] memcg: Add a new sysctl parameter for automatically setting memory.high (Waiman Long)
---------------------------------------------------------------------------------------------

https://lore.kernel.org/20240623204514.1032662-1-longman@redhat.com

While memcg v1 has only single file for memory limit setting, namely
`memory.limit_in_bytes`, memcg v2 has two files, `memory.max` and `memory.high`
for the purpose.  Users migrating from memcg v1 to memcg v2 usually sets only
`memory.max`, and hence get problems sometimes.  This patch add a new knob,
`memory_high_autoset_ratio`, which allows setting `memory.high` as a ratio of
`memory.max`.


[RFC PATCH] mm: introduce gen information in /proc/xxx/smaps (Zhaoyang Huang)
-----------------------------------------------------------------------------

https://lore.kernel.org/20240626084406.2106291-1-zhaoyang.huang@unisoc.com

Zhaoyang posted an RFC for showing generation of folios in vmas on
`proc/<pid>/smaps` file.


[GIT PULL] hotfixes for 6.10-rc6 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20240626173017.d4d69c597466bdd42da64da3@linux-foundation.org

Andrew sent hotfixes pull request for 6.10-rc6 to Torvalds.  13 hotfixes in
total.


[PATCH 0/7] Split list_lru lock into per-cgroup scope (Kairui Song)
-------------------------------------------------------------------

https://lore.kernel.org/20240624175313.47329-1-ryncsn@gmail.com

Kairui posted a patch for split `list_lru` per-node lock to per-cgroup for
performance.


Linux 6.10-rc6 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgQMOscLeeA3QXOs97xOz_CTxdqJjpC20tJ-7bUdHWtSA@mail.gmail.com

Linus releases the sixth candidate for Linux v6.10.  Things continue to be
fairly calm, and this release candidate is pretty small, according to Linus.
