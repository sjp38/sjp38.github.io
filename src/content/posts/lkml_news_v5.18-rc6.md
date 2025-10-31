---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-05-03T09:14:23-07:00
lastmod: 2022-05-03T09:14:23-07:00
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

Memory allocation on speculative fastpaths (Paul E. McKenney)
-------------------------------------------------------------

https://lkml.kernel.org/r/20220503155913.GA1187610@paulmck-ThinkPad-P17-Gen-1

There was a discussion about allocating memory inside RCU read critical section
with `GFP_KERNEL` during LSFMM.  Paul is summing up his points about it in this
mail.


[PATCH] mm,doc: Add new documentation structure (Matthew Wilcox)
----------------------------------------------------------------

https://lkml.kernel.org/r/20220503063032.3680308-1-willy@infradead.org

There was a session for MM documentation in the LSFMM.  Matthew is
restructuring the Documentation files to be more similar to Mel Gorman's
"Understanding the Linux Virtual Memory Manager".


[PATCH v9 00/69] Maple Tree v9 (Liam Howlett)
---------------------------------------------

https://lkml.kernel.org/r/20220504010716.661115-1-Liam.Howlett@oracle.com

Nineth version of the maple tree patchset has posted.


[PATCH v5 00/12] mm: userspace hugepage collapse (Zach O'Keefe)
---------------------------------------------------------------

https://lkml.kernel.org/r/20220504214437.2850685-1-zokeefe@google.com

The fifth version of the patchset for user space direct THP collapse.


[PATCH] mm/memcg: support control THP behaviour in cgroup (Yang Yang)
---------------------------------------------------------------------

https://lkml.kernel.org/r/20220505033814.103256-1-xu.xin16@zte.com.cn

As THP comes with memory bloat issue and `madvise()` could be tricky to use for
someone, this patch adds cgroup-based THP usage knob.


[PATCH v2] mm/memcg: support control THP behaviour in cgroup (Yang Yang)
------------------------------------------------------------------------

https://lkml.kernel.org/r/20220506031804.437642-1-yang.yang29@zte.com.cn

Second version of THP support in cgroup has posted.


[PATCH -next v7 0/6]mm: page_table_check: add support on arm64 and riscv (Tong Tiangen)
---------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220507110114.4128854-1-tongtiangen@huawei.com

Seventh version of the patchset for making the page table check easier to
support new architectures and add support for arm64 and risc-v.


[PATCH v2] mm,doc: Add new documentation structure (Matthew Wilcox)
-------------------------------------------------------------------

https://lkml.kernel.org/r/20220507134947.444287-1-willy@infradead.org

Second version of the patchset for making the mm documentation close to Mel
Gorman's book "Understanding the Linux Virtual Memory Manager" has posted.


Linux 5.18-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com

5.18 merge window included more than usual large number of patches, but the
release candidates are slightly modest, and the trend is continuing to rc6.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc6..v5.18-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-05-09 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc6 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.18-rc6-only.png)
