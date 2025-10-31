---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.0-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-09-20T06:59:44-07:00
lastmod: 2022-09-20T06:59:44-07:00
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

[RFC PATCH] mm: track bad page via kmemleak (Zhaoyang Huang)
------------------------------------------------------------

https://lkml.kernel.org/r/1663679468-16757-1-git-send-email-zhaoyang.huang@unisoc.com

This RFC patch makes bad pages to be tracked via kmemleak.


[PATCH v1 0/3] coding-style.rst: document BUG() and WARN() rules (David Hildenbrand)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220920122302.99195-1-david@redhat.com

There was a recent discussion on when to use `BUG()` and `WARN()` and the
variants.  This patch tries to make it clearly described in `coding-style` doc
and `checkpatch` script.


[RFC 0/6] migrate_pages(): batch TLB flushing (Huang Ying)
----------------------------------------------------------

https://lkml.kernel.org/r/20220921060616.73086-1-ying.huang@intel.com

This RFC patch tries to do TLB flushing for `migrate_pages()`, which is
currently be done for every page one by one.


[PATCH 00/12] slab: Introduce kmalloc_size_roundup() (Kees Cook)
----------------------------------------------------------------

https://lkml.kernel.org/r/20220922031013.2150682-1-keescook@chromium.org

This patchset introduces `kmalloc_size_roundup()` to replace anticipatory
resizing uses of `ksize()`.


[PATCH v4] mm/demotion: Expose memory tier details via sysfs (Aneesh Kumar K.V)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220922102201.62168-1-aneesh.kumar@linux.ibm.com

Fourth version of the patch for exposing details of memory tier construction
via sysfs has posted.


[PATCH v2 0/2] coding-style.rst: document BUG() and WARN() rules (David Hildenbrand)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220923113426.52871-1-david@redhat.com

The second version of the patch for making the document clear about difference
in `BUG()` and `WARN()` has posted.


Linux 6.0-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wjc_CDPy5WbN=e_FtPrd0Yn2Wp4JcdRByeyDoM9azK1mA@mail.gmail.com

Due to the LPC and OSSummit EU, Torvalds suspected the release of 6.0 might be
delayed one week, but that didn't happen.  The rc7 is bigger than the average,
but not the outlier.  So we could imagine the 6.0 to be released in the
expected schedule, in the next week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc7..v6.0-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-09-26 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc7 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.0-rc7-only.png)
