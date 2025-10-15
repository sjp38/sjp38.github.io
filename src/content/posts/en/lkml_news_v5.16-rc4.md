---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.16-rc4"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-11-30T07:20:32+01:00
lastmod: 2021-11-30T07:20:32+01:00
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

mmotm 2021-11-29-18-58 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211130025839.ZhVoO1W_7%akpm@linux-foundation.org

mmotm has updated.  It's based on v5.16-rc3, adds 52 new patches, modifies 18
existing patches, and drops 2 patches.  In total, 224 patches in the queue.


[QUESTION] “place pages to tail” regress memory read bandwidth about 10% under our test cases (liupeng)
-------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/3c6349ddd9a34732a251467b7fa4fe93@huawei.com

Liu Peng found David's patch 7fef431be9c9(mm/page_alloc: place pages to tail in
`__free_pages_core()`) incurring performance regression, and asking some
suggestions.


[RFC PATCH] mm: count zram read/write into PSI_IO_WAIT (Huangzhaoyang)
----------------------------------------------------------------------

https://lkml.kernel.org/r/1638356341-17014-1-git-send-email-huangzhaoyang@gmail.com

This RFC patch adds zram reads/writes counts in `PSI_IO_WAIT`.


[PATCH v4 00/66] Introducing the Maple Tree (Liam Howlett)
----------------------------------------------------------

https://lkml.kernel.org/r/20211201142918.921493-1-Liam.Howlett@oracle.com

Fourth version of the maple tree, which is another tree-based structure.  The
authors believe this could be used instead of rbtree for many cases including
the VMAs management.  Compared to the previous version, several features are
added and the iteration part has 40% faster.


[RFD] clear virtual machine memory when virtual machine is turned off (Fei Luo)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/CAMgLiBskDz7XW9-0=azOgVJ00t8zFOXjdGaH7NLpKDfNH9wsGQ@mail.gmail.com

Memory for a KVM process would contain sensitive data of the virtual machine.
Even though the virtual machine is turned off, the memory will contain the data
for a long time, unless be reused by other processes.  This mail proposes
clearing the memory even before the memory is reused by other processes.


mmotm 2021-12-02-17-04 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20211203010516.HJH82Eku8%akpm@linux-foundation.org

MMOTM has uploaded.  It's now based on v5.16-rc3.  This time it adds 33 new
patches, modifies 55 pre-existing patches, and drops 2 patches.  In total, 255
patches are in the queue.


[PATCH linux-next] delayacct: track delays from memory compact (wangyong)
-------------------------------------------------------------------------

https://lkml.kernel.org/r/1638542272-15187-1-git-send-email-wang.yong12@zte.com.cn

Linux kernel allows user space to know from where and how long delays have
made.  The tracking targets include CPU, IO, SWAP, RECLAIM, and THRASHING.
This commit adds delays due to COMPACT there.


[PATCH v2 0/4] page table check (Pasha Tatashin)
------------------------------------------------

https://lkml.kernel.org/r/20211204182314.1470076-1-pasha.tatashin@soleen.com

This patchset ensure page tables are correct by doing `page->_refcount` check.
This version fixes some bugs and support loadable modules.


Linux 5.16-rc4 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wguTgfhqftuf6FnW-KZ7zhQGDNktr_POKUkJ6SuMeQuWQ@mail.gmail.com

Normal, fairly small fourth release candidate for v5.16.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.5-rc2..v5.16-rc4.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-12-06 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3

And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.16-rc4-only.png)
