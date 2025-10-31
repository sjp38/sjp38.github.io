---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-07-15T06:46:58-07:00
lastmod: 2025-07-15T06:46:58-07:00
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

[PATCH v9 00/14] khugepaged: mTHP support (Nico Pache)
------------------------------------------------------

https://lore.kernel.org/20250714003207.113275-1-npache@redhat.com

Nico posted ninth version of the patch series for adding mTHP support on
khugepaged.


[PATCH v7 0/7] use per-vma locks for /proc/pid/maps reads (Suren Baghadasaryan)
-------------------------------------------------------------------------------

https://lore.kernel.org/20250716030557.1547501-1-surenb@google.com

Suren posted the seventh version of the patch series making reading of
`/proc/pid/maps` with only per-vma locks.


[PATCH v5 00/15] kunit: Introduce UAPI testing framework (Thomas Weißschuh)
---------------------------------------------------------------------------

https://lore.kernel.org/20250717-kunit-kselftests-v5-0-442b711cde2e@linutronix.de

Thomas posted fifth version of his patch series for unifying kunit and
kselftest.


Linux 6.16-rc7 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgdXcZfQEL2Xa+GEEtcC7Ez9SEWnGaB76R76VZsYcMOnA@mail.gmail.com

Linus Torvalds released the seventh candidate for Linux 6.16.  There were some
fixes, but overall it is still fairly small.
