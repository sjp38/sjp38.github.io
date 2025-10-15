---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.11-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-08-21T02:47:12-07:00
lastmod: 2024-08-21T02:47:12-07:00
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

[PATCH v4 0/6] mm: split underused THPs (Usama Arif)
----------------------------------------------------

https://lore.kernel.org/20240819023145.2415299-1-usamaarif642@gmail.com

Yusama posted the fourth version of the patch series for splitting
underutilized THPs for keeping THP performance gain while reducing the huge
page internal fragmentation-cuased memory usage bloat.


[PATCH 0/5] page allocation tag compression (Suren Baghdasaryan)
----------------------------------------------------------------

https://lore.kernel.org/20240819151512.2363698-1-surenb@google.com

Suren sent a patch series for improving page allocation tagging.


[PATCH 0/4] Increase the number of bits available in page_type (Matthew Wilcox)
-------------------------------------------------------------------------------

https://lore.kernel.org/20240821173914.2270383-1-willy@infradead.org

Matthew expanded this old patch series and posted since Kent wants more than 16
bits in `page_type`.


[PATCH 00/10] Simplify the page flags a little (Matthew Wilcox)
---------------------------------------------------------------

https://lore.kernel.org/20240821193445.2294269-1-willy@infradead.org

Matthew sent a patch series that removes page-based accessors including
`PageActive`, `Page SwapBacked`, etc, that can be replaced by page flags that
only be used on folios.


[PATCH] Integrating Namespaces and Cgroups for Enhanced Resource Management (StanPlatinum)
------------------------------------------------------------------------------------------

https://lore.kernel.org/tencent_BFC5A388F2922E5FB6F3FE2E3A3662561809@qq.com

A system security research team from multiple organizations reports a recent
finding of some vulnerabilities and bugs in container runtimes, and sends this
patch as a fix.


Linux 6.11-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wh599movdAyCHfVmYakq8rqKQD9wCvUAgBqbF3znEu_2g@mail.gmail.com

Linus released the fifth candidate for v6.11 little bit earlier than usual due
to the travel, on the 33th anniversary of Linux kernel.  Changes are just
normal, according to Linus and the stats.
