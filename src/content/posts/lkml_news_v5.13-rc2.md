---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.13-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-05-11T21:11:05+02:00
lastmod: 2021-05-11T21:11:05+02:00
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

[RESEND] LSF/MM/BPF: 2021: Call for Proposals (Josef Bacik)
-----------------------------------------------------------

https://lkml.kernel.org/r/60997079.1c69fb81.77f3f.a045@mx.google.com/

CFG for LSF/MM/BPF 2021 posted.  It will be held from 2021-12-06 to 2021-12-08
in Palm Springs, California.  As of now, it is supposed to be an in-person
conference!


[LSF/MM/BPF TOPIC] Memory folios (Matthew Wilcox)
-------------------------------------------------

https://lkml.kernel.org/r/YJlzwcADaxO/JHRE@casper.infradead.org

Matthew expects the memory folios patchset will be merged soon, but he wants to
discuss about it in the LSFMM, if there are something to discuss more.


[PATCH] mm/lru: Add folio LRU functions (Matthew Wilcox)
--------------------------------------------------------

https://lkml.kernel.org/r/20210513122702.2245882-1-willy@infradead.org

This patch makes LRU code to use the page folio interface.  Owing to the
reduced head/tail pages handling code, about 800 bytes of kernel text saved.


Linux 5.13-rc2 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgX-4PTGAH7kRvqHYiq9wPJ-zN6jhLsuOAj6cG__g9N9A@mail.gmail.com

Second release candidate for the 5.13 released.  Unlike the rc1, which was
bigger than usual, this release is smaller than average, but still seems it's
only in noise.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.2-rc2..v5.13-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-05-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.13-rc2-only.png)
