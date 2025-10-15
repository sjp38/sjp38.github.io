---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.15-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2025-03-31T07:12:14-07:00
lastmod: 2025-03-31T07:12:14-07:00
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

[GIT PULL] MM updates for 6.15-rc1 (Andrew Morton)
--------------------------------------------------

https://lore.kernel.org/20250330165732.f4c1493615375623f67e38eb@linux-foundation.org

Andrew Morton sent MM pull requests for 6.15-rc1 to Linus Torvalds.


mm.git grew a branch (Andrew Morton)
------------------------------------

https://lore.kernel.org/20250401030418.6b9e3b048eacc05d1cdeeffd@linux-foundation.org

Andrew announces a new branch on mm.git, called mm-new.  He explains what it
will be, and asks Stephen to continue adding mm-unstable to next while not
adding mm-new.


[PATCH 0/2] Implement numa node notifier (Oscar Salvador)
---------------------------------------------------------

https://lore.kernel.org/20250401092716.537512-1-osalvador@suse.de

Oscar posted a patchset for extending memory notifier for only NUMA state
changes.  The consumers of the notifier are memory-tier, slub, cpuset, hmat and
cxl.


[RFC PATCH 0/2] zswap: fix placement inversion in memory tiering systems (Nhat Pham)
------------------------------------------------------------------------------------

https://lore.kernel.org/20250329110230.2459730-1-nphamcs@gmail.com

Nhat posted an RFC for fixing zswap placing compressed data from lower tier on
upper tier.  It is designed for memory tiering but may also applied for general
NUMA configurations.


[PATCH] mm: add zblock allocator (Vitaly Wool)
----------------------------------------------

https://lore.kernel.org/20250401171754.2686501-1-vitaly.wool@konsulko.se

Vitaly posted a patch for introducing a new compressed page allocator, named
zblock.


[GIT PULL] Additional MM updates for 6.15-rc1 (Andrew Morton)
-------------------------------------------------------------

https://lore.kernel.org/20250402221540.435857db0b10cfeb489ae299@linux-foundation.org

Andrew posted additional MM pull request for 6.15-rc1 for changes.


[PATCH] mm: vmscan: apply proportional reclaim pressure for memcg when MGLRU is enabled (Koichiro Den)
------------------------------------------------------------------------------------------------------

https://lore.kernel.org/20250404141118.3895592-1-koichiro.den@canonical.com

Koichiro points out MGLRU's scan implementation was missing proportional
reclaim pressure for memcg and implementing the part.


[PATCH v4 0/2] mm/compaction: allow more aggressive proactive compaction (Michal Clapinski)
-------------------------------------------------------------------------------------------

https://lore.kernel.org/20250404111103.1994507-1-mclapinski@google.com

Michal Clapinski make compaction can be more aggressive by allowing users set
leeway (compaction watermark high-low difference) instead of using the
hardcoded value , 10.  The author also mentions this is for free pages
reporting enabled VM guests.


Linux 6.15-rc1 (Linus Torvalds)
-------------------------------

https://lore.kernel.org/CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com

After the two weeks of the merge window, Linus announces the close of the
window and the release of the first candidate for Linux 6.15.  Due to the
holiday-impacted small release of 6.14, this merge window became somewhat
bigger than usual.
