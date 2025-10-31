---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc8"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-02-07T06:32:31-08:00
lastmod: 2023-02-07T06:32:31-08:00
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

[LSF/MM/BPF TOPIC] sframe: An orc like stack unwinder for the kernel to get a user space stacktrace (Steven Rostedt)
--------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230206103828.6efcb28f@rorschach.local.home

Steven Rostedt proposes yet another LSF/MM/BPF topic for using sframe section,
which is introduced by binutils, for more efficient user space stack tracing.


[PATCH v4 00/14] Introduce Copy-On-Write to Page Table (Chih-En Lin)
--------------------------------------------------------------------

https://lkml.kernel.org/r/20230207035139.272707-1-shiyn.lin@gmail.com

Fourth version of the patchset making copy-on-write be used for page table,
while it is currently only used for the mapped memory.


categories: []TCH v2 00/20] CXL RAM and the 'Soft Reserved' => 'System RAM' default (Dan Williams)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/167601992097.1924368.18291887895351917895.stgit@dwillia2-xfh.jf.intel.com

This patchset reworks 'Soft Reserved' policy to designate CXL attached DRAM
like performance differentiated memory as 'System RAM' by default.


[PATCH] psi: reduce min window size to 50ms (Sudarshan Rajagopalan)
-------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1676067791.git.quic_sudaraja@quicinc.com

The minimum window size of PSI is 500ms.  This patch asks the rationale behind
the decision and suggest reducing it to 50ms.


Linux 6.2-rc8 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj1=T1KzpPWbhqfFWOEp5Wf_kj3JjTHSHmEngf0-Vv7aA@mail.gmail.com

The eighth candidate for Linux 6.2 release has released.  It was fairly calm.
This extended stabilization week was not due to any problem, but just to make
the time for early holiday season.  It turned out it might not really needed,
but there was also no reason to change already announced plan.  So we are
having one more week for stabilization of Linux 6.2.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.12-rc1..v6.2-rc8.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-02-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc8 release stat](/img/kernel_release_stat/v6.2-rc8-only.png)
