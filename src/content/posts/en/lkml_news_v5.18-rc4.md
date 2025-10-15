---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-04-20T08:40:25+02:00
lastmod: 2022-04-20T08:40:25+02:00
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

LSF/MM/BPF 2022: Running BOF (Matthew Wilcox)
---------------------------------------------

https://lkml.kernel.org/r/Yl7TUDtLcrhXcp1g@casper.infradead.org

Matthew is proposing a running BOF, which would do discussions while running
after a breakfast.


mmotm 2022-04-20-17-12 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220421001235.5F4E0C385A0@smtp.kernel.org

-mm tree has updated.  It's rebased on 5.18-rc3, added 69 patches modified 126
patches, and dropped 35 patches.  In total, 291 patches in the queue.


[PATCH v2] mm: make minimum slab alignment a runtime property (Peter Collingbourne)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220421211549.3884453-1-pcc@google.com

This makes slab alignment a runtime property and only align to 16 if KASAN is
enabled at runtime.


[PATCH v4 0/4] memcg: introduce per-memcg proactive reclaim (Yosry Ahmed)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/20220421234426.3494842-1-yosryahmed@google.com

This patch introduces a new memcg file, `memory.reclaim`.  The file will allow
users request kernel to reclaim a fixed amount of pages.


[PATCH v3 0/7] mm: demotion: Introduce new node state N_DEMOTION_TARGETS (Jagdish Gediya)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220422195516.10769-1-jvgediya@linux.ibm.com

The third version of the patchset for introducing new node state for making
better NUMA-demotion decision.


[PATCH v2 0/7] mm: introduce shrinker debugfs interface (Roman Gushchin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220422202644.799732-1-roman.gushchin@linux.dev

The second version of the patchset for adding debugfs interface for better
understanding and debugging of the memory shrinkers.


Linux 5.18-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=whmtHMzjaVUF9bS+7vE_rrRctcCTvsAeB8fuLYcyYLN-g@mail.gmail.com

Fourth week for v5.18 has passed normal and calm, so we are having the 4th
release candidate.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc4..v5.18-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-04-25 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.18-rc4-only.png)
