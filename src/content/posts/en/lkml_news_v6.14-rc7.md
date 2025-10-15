---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.14-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-03-11T07:24:37-07:00
lastmod: 2025-03-11T07:24:37-07:00
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

[PATCH v2 00/11] cgroup v1 deprecation messages (Michal Kountny)
----------------------------------------------------------------

https://lore.kernel.org/20250311123640.530377-1-mkoutny@suse.com

Michal categorizes and wordsmith memcg deprecation warning messages.


[RFC 0/5] track memory used by balloon drivers (Nico Pache)
-----------------------------------------------------------

https://lore.kernel.org/20250312000700.184573-1-npache@redhat.com

Nic posted an RFC patch series that adding a counter to track how many pages
are reclaimed by the balloon driver.


[PATCH 0/5] mm: reliable huge page allocator (Johannes Weiner)
--------------------------------------------------------------

https://lore.kernel.org/20250313210647.1314586-1-hannes@cmpxchg.org

Johannes posted a patch series for making huge page allocatioin more reliable
by making allocator, reclaim, and compaction code try harder to avoid
fragmentation.


Linux 6.14-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wg3c47t+iY8V-EyQKQPj8dLXZw1JWKVtj25uhQB98Ksmg@mail.gmail.com

Linus releasesd the seventh candidate of Linux v6.14.  He mentions the last
week was continuing to be calm, and this would be the final candidate.
