---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Papers I read in 2021 Q4"
subtitle: ""
summary: "record interesting papers that I (partially) read"
authors: []
tags: []
categories: []
date: 2021-10-30T09:16:33+02:00
lastmod: 2021-10-30T09:16:33+02:00
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

The Five-minute Rule Thirty Years Later and its Impact on the Storage Hierarchy
-------------------------------------------------------------------------------

http://www.renata.borovica-gajic.com/data/adms2017_5minuterule.pdf

Appuswamy, Raja, et al. "The five minute rule thirty years later and its impact
on the storage hierarchy." Proceedings of the 7th International Workshop on
Accelerating Analytics and Data Management Systems Using Modern Processor and
Storage Architectures. No. CONF. 2017.

In 1987, five minute rule, which means data accessed for every 5 or less
minutes are better to be in DRAM than HDD, has found.  As the storage devices
emerge, the rule has revisited for every decade.  This paper revisits it again,
in 2017.

This paper classifies storage devices in four tiers: performance, capacity,
archival, and backup.

Data for latency-sensitive interactive analytics should be in the performance
tier, while data for latency-insensitive batch analytics should be in the
storage tier.

For state-of-the-art PCIe SSDs, the bread-even interval predicted by the
five-minute rule is less than a minute.

The break-even interval between the devices are as below:

- DRAM-HDD: 5m in 1987, 5m in 1997, 1.5h in 2007, and 4h in 2017
- DRAM-SSD: 15m in 2007, 7m for read / 24m for write in 2017 (a sentence in the
  paper says this is only 40 seconds in 2017, confusing...  Maybe for 3D XPoint
  like things only)
- SSD-HDD: 2.26h in 2007, 1d in 2017


Exploring the Design Space of Page Management for Multi-Tiered Memory Systems
-----------------------------------------------------------------------------

https://www.usenix.org/conference/atc21/presentation/kim-jonghyeon

Kim, Jonghyeon, Wonkyo Choe, and Jeongseob Ahn. "Exploring the Design Space of
Page Management for Multi-Tiered Memory Systems." 2021 {USENIX} Annual
Technical Conference ({USENIX}{ATC} 21). USENIX} Association, 2021.

This paper explores a better way for tiered memory management.  It considers
access tier of each page in addition to the access locality (whether the page
is placed on the local memory or remote memory).  That is, Linux uses local
PMEM instead of remote DRAM, when local DRAM is full.  This paper says it
should use remote DRAM instead in the case, as remote DRAM is faster than local
PMEM.  Based on the finding, the authors proposes their new page placement
scheme, which uses AutoNUMA facility to check access frequency and do
demotion/promotion proactively.  The authors says it achieves 3.5x speedup
compared to Intel's recent approach, which Huang Ying is doing.

For the evaluation, the authors has used graph500, SpecACCEL, GraphMat, and
Liblinear.
