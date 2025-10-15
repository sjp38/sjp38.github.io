---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-01-26T03:52:17+01:00
lastmod: 2020-01-26T03:52:17+01:00
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

[PATCH 0/8] Introduce Data Access MONitor (DAMON)
-------------------------------------------------

https://lkml.kernel.org/r/20200120162757.32375-1-sjpark@amazon.com

This is the patchset for the DAMON.


Paging out when free memory is low but not exhausted (and available memory remains high)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/e994b0a76099437b8edbae925e9ccac8@its-mail-p04.registry.otago.ac.nz

This mail introduces an issue on 5.3 and 5.4 kernel that page out is occurred
needlessly.  The author uses ``stress`` and ``dd`` to stress memory but still
leave some memory in the system.  However, the system does swap excessively.


[LSF/MM/BPF TOPIC] Do not pin pages for various direct-io scheme
----------------------------------------------------------------

https://lkml.kernel.org/r/20200122023100.75226-1-jglisse@redhat.com

Another talk proposal for the LSF/MM this year.  Due to the pinning of the
pages for direct I/O, several mm activities including compaction and migration
cannot work well.  Author want to convert direct io code to obey mmu nitofier
to help this situation.


Linux 5.5
---------

https://lkml.kernel.org/r/CAHk-=wigRZ6TSJU09bMk3Df2DiOw83B7TrQUq+iXroQCK5EVAQ@mail.gmail.com

Unlike my expectation, Torvalds released 5.5 instead of eighth rc release.
There were some changes in network and some of core files, but David told
Torvalds the changes are not worth for another rc.

So, the merge window has started.  That said, Torvalds says that he will have
some travel and some things to do during next two weeks, and thus he is hoping
those things to go well.  Also, he want everybody to understand though he makes
soem delay due to the reason.
