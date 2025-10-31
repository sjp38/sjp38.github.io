---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.6-rc5"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-10-03T06:47:07-07:00
lastmod: 2023-10-03T06:47:07-07:00
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

[PATCH 0/5] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses (Alexandre Ghiti)
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231002151031.110551-1-alexghiti@rivosinc.com

A patchset for making all page table entries accesses use
``READ_ONCE()/WRITE_ONCE()``, to avoid compiler reordering of the accesses.


[PATCH v1 0/3] mm/gup: Introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file pages (Vivek Kasireddy)
-------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20231003074447.3245729-1-vivek.kasireddy@intel.com

A patchset introducing a new function for long-term pages pinning.


[RFC PATCH v3 0/3] Introduce persistent memory pool (Stanislav Kinsburskii)
---------------------------------------------------------------------------

https://lkml.kernel.org/r/169645773092.11424.7258549771090599226.stgit@skinsburskii.

An RFC implementing a memory allocator in the kernel for persistent memory has
posted.  It maintains kernel specific states like DAM, IOMMU, and kexec.


[PATCH v2 0/2] New selftest for mm (Breno Leitao)
-------------------------------------------------

https://lkml.kernel.org/r/20231005163922.87568-1-leitao@debian.org

A patsetset for adding a selftest that reproduces a page fault races with
`madvise()` has posted.


Linux 6.6-rc5 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wh7awamHE3ujoxZFcGMg3wvLTk8UZYSm3m7vUDhpmP2+A@mail.gmail.com

Unlke the rc4, which looked a little smaller maybe due to absence of the
networking pull request, rc5 looks back to normal.  The networking pull looks
more clear than usual, but that's just because of the quiet last week.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.15-rc6..v6.6-rc5.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-10-09 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc5 releases in the last two years.

![rc5 release stat](/img/kernel_release_stat/v6.6-rc5-only.png)
