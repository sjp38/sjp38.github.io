---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc6"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-07-15T06:50:00+02:00
lastmod: 2020-07-15T06:50:00+02:00
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

[PATCH v3] x86/mm: use max memory block size on bare metal (Daniel Jordan)
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20200714205450.945834-1-daniel.m.jordan@oracle.com

On x86, smallest supported block size is 128MiB.  This means it needs to create
16,288 sysfs directories for 2TiB memory system.  This sysfs creation takes
significant amount of the boot time.  As the memory hotplug is frequenlty used
for the virtualized systems, this commit makes the kernels that aren't running
on a hypervisor to use largest block size (2GiB) on big machines.

The author says the kernel boot time has been 7% faster after applying this
patch on the 2TiB memory system.


[patch] mm, memcg: provide a stat to describe reclaimable memory (David Rientjes)
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/alpine.DEB.2.23.453.2007142018150.2667860@chino.kir.corp.google.com

Under memory pressure, some of the memory can be reclaimed, so free memory plus
some of reclaimable memory is called available memory.  This is provided by
``/proc/meminfo`` file, but that for each ``memcg`` is not.  This patch adds
the value in ``memory.stat`` file in memcg sysfs.


[RFC for Linux v4 0/2] virtio_balloon: Add VIRTIO_BALLOON_F_CONT_PAGES to report continuous pages (Hui Zhu)
-----------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1594867315-8626-1-git-send-email-teawater@gmail.com

This patchset adds ``VIRTIO_BALLOON_F_CONT_PAGES`` to ``virtio_balloon``.  If
this flag is given, ``virtio_balloon`` tries to inflate and deflate with
continuous pages.


Linux 5.8-rc6 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wj_gy9xpqFx_aLTtLtFTCTKKLfV9E2bgE5J2GeKit3MCg@mail.gmail.com

We have seen some fluctuations in the rcs of this year.  Fortunately, this week
rc release looks normal to Torvalds, though it is a big release.  I guess 5.8
will be released in the normal manner.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc7..v5.8-rc6.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2018-07-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc4 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v5.8-rc6-only.png)
