---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc2"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-05-09T07:31:35-07:00
lastmod: 2023-05-09T07:31:35-07:00
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

[PATCH 0/2] Optimization of CMA allocation and reclaiming (Zhaoyang Huang)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/1683538383-19685-1-git-send-email-zhaoyang.huang@unisoc.com

This patchset avoids being OOMed when all free pages are composed of CMA.


[RFC PATCH 0/2] mm: Working Set Reporting (Yuanchu Xie)
-------------------------------------------------------

https://lkml.kernel.org/r/20230509185419.1088297-1-yuanchu@google.com

This RFC patch adds working set size reporting structure for each node and
total, using MGLRU as its core, and extends virtio-balloon for letting the host
get the information.


[PATCH] MAINTAINERS: repair pattern in DIALOG SEMICONDUCTOR DRIVERS (Lukas Bulwahn)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230509074834.21521-1-lukas.bulwahn@gmail.com

A patch for fixing `get_maintainer.pl` error that comes out while parsing
`MAINTAINERS` file.


[PATCH 0/7] riscv: Memory Hot(Un)Plug support (Paul Walmsley)
-------------------------------------------------------------

https://lkml.kernel.org/r/20230512145737.985671-1-bjorn@kernel.org

A patchset for supporting memory hot(un)plug on RISC-V has posted.


[PATCH] mm: Convert migrate_pages() to work on folios (Matthew Wilcox)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20230513001101.276972-1-willy@infradead.org

Yet another Folio conversion for `migrate_pages()`.


Linux 6.4-rc2 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj3jDtVCi2LqyijGzut2cq=AkPrAMfF0+6gtZ1WB6ruWQ@mail.gmail.com

The kernel release for the Mother's day, 6.4-rc2, has released as usual on
Sunday.  Also quite calm release as usual, because there were no many time for
people to find problems after rc1 release.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc5..v6.4-rc2.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-03-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.4-rc2-only.png)
