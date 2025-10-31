---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News after v5.7-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-04-17T06:46:40+02:00
lastmod: "Mon Apr 20 06:56:33 CEST 2020"
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

[RFC] autonuma: Support to scan page table asynchronously (Huang Ying)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20200414081951.297676-1-ying.huang@intel.com

AutoNUMA is currently scanning page tables of the processes in the process
context and therefore this can increase the latency of the process.  This RFC
thus makes the page table scanning asynchronous if there are idle CPUs.


[PATCH v4 00/10] Add a new mmap locking API wrapping mmap_sem calls
-------------------------------------------------------------------

https://lkml.kernel.org/r/20200415004353.130248-1-walken@google.com

This is just a repost of the patch series rebased on v5.7-rc1.


Linux 5.7-rc2 (Linux Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wiQsJu-ZFjt7+c9FVD5R40khtZiihrT+7O3UaVvHYz=HQ@mail.gmail.com

After a week pass since the rc1 release, rc2 is released.  Torvalds says the
changes are very normal and clam as always, maybe because rc2 is usually the
time for taking breathe after the busy merge window.
