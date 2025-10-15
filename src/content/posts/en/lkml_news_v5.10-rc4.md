---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-11-10T07:16:10+01:00
lastmod: 2020-11-10T07:16:10+01:00
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

[PATCH -V3 0/2] autonuma: Migrate on fault among multiple bound nodes (Huang Ying)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201110055951.85085-1-ying.huang@intel.com

This patchset makes AutoNUMA's cross-socket memory access optimization possible
even if the application's memory is bound to multiple NUMA nodes.


[PATCH] kfence: Avoid stalling work queue task without allocations (Marco Elver)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201110135320.3309507-1-elver@google.com

This commit makes the toggle allocation gate of kfence to have 1 second
timeout, to be prepared for allocation stallings.


[RFC PATCH 0/6] Split huge pages to any lower order pages. (Zi Yan)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20201111204008.21332-1-zi.yan@sent.com

Now pagecache can handle any size of THP, however the `split_huge_page()`
splits a THP to only order-0 pages.  For the reason, this patchset supports the
function to be able to split a THP into any size smaller pages.


[PATCH v4 00/16] Overhaul multi-page lookups for THP (Matthew Wilcox)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20201112212641.27837-1-willy@infradead.org

This is a preparation of next changes Matthew will post.  It first makes
several page cache iteration APIs to only return head pages.


Are THPs the right model for the pagecache? (Matthew Wilcox)
------------------------------------------------------------

https://lkml.kernel.org/r/20201113044652.GD17076@casper.infradead.org

THP is for architectures supporting large TLB entries.  However, the point of
enabling THP for page cache is only reducing the software works, so the
definition doesn't need to be true in there.  Matthew suggests to use another
model for the case and lists concerns about it.


Linux 5.10-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com

It's already rc4.  The next long term support kernel, v5.10, will be released
about 4-5 weeks later.  Now Linus want the things to start calming down, but it
wasn't so much.  That said, he says it's not really worrisome but looks good.
