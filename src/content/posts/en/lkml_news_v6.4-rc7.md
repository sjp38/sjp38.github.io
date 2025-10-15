---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-06-13T07:28:47-07:00
lastmod: 2023-06-13T07:28:47-07:00
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

[GIT PULL] hotfixes for 6.4-rc7 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230612122712.f495e24b80f88f58557ea470@linux-foundation.org

Andrew sent hot fixes pull request to Linus Torvalds.  The one for DAMON is
also contained.


[PATCH stable 5.10 0/1] Fix memleak during hotremove memory (Ma Wupeng)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230614061900.3296725-1-mawupeng1@huawei.com

Ma found a memory leak in memory hotplugging, and providing a patch.


[ANNOUNCE/CFP] CXL Microconference at LPC 2023 (Davidlohr Bueso)
----------------------------------------------------------------

https://lkml.kernel.org/r/a4c2gx2tnm4ckax7qkx2trnvmqjssfytc45sb2zikuayd2marc@rpsjp4icgsvn

Davidlohr announces CXL microconference has accepted for LPC this year, and
inviting people in the call for participation.  The microconference focuses on
Linux CXL driver and userspace components for CXL 2.0 and beyond.


[RFC 0/4] memory tiering: calculate abstract distance based on ACPI HMAT (Huang Ying)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230616070538.190042-1-ying.huang@intel.com

This RFC patchset adds memory node abstract distance calculation mechanism that
provides implementations based on ACPI HMAT and dax/kmem driver.


[net-next,v2] tcp: Use per-vma locking for receive zerocopy (Arjun Roy)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20230616193427.3908429-1-arjunroy.kdev@gmail.com

Ths patchset makes zerocopy receiving to use per-VMA locking.  It reduces the
perf cycle from 1% to 0.45%.


Linux 6.4-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjtPpxeR0t980F8P+pkQ-wNLiH2fpyjxUFJNWGMYRmnuA@mail.gmail.com

There was not small mptcp selftest updates, which made it works on stable
kernel too.  Except that, the last week had no particular thing stands out.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13..v6.4-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-04-17 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.4-rc7-only.png)
