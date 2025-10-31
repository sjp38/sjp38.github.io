---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.9-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2024-04-09T06:39:36-07:00
lastmod: 2024-04-09T06:39:36-07:00
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

[PATCH v4 0/9] transfer page to folio in KSM (Alex Shi)
-------------------------------------------------------

https://lkml.kernel.org/r/20240409092826.1733637-1-alexs@kernel.org

Alex sent the first patchset for making KSM uses folios.


[PATCH] tracing: Add new_exec tracepoint (Marco Elver)
------------------------------------------------------

https://lkml.kernel.org/r/20240408090205.3714934-1-elver@google.com

Marco sent a patch for adding a new tracepoint.  The tracepoint is for tracing
a case where new exec starts while having original state including the mm.


Announcing Community Engagement Working Group (Nikolai Kondrashov)
------------------------------------------------------------------

https://lkml.kernel.org/r/bf81be70-61ec-4169-b66a-5c3136869107@gmail.com/

KernelCI project announces Community Engagement Working Group which will
purpose to connect with kernel maintainers and discuss test quality improvement
for their subsystems.


[PATCH] mm,page_owner: Defer enablement of static branch (Oscar Salvador)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20240409131715.13632-1-osalvador@suse.de

To fix a memory leak that Kefeng reported, Oscar wrote this patch that defers
enablement of static branches that could causes races otherwise.


[PATCH v2] tracing: Add sched_prepare_exec tracepoint (Marco Elver)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20240411102158.1272267-1-elver@google.com

Marco sent the second version of `new_exec` tacepoint patchset renaming it to
`sched_prepare_exec`.


Linux 6.9-rc4 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whdUP62_7N6s837tTFjvmcGxyRnMGwnVnZwn2fDVf5E8A@mail.gmail.com

Linux 6.9-rc4 is out without nothing special for Linus.  Linus mentions the
hardware mitigation for BHI is not special anymore, since such mitigations
existed more than a decade now.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/linux_stat_v6.9-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/lazybox using below command:

    $ relstat.py --since 2022-04-15 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc4 release stat](/img/kernel_release_stat/v6.9-rc4-only.png)
