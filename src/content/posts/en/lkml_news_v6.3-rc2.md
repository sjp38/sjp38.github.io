---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.3-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-03-07T07:40:16-08:00
lastmod: 2023-03-07T07:40:16-08:00
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

[Invitation] Linux MM Alignment Session on Wednesday (David Rientjes)
---------------------------------------------------------------------

https://lkml.kernel.org/r/CAE-26VAFJtSu5xEbzNUgPVn3W13-B1bGvvU8-+i-hkS4GtupCw@mail.gmail.com

David is hosting biweekly meetings for Linux memory management developments
called Linux MM Alignment, and he is publicly inviting people to the meetings.

The next instance will be held on 10:00 PST, 2023-03-08, at
https://meet.google.com/csb-wcds-xya


THP backed thread stacks (Mike Kravetz)
---------------------------------------

https://lkml.kernel.org/r/20230306235730.GA31451@monkey

Mike found THP-always's memory bloat issue due to THP usage for threads'
stacks.  Mike feels it might make no sense to use THP for stacks even if the
THP policy is 'always', and starting discussions on improvment of the
situation.


[PATCH v2 0/3] Ignore non-LRU-based reclaim in memcg reclaim (Yosry Ahmed)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20230309093109.3039327-1-yosryahmed@google.com

Memcg reclaim sometimes over-report the number of reclaimed pages.  This
patchset fixes the issue by ignoring non-LRU-based reclaim.


[PATCH v11 0/7] Implement IOCTL to get and optionally clear info about PTEs (Muhammad Usama Anjum)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230309135718.1490461-1-usama.anjum@collabora.com

This patchset adds a new ioctl, namely `PAGEMAP_SCAN` for `pagemap` file for
getting and clearing page table entries information.  That was already almost
possible for soft-dirty PTE bit, and was used by CRIU.  However, this patchset
makes the feature available for only specific pages.


Linux 6.3-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wii6BZtVKYfvQCQqbE3+t1_yAb-ea80-3PcJ4KxgpfHkA@mail.gmail.com

After the week, second release candidate of Linux kernel v6.3 has released.
Removal of r8188eu driver is dominating the change log.  However, other than
the big change, other things are just normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc4..v6.3-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-03-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.3-rc2-only.png)
