---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.16-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-06-17T07:29:23-07:00
lastmod: 2025-06-17T07:29:23-07:00
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

[RFC 0/3] mm: introduce snapshot_page() (Luiz Capitulino)
---------------------------------------------------------

https://lore.kernel.org/cover.1750170418.git.luizcap@redhat.com

Luiz posted an RFC patch series for introducing a helper function for showing
consistent view of a folio, and using it from kpagecount and
stable_page_flags().


[RFC PATCH v1 0/4] Kernel thread based async batch migration (Bharata B Rao)
----------------------------------------------------------------------------

https://lore.kernel.org/20250616133931.206626-1-bharata@amd.com

Bharata posted an RFC patch series for doing pages migration in an asynchronous
and batched way.


[Linux Memory Hotness and Promotion] Notes from June 5, 2025 (David Rientjes)
-----------------------------------------------------------------------------

https://lore.kernel.org/a2ba9cf3-193b-d92c-9912-20024e68769a@google.com

David shared meeting notes of Linux memory hotness and promotion.


[PATCH linux next] tools/accounting/delaytop: add delaytop  to record top-n task delay (Yaxin Wang)
---------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn

Yaxin posted a patch for introducing a new tool that cat record top-n delayed
tasks.


Linux 6.16-rc3 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wjqni5PduSvcsbkPXzPH9md2do6HUXw9Yqrvjq8e8GNmA@mail.gmail.com

Linus released the third candidate for 6.16.  Unlike the rc2, which was smaller
than usual, rc3 is back on the usual size, according to Linus.
