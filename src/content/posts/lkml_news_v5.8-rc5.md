---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-07-07T07:01:31+02:00
lastmod: 2020-07-07T07:01:31+02:00
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

[PATCH 0/2] KUnit-Kmemleak Integration (Uriel Guajardo)
-------------------------------------------------------

https://lkml.kernel.org/r/20200706210327.3313498-1-urielguajardojr@gmail.com

This patchset makes kunit to use kmemleak to catch memory leak in the test
code.


[PATCH] CodingStyle: Inclusive Terminology (Dan Williams)
---------------------------------------------------------

https://lkml.kernel.org/r/159389297140.2210796.13590142254668787525.stgit@dwillia2-desk3.amr.corp.intel.com

This patch adds a new document for inclusive term usage in the kernel tree.  It
suggests to stop using the terms, 'slave' and 'blacklist' anymore.  This patch
was revised two times and the third revision is merged in Torvalds' tree by the
Friday.


[PATCH V3] mm/vmstat: Add events for THP migration without split (Anshuman Khandual)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1594080415-27924-1-git-send-email-anshuman.khandual@arm.com

This patch adds three new vmstat events for THP migration without split
validation.  The events are ``THP_MIGRATION_(SUCCESS|FAILURE|SPLIT)``.


Linux kernel in-tree Rust support (Nick Desaulniers)
----------------------------------------------------

https://lore.kernel.org/lkml/CAKwvOdmuYc8rW_H4aQG4DsJzho=F+djd68fp7mzmBp3-wY--Uw@mail.gmail.com/

Nick is trying to put LLVM micro conference in the Linux Plumbers Conference.
In the micro-conference, he wants to have a session for the kernel in-tree Rust
support.  For this, this mail asks people whether have interest in the topic.


Linux 5.8-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgX5+Q_trdMPaaQZmko0Og_eqAYoyMa_8S3ie+1Us6rkw@mail.gmail.com

rc4 was smaller than usual, and Torvalds says rc5 is bigger than usual, though
not enormous.  Nonetheless, its mainly due to the networking fixes that didn't
come in rc4, and Torvalds doesn't hear something really scary sound from real
people.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc6..v5.8-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-07-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc5-only.png)
