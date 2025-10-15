---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-05-07T06:36:45-07:00
lastmod: 2024-05-07T06:36:45-07:00
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

[LSF/MM/BPF TOPIC] Locally attached memory tiering (David Rientjes)
-------------------------------------------------------------------

https://lore.kernel.org/e90dc785-c4e6-47e4-8eda-d35325c82ff9@google.com

David suggests a new LSFMM topic for local-attached memory tiering.


[LSF/MM/BPF TOPIC] CXL Development Discussions (Adam Manzanares)
----------------------------------------------------------------

https://lore.kernel.org/9bf86b97-319f-4f58-b658-1fe3ed0b1993@nmtadam.samsung

Adam suggests a new LSFMM topic for general CXL development.


kdevops BoF at LSFMM (Luis Chamberlain)
---------------------------------------

https://lore.kernel.org/CAB=NE6XyLS1TaAcgzSWa=1pgezRjFoy8nuVtSWSfB8Qsdsx_xQ@mail.gmail.com

Luis suggests to have a time slot for sharing ongoing developments and changes
for kdevops, which automates complex kernel development workflows.


[RFC PATCH 0/2] introduce budgt control in readahead (Zhaoyang Huang)
---------------------------------------------------------------------

https://lore.kernel.org/20240509023937.1090421-1-zhaoyang.huang@unisoc.com

Because there is no control on `ra->size` during readahead, over-sized bio
caused over-limit bandwidth valud from fio test in the throttling group.
Zhaoyang proposes having a budget control for readahead.


[LSF/MM/BFP TOPIC] Deprecate SPARSEMEM and have only SPARSEMEM_VMEMMAP (Oscar Salvador)
---------------------------------------------------------------------------------------

https://lore.kernel.org/Zj3i0pCJd3ETxQNU@localhost.localdomain

Oscar proposes yet another LSFMM topic for deprecating SPARSEMEM to have only
SPARSEME_VMEMMAP.


[GIT PULL] hotfixes for 6.10 (Andrew Morton)
--------------------------------------------

https://lore.kernel.org/20240510131743.cf12a22295edd6ae4c175d5b@linux-foundation.org

Andrew sent a hotfix pull request for 6.9 to Linus Torvalds.  The subject says
it is for 6.10, but actually it is for 6.9.


Linux 6.9 (Linus Torvalds)
--------------------------

https://lore.kernel.org/CAHk-=whnKYL-WARzrZhVTZ8RP3WZc24C9_DT7JMJooONNT2udQ@mail.gmail.com

Linus Torvalds released Linux 6.9 on time.  There are some known regressions
and some file system fixes for bcachefs and ksmbd last week stands out, but
Linus believes those are not real problems.  Linus also introduces his new
powerful arm64 machine.
