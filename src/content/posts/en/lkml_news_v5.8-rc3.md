---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-06-24T06:48:53+02:00
lastmod: 2020-06-24T06:48:53+02:00
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

[TECH TOPIC] restricted kernel address spaces (Mike Rapoport)
-------------------------------------------------------------

https://lkml.kernel.org/r/20200621090539.GM6493@linux.ibm.com

A new kernel summit talk proposal is made.  This topic is recycled from the
LSF/MM/BPF, which scheduled but canceled due to the COVID19.


[PATCH] mm: filemap: clear idle flag for writes (Yang Shi)
----------------------------------------------------------

https://lkml.kernel.org/r/1593020612-13051-1-git-send-email-yang.shi@linux.alibaba.com

This patch adds missed idle flag clearing in filemap writing.


`+ mm-madvise-introduce-process_madvise-syscall-an-external-memory-hinting-api-fix-2.patch added to -mm tree`
-------------------------------------------------------------------------------------------------------------

https://marc.info/?l=linux-mm-commits&m=159303823314812&w=2

The `process_madvise()` patch has merged in the `-mm` tree again.


Linux 5.8-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whNe2Gx=kgK6ucK_Bo0xCXh6g7HLQTHacQqsVZ8G1NPpw@mail.gmail.com

Unlike the rc2 release, this release is big, as expected by the huge rc1
release.  Among the 94 releases in last 2 years, this release has 20th biggest
diff.  Among the 11 -rc3 releases in the last 2 years, it's 4th biggest diff.
That said, Torvalds says this is just the expected result and there
is no scary point.  This will not make the rc period by itself.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc4..v5.8-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-06-29 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc3-only.png)
