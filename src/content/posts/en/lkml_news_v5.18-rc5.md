---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-04-26T06:38:29-07:00
lastmod: 2022-04-26T06:38:29-07:00
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

[PATCH v5 0/4] memcg: introduce per-memcg proactive reclaim (Yosry Ahmed)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220425190040.2475377-1-yosryahmed@google.com

The fifth version of the patchset for adding per-memch proactive reclamation
trigger interface.


mmotm 2022-04-25-17-59 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220426005932.848CBC385A4@smtp.kernel.org

The mmotm has updated.  It has rebased on 5.18-rc4, added 62 new patches,
modified 8 patches, and dropped 19 patches.  In total, 334 patches in the
queue.


[PATCH -V2 0/3] memory tiering: hot page selection (Huang Ying)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220426085105.60822-1-ying.huang@intel.com

This patchset adds hot pages selection to the tiered memory promotion mechanism
for better performance.


[PATCH v8 00/70] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20220426150616.3937571-1-Liam.Howlett@oracle.com

The eighth patchset for Maple tree has updated.  It includes fixes on top of
the version that merged in mglru-maple branch of akpm's tree.


mmotm 2022-04-26-19-29 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220427023010.C52C0C385A4@smtp.kernel.org

The mmotm has updated.  It's based on 5.18-rc4, added 88 new patches, modified
29 patches, and dropped 12 patches.  In total, 410 patches in the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220427124133.cc115bc8acb8de3dda921836@linux-foundation.org

Two fixes for mm subsystem have sent from Andrew to Linus.


[PATCH 0/2] Finalising swap-over-NFS patches (Neil Brown)
---------------------------------------------------------

https://lkml.kernel.org/r/165119280115.15698.2629172320052218921.stgit@noble.brown

This patchet enables swap over NFS works largely.


RFC: Memory Tiering Kernel Interfaces (Wei Xu)
----------------------------------------------

https://lkml.kernel.org/r/CAAPL-u9sVx94ACSuCVN8V0tKp+AMxiY89cro0japtyB=xNfNBw@mail.gmail.com

Wei is proposing a new memory tiering interfaces and requesting comments on it.


Linux 5.18-rc5 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wjUhfhaes6_hMYDQFTbGjkmA-j2ZSeXZ32H66ufRfYrmQ@mail.gmail.com

Unlike the rc4, which released last week and was tiny smaller than usual, a
little bit larger than usual rc5 has released.  It seems it's due to the
smaller rc4.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc5..v5.18-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-05-02 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v5.18-rc5-only.png)
