---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-06-15T06:58:49+02:00
lastmod: 2021-06-15T06:58:49+02:00
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

[PATCH v11 00/33] Memory folios ("Matthew Wilcox (Oracle)") (33+ msgs) (Matthew Wilcox)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210614201435.1379188-1-willy@infradead.org

Eleventh version of the memory folios patchset.  It helps easier handling of
head and tails of compounded pages.


[LSF/MM TOPIC] Tiered memory accounting and management (Tim Chen)
-----------------------------------------------------------------

https://lkml.kernel.org/r/475cbc62-a430-2c60-34cc-72ea8baebf2c@linux.intel.com

Another LSF/MM topic for discussion of tiered memory accounting and management,
including the DRAM to PMEM demotion and PMEM to DRAM promotion.


[REMINDER] LSF/MM/BPF: 2021: Call for Proposals (Josef Bacik)
-------------------------------------------------------------

https://lkml.kernel.org/r/60ca126b.1c69fb81.90af4.93a7@mx.google.com

This mail reminds LSF/MM/BPF is still planned as an in person conference.


LPC 2021: Plumbers Performance and Scalability track (Davidlohr Bueso)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20210616175935.pnnkjrtzywasmdso@offworld

The 'Performance and Scalability track' for LPC will be back this year.  This
email is to confirm key participants and gather more topics to discuss there.


[PATCH v5 -mm 0/6] Introduced multi-preference mempolicy (Feng Tang)
--------------------------------------------------------------------

https://lkml.kernel.org/r/1623987884-43576-1-git-send-email-feng.tang@intel.com

The patchset for mutiple memory policy has revised to fifth version.


[LSF/MM/BPF TOPIC] Userspace managed memory tiering (Wei Xu)
------------------------------------------------------------

https://lkml.kernel.org/r/CAAPL-u8Xz=BkTzgyf1o4yh3T2usD=yRfBOUWdLez2AAqooox3A@mail.gmail.com

Wei proposes to discuss userspace-managed memory tiering and the kernel support
for that in the LSF/MM/BPF.


Linux 5.13-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjj38E8hW+unHZ9EaJrS6x+4Tnz0qffjvLcGf70dXkKnQ@mail.gmail.com

Seventh release candidate for v5.13 released without remakable changes.  The
last week was calm.  Networking has some changes, but most of those were just
small.  If the trend goes on, we will get v5.13 next week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc7..v5.13-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-06-21 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc7-only.png)
