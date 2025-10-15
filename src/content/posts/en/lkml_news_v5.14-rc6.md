---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-08-10T07:23:37+02:00
lastmod: 2021-08-10T07:23:37+02:00
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

[PATCH v9 1/2] mm: introduce process_mrelease system call (Suren Baghdasaryan)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210809185259.405936-1-surenb@google.com

9th version of the patchset which introducing a new system call for releasing
memory of a process in a speedy manner.


mmotm 2021-08-09-19-18 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210810021934.XcpwGUEMn%akpm@linux-foundation.org

-mm tree updated.


[PATCH 0/5] x86: Impplement support for unaccepted memory (Kirill A. Shutemov)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210810062626.1012-1-kirill.shutemov@linux.intel.com

Some platforms like Intel TDX or AMD SEV-SNP require memory to be accepted
before it can be used by the guest.  Because the acceptance operation is
existance, this patchset implements on-demand memory acceptance for TDX.


[RFC PATCH] folio: Add a function to get the host inode for a folio (David Howells)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/162880453171.3369675.3704943108660112470.stgit@warthog.procyon.org.uk

This RFC adds a function `folio_inode()` which gets the host inode from a
folio's mapping.


mmotm 2021-08-12-17-34 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210813003532.rn9wMWItF%akpm@linux-foundation.org

mmotm updated.  29 patches added, one dropped
(shmem_swapin_page-fix-error-processing-for-get_swap_device.patch), and three
modified.


[RFC][PATCH] netfs, afs, ceph: Use folios (David Howells)
---------------------------------------------------------

https://lkml.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk

This patchset makes netfs helper library and the afs filesystem to use memory
folios.


Linux 5.14-rc6 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wi8=9QbNFFZ1PwZ=J-3w6LkhF68_rEns-mN1DCJrYo1qQ@mail.gmail.com

Another fairly normal rc release.  Changes spread over usual subsystems.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc6..v5.14-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-08-16 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.14-rc6-only.png)
