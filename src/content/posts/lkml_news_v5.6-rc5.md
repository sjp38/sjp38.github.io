---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.6-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-03-03T06:16:51+01:00
lastmod: 2020-03-03T06:16:51+01:00
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

[PATCH v1 00/11] virtio-mem: paravirtualized memory
---------------------------------------------------

https://lkml.kernel.org/r/20200302134941.315212-1-david@redhat.com

At KVM Forum 2018, virtio-mem's basic idea has presented and now this patchset
introduces it.  This provides a flexible, cross-architecture memory hot(un)plug
solution.


[PATCH v7 0/7] introduce memory hinting API for external process
----------------------------------------------------------------

https://lkml.kernel.org/r/20200302193630.68771-1-minchan@kernel.org

Finally, this patchset has accepted by Andrew Morton.


[PATCH v2] mm: Proactive compaction
-----------------------------------

https://lkml.kernel.org/r/20200302213343.2712-1-nigupta@nvidia.com

This patchset makes kernel to do compaction proactively instead of THP
allocation failures, to minimize the latency spike which comes from the
compaction.  It significantly reduces THP allocation latency under memory
fragmentation.  95th percentile of the latency has reduced from 33,799 to 429!


[RFC v4 0/7] Implement Data Access Monitoring-based Memory Operation Schemes
----------------------------------------------------------------------------

https://lkml.kernel.org/r/20200303121406.20954-1-sjpark@amazon.com

My fourth RFC for DAMON-based Operation Schemes.  This time, I updated the
evaluation results of ETHP scheme with more reliable data.

TL;DR: 'ethp' removes 97.61% of 'thp' memory space overhead while preserving
25.40% (up to 88.36%) of 'thp' performance improvement in total.


[LSFMMBPF TOPIC] Killing LSFMMBPF
---------------------------------

https://lkml.kernel.org/r/b506a373-c127-b92e-9824-16e8267fc910@toxicpanda.com

Another LSF/MM/BPF topic proposal.  Author suggests killing LSF/MM/BPF.  The
main points of problems the author feels are LSF/MM/BPF is invitation only but
there are too many people need to be involved so that cannot fully invite every
necessary people.  The author proposing LSF/MM to be somewhat like LPC instead.


[LSFMMBPF TOPIC] LSFMMBPF 2020 COVID-19 status update
-----------------------------------------------------

https://lkml.kernel.org/r/20200307185420.GG2236@42.do-not-panic.com

COVID-19 is affecting so many conferences.  It seems LSF/MM/BPF also not an
exception.  The committees are trying to figure out what is the right decision
for it.


Linux 5.6-rc5
-------------

https://lkml.kernel.org/r/CAHk-=wjie=L9=jO-VKR5u7+5Ekis-VR5m=zUChR9djhAuAN55g@mail.gmail.com

Torvalds made this release from 28,000 feet, mainly due to flight cancellations
and travel trouble.  Maybe due to the COVID-19?

The release itself shows no worrysome things, but slightly bigger than
Torvalds' preferred -rc5 size.
