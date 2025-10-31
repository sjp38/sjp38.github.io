---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-07-18T06:49:03-07:00
lastmod: 2023-07-18T06:49:03-07:00
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

[PATCH v4 0/6] Add support for memmap on memory feature on ppc64 (Aneesh Kumar K.V)
-----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230718024409.95742-1-aneesh.kumar@linux.ibm.com

The fourth version of the patchset for support of `memmap on memory` on ppc64
has posted.


[GIT PULL] hotfixes for 6.5-rc2 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20230718123131.5ec065527c2127a568e5754c@linux-foundation.org

Andrew sent mm subsystem hotfixes for 6.5 rc2 to Linus.


[PATCH v2 0/5] Invalidate secondary IOMMU TLB on permission upgrade (Alistair Popple)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com

This patch moves secondary TLB invcalidation mmu notifier callbacks to
architecture specific TLB flushing functions.  The first version of the patch
make build failures, so v2 has posted.


[PATCH v3 0/5] Invalidate secondary IOMMU TLB on permission upgrade (Alistair Popple)
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com

The second version of this patchset caused NULL dereference issue.  This
version fixes it.


[PATCH] mm/hotplug: Enable runtime update of memmap_on_memory parameter (Aneesh Kumar K.V)
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230721131951.306706-1-aneesh.kumar@linux.ibm.com

This makes `memmap_on_memory` modue parameter permission from read only to
read-write, so that it can be updated at runtime.


[RFC PATCH] Documentation/page_tables: MMU, TLB, and Page Faults (Fabio M. De Francesco)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230722004451.7730-1-fmdefrancesco@gmail.com

This patch extends `page_tables.rst` by adding  asection for MMU, TLB, and page
faults.


Linux 6.5-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wi4Yau-3Bsv2rXYmtXMTLaj3=Wyf4cdM6d89czFvkVsRQ@mail.gmail.com

Like last week, things continue to look pretty normal without anything stands
out, according to Linus Torvalds.  As a result, the third v6.5 release
candidate is available.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14-rc4..v6.5-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-07-24 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc2 releases in the last two years.

![rc2 release stat](/img/kernel_release_stat/v6.5-rc3-only.png)
