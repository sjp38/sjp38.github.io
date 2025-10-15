---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-11-08T07:15:10-08:00
lastmod: 2022-11-08T07:15:10-08:00
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

[PATCH v2] mm: anonymous shared memory naming (Pasha Tatashin)
--------------------------------------------------------------

https://lkml.kernel.org/r/20221107184715.3950621-1-pasha.tatashin@soleen.com

Second version of the patch for allowing shared anonymous memory mapping naming
has posted.


Deprecating and removing SLOB (Vlastimil Babka)
-----------------------------------------------

https://lkml.kernel.org/r/b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz

Vlastimil is describing his proposal for removing SLOB, mainly for the code
maintenance overhead, and trying to continue discussions for that.


[PATCH 1/4] mm: introduce 'encoded' page pointers with embedded extra bits (Linus Torvalds)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221109203051.1835763-1-torvalds@linux-foundation.org

Linus Torvalds has posted a patchset for a new type called `struct
encoded_page`, which is for `struct page` pointers having extra flags in it.


[GIT PULL] slab fixes for 6.1-rc4 (Vlastimil Babka)
---------------------------------------------------

https://lkml.kernel.org/r/87a751bc-34be-b96e-f157-9c841d153f52@suse.cz

Vlastimil sent a pull request for slab fixes to Linus Torvalds.


[GIT PULL] hotfixes for 6.1-rc5 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20221111171202.b8b7ff671c97cb9782ad8e78@linux-foundation.org

Andrew sent a pull request for hotfixes.  A DAMON fix for a syzbox-found bug is
also included.


Linux 6.1-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wicGu7PD25w7BCdvxRcs6Yvo-BPwCkzSYjM2CYtDjz2kg@mail.gmail.com

Unlike Linus' expectation, 6.1-rc5 didn't shrink but had commits as many as
6.1-rc4.  No real strange things stands out, but if it doesn't shrink down now,
Linux says he would have the extra week for 6.1.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc5..v6.1-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-11-14 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.1-rc5-only.png)
