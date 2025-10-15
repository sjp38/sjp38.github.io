---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-09-06T07:48:25-07:00
lastmod: 2022-09-06T07:48:25-07:00
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

[LPC 2022] Kernel Memory Management Microconference - next Monday! (Vlastimil Babka)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/e918dd3c-aa71-c510-4a50-4f9882bca3e8@suse.cz

Vlastimil and Matthew are reminding about the kernel memory management
microconference, which will be held as a part of the LPC this year, in Dublin.


[PATCH v6 00/44] Add KernelMemorySanitizer infrastructure (Alexander Potapenko)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220905122452.2258262-1-glider@google.com

Sixth iteration of the KMSAN infra patchset has posted.


[PATCH v3 0/2] Introduce CABA helper process tree (Pavel Tikhomirov)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20220908140313.313020-1-ptikhomirov@virtuozzo.com

Current linux process tree looses the information in which subtree the child
was originally born, after the children is died and therefore reparented.  This
patchset introduces a new data structure called CABA tree to use as the process
tree for keeing the information, as it could be helpful for CRIU to restore the
process tree.


[PATCH 0/6] Remove CONFIG_EMBEDDED (Lukas Bulwahn)
--------------------------------------------------

https://lkml.kernel.org/r/20220908104337.11940-1-lukas.bulwahn@gmail.com

This patchset describes the history of `CONFIG_EMBEDDED` and why it would be
better to be removed, and removes it.


Linux 6.0-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjG0js0MpsoH3-yvp05u_gXHu+uhkvqdAZDVb=9xUmX=g@mail.gmail.com

After yet another one week, another rc released.  Nothing scared, just normal.


Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc6..v6.0-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-09-11 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.0-rc5-only.png)
