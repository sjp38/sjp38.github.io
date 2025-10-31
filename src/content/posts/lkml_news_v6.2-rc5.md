---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.2-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-01-17T07:37:29-08:00
lastmod: 2023-01-17T07:37:29-08:00
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

[RFC] memory pressure detection in VMs using PSI mechanism for dynamically inflating/deflating VM memory (Sudarshan Rajagopalan)
--------------------------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/DS0PR02MB90787835F5B9CB9771A20329C4C09@DS0PR02MB9078.namprd02.prod.outlook.com

Qualcomm's Linux memory team asks upstream's opinion about their userspace
deamon approach for controlling VM memory size based on memory demands via
monitoring PSI.


[PATCH v1 0/3] Introduce per NUMA node memory error statistics (Jiaqi Yan)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20230116193902.1315236-1-jiaqiyan@google.com

On huge memory systems, memory error is inevitable, so detailed statistics of
it helps administrators to operate systems more efficiently.  This patchset
adds NUMA level memory error statistics.


[PATCH v6 0/3] cachestat: a new syscall for page cache state of files (Nhat Pham)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230117195959.29768-1-nphamcs@gmail.com

Sixth version of the patchset for efficient page cache state of files
collection has posted.


[PATCH v6 0/5] shoot lazy tlbs (Nicholas Piggin)
------------------------------------------------

https://lkml.kernel.org/r/20230118080011.2258375-1-npiggin@gmail.com

The lazy tlb shootdown patchset is revised with last suggested modification
from Andy and Linus.


Linux 6.2-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wg+E9tTCrSqBOxejUX11f8ebyRWQ+4exC=cmOEupX_d7Q@mail.gmail.com

Unlike the expectation, the winter holidays season effect is not finished.  The
fifth releae candidate of Linux v6.2 ended up having some size.  Linus also
note that Linux v6.2 will have rc8 regardless of this, as we apparently lost
one or two weeks.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc6..v6.2-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-01-23 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.2-rc5-only.png)
