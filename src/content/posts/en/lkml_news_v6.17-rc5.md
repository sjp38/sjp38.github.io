---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.17-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: Mon, 01 Sep 2025 20:06:52 -0700
lastmod: Mon, 01 Sep 2025 20:06:52 -0700
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

[GIT PULL] hotfixes for 6.17-rc5 (Andrew Morton)
------------------------------------------------

https://lore.kernel.org/20250901172234.3a74524a97b595a5a81d1697@linux-foundation.org

Andrew posted MM hotfixes pull request for 6.17-rc5 to Linus Torvalds.


[PATCH v2 RFC 0/7] KFuzzTest: a new kernel fuzzing framework (Ethan Graham)
---------------------------------------------------------------------------

https://lore.kernel.org/20250901164212.460229-1-ethan.w.s.graham@gmail.com

Ethan posted second RFC version patch series for kernel internal fuzzing test
framework.


[v4 00/15] mm: support device-private THP (Balbir Singh)
--------------------------------------------------------

https://lore.kernel.org/20250903011900.3657435-1-balbirs@nvidia.com

Balbir posted the fourth version of the patch series for supporting THP on
device-private memory.


Where to put page->memdesc initially (Matthew Wilcox)
-----------------------------------------------------

https://lore.kernel.org/aLc_nckaDc2ePRv7@casper.infradead.org

As folio project proceeds, Matthew starts a discussion for where to put memdesc
initially.


[PATCH v2 00/15] mm, swap: introduce swap table as swap cache (phase I) (Kairui Song)
-------------------------------------------------------------------------------------

https://lore.kernel.org/20250905191357.78298-1-ryncsn@gmail.com

Kairui posted the second version of his swap table intro patch series.


[PATCH] tools/mm: Add madvise tool (Kiryl Shutemov)
---------------------------------------------------

https://lore.kernel.org/20250904175729.1029735-1-kirill@shutemov.name

Kiryl posted a patch for adding a new tool for madvise control.  Michal Hocko
raises a question of why this really need in tree, though.


Linux 6.17-rc5 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wh5AyuvEhNY9a57v-vwyr7EkPVRUKMPwj92yF_K0dJHVg@mail.gmail.com

Linus releases the fifth candidate for Linux v6.17.  He claims everythings look
normal, though there is a 2K lines insertion due to re-introduction of a
module.  Notably Linus also asks people to stop using Link: tags mindlessly,
but only for useful case such as a bug reports or discussions around the
commit.  He argues most reporters doesn't report bugs or start discussion
around a commit on the original patch submission thread, and hence the link is
not really useful.
