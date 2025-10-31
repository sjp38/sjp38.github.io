---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-05-11T06:20:47+02:00
lastmod: 2022-05-11T06:20:47+02:00
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

[PATCH v3 0/6] mm: introduce shrinker debugfs interface (Roman Gushchin)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220509183820.573666-1-roman.gushchin@linux.dev

This patchset introduces a descent debugfs interface for debugging the shrinker
mechanism.


[PATCH v3 0/3] Fix CONT-PTE/PMD size hugetlb issue when unmapping or migrating (Baolin Wang)
--------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1652147571.git.baolin.wang@linux.alibaba.com

For PTE-cont or PMD-cont size hugetlb pages, migration or unmapping of poisoned
hugetlb pages which are using `ptep_clear_flush()` and `set_pte_at()` can cause
data consistency issue.  This patchset tries to fix the issue.


[PATCH v4] mm: don't be stuck to rmap lock on reclaim path (Minchan Kim)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220510215423.164547-1-minchan@kernel.org

This patch makes LRU aging path to do `try_lock` so that the reclaim path
doesn't stuck with rmap locks but work with next LRU pages.


[PATCH 0/5 v1] mm, oom: Introduce per numa node oom for CONSTRAINT_MEMORY_POLICY (Gang Li)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220512044634.63586-1-ligang.bdlg@bytedance.com

This patch makes OOM to select the victim to kill from specific node.


RFC: Memory Tiering Kernel Interfaces (v2) (Wei Xu)
---------------------------------------------------

https://lkml.kernel.org/r/CAAPL-u-DGLcKRVDnChN9ZhxPkfxQvz9Sb93kVoX_4J2oiJSkUw@mail.gmail.com

Seond version of the RFC for discussing kernel interface for tiered memory
managements.


Freeing page flags (Matthew Wilcox)
-----------------------------------

https://lkml.kernel.org/r/Yn10Iz1mJX1Mu1rv@casper.infradead.org

There was a discussion about which page flags can be removed in the LSFMM of
this year.  Matthew is starting a thread to more deeply discuss about that.


LSF/MM/BPF 2022: Slides and thanks! (Josef Bacik)
-------------------------------------------------

https://lkml.kernel.org/r/Yn3I7KZeuJQqVFHi@localhost.localdomain

Josef has sent the thank you email to LSFMM attendees.  This mail also asks the
presenters to send thier slides.


[RFC PATCH 0/3] mm/damon/schemes: Extend DAMOS for Proactive LRU-lists Sorting (SeongJae Park)
----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220513150000.25797-1-sj@kernel.org

This is my RFC patchset making DAMON to be used for making the LRU-lists a more
trustworthy source of data access pattern.


[GIT PULL] hotfixes for 5.18-rc7 (Andrew Morton)
------------------------------------------------

https://lkml.kernel.org/r/20220513100825.701c0801de7f18168c4d838c@linux-foundation.org

Hotfixes for v5.18-rc7 has sent from Andrew to Linus.


Linux 5.18-rc7 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg2eVUN0a1E5UnBF1ziGaU1yrMJtnFPg4R78O=FcRDqnA@mail.gmail.com

Things continue to be calm and normal, so the seventh rc for v5.18 has
released.  Torvalds says the most exciting thing last week was that Andrew
started using git and sent pull-request.  Andrew was using patches before.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc6..v5.18-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-05-16 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc7 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.18-rc7-only.png)
