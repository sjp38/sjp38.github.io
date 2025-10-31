---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.4-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-06-06T07:19:57-07:00
lastmod: 2023-06-06T07:19:57-07:00
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

As of 2023-06-06, for some reason https://lore.kernel.org/linux-mm seems
stopped being updated since 2023-05-31.  On the day of 2023-06-06, the update
has resumed.


[PATCH v3 0/5] riscv: Introduce KASLR (Alexandre Ghiti)
-------------------------------------------------------

https://lkml.kernel.org/r/20230606123242.20804-1-alexghiti@rivosinc.com

This patchset introduces KASLR, which allows kernel mapping randomization, for
riscv.



Question about oom-killer (Gou Hao)
-----------------------------------

https://lore.kernel.org/linux-mm/A31B3EA06AF77F13+c7278bd0-2695-4cc0-5a56-531a06ac2389@uniontech.com/

A question about oom-killer behavior that suspected to be a kernel bug.


[PATCH v3] Documentation/mm: Initial page table documentation (Linus Walleij)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20230608125501.3960093-1-linus.walleij@linaro.org

Linus Walleij wrote down the documentation for page table, based on an earlier
blog post at people.kernel.org.


[PATCH v2 0/6] Per-vma lock support for swap and userfaults (Suren Baghdasaryan)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230609005158.2421285-1-surenb@google.com

The per-vma lock patchset skipped swap and userfaults cases.  This patchset
further implement logics for supporting those with per-vma lock and add the
support.


Linux 6.4-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgmbjQu3bVSa5JJhEymeQhkr7N3cjg-CoNLVituUnfW8w@mail.gmail.com

The sixth release candidate of Linux v6.4 has released.  No hugely interesting
happened last week, according to Linus Torvalds' opinion.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.13-rc7..v6.4-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-06-12 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc6 release stat](/img/kernel_release_stat/v6.4-rc6-only.png)
