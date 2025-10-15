---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.10-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-11-04T07:08:08+01:00
lastmod: 2020-11-04T07:08:08+01:00
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

[PATCH v7 0/9] KFENCE: A low-overhead sampling-based memory safety error detector (Marco Elver)
-----------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201103175841.3495947-1-elver@google.com

The 7th version of KFENCE.  Now the authors say they believe this is ready to
be included in the mm tree.  And, it has now merged in the -mm tree.


[PATCH] page_frag: Recover from memory pressure (Matthew Wilcox)
----------------------------------------------------------------

https://lkml.kernel.org/r/20201105042140.5253-1-willy@infradead.org

After an extreme memory pressure, some non-essential packets can be dropped
because the 'page_frag' allocator do the drops to recover from the memory
pressure but it doesn't change back the behavior even after the recovery.  This
commit fixes this.


[PATCH v6 0/1] mmap_lock: add tracepoints around lock acquisition (Axel Rasmussen)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20201105211739.568279-1-axelrasmussen@google.com

Sixth version of adding tracepoints for `mmap_lock` acquisition.  This will be
helpful for the mmap locking contention understanding.


Linux 5.10-rc3
--------------

https://lkml.kernel.org/r/CAHk-=wiZtabGDAxTbxaAkxf7QjuJSK7c7mcZXFkrYjRfXmSnmQ@mail.gmail.com

Normal rc3 released.  There is no particular thing in terms of the size and
distribution of changes.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.20-rc3..v5.10-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-11-09 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.10-rc3-only.png)
