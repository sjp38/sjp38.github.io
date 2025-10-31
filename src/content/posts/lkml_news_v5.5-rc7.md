---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-01-18T10:11:47+01:00
lastmod: 2020-01-18T10:11:47+01:00
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

REMINDER: LSF/MM/BPF: 2020: Call for Proposals
----------------------------------------------

https://lkml.kernel.org/r/20200115215409.5pd4fnoawqzs7rvw@jbacik-mbp

This is reminder of the LSF/MM/BPF of this year.  It underscores the submitters
to also send the mail to the appropriate mailing list as before.  Maybe a few
of people are missing sending mail but only wite up their proposal to the
google form.


[LSF/MM TOPIC] Free Page Reporting
----------------------------------

https://lkml.kernel.org/r/4b8671d16573307da09afc56030c2a5f5a9c45bf.camel@linux.intel.com

In case of KVM case, as each VM guest receives virtual memory from the host,
only when host gets memory pressure the memory being used by guests will be
reclaimed.  And, the reclaimation could make the guests suffer as the host
cannot know what pages are free in the guest and thus could swap out hot data
of guests.  As an answer, free pages hinting mechanisms has discussed.  I think
the basic idea is somewhat similar to the proactive reclamation.  Author of
this mail is working for it and already posting the patchset.  He wants to
discuss about it in this year LSFMM.


[PATCH v2 0/5] introduce memory hinting API for external process
----------------------------------------------------------------

https://lkml.kernel.org/r/20200116235953.163318-1-minchan@kernel.org

The second version of the `madvise_process()` system call.  Modified its
interface to support both pid and pidfd.


Linux 5.5-rc7
-------------

https://lkml.kernel.org/r/CAHk-=wjvkH0xJF6yF72VZOF7cifFv3nH9qhGGZh8urLg5xWt=Q@mail.gmail.com

As worried, things picked up this week.  Half of all merges has arrived to
Torvalds during the last two days of the week.  That said, Torvalds says he
will release 5.5 next week if this was not real picking up of works.  If not
and it is real pick up due to the holiday season, he will instead release rc8.

Other than that, things looks fairly normal.  Torvalds asks more tests.
