---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1-rc3"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-10-25T06:54:56-07:00
lastmod: 2022-10-25T06:54:56-07:00
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

[PATCH] swap: add a limit for readahead page-cluster value (Kairu Song)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20221023162533.81561-1-ryncsn@gmail.com

``/proc/sys/vm/page-cluster`` could overflow because it has no upper limit.
This patch set its upper-limit as ``2**31``, so that at most ``2**31`` pages
could be read in at once.


[PATCH 0/1] Dead stores in maple-tree (Lukas Bulwahn)
-----------------------------------------------------

https://lkml.kernel.org/r/20221026120029.12555-1-lukas.bulwahn@gmail.com

This patch fixes some dead stores of maple tree that reported by clang
analyzer.


[PATCH v6 00/21] TDX host kernel support (Kai Huang)
----------------------------------------------------

https://lkml.kernel.org/r/cover.1666824663.git.kai.huang@intel.com

This patchset adds support of Intel Trusted Domain Extension (TDX), which
protects guest VMs from malicious host and certain physical attacks.


[GIT PULL] hotfixes for 6.1-rc3 (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20221028140612.43605c62db2ecc73f1bcf929@linux-foundation.org

Andrew sent a batch of hotfixes for Linux 6.1-rc3 to Linus.


Linux 6.1-rc3 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=wgJVNe4mUxGJE5B-_GMg0oOgxkZz3UxehVRiCT3QvoZ0w@mail.gmail.com

Another sunday, another rc.  Rc3 is also big, same to rc2, which was unusually
big.  Nevertheless, this may because people usually starts working from rc2.
Linus hopes the changes to start shrink after this release candidate.


Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.10-rc3..v6.1-rc3.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-10-31 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc3 releases in the last two years.

![rc3 release stat](/img/kernel_release_stat/v6.1-rc3-only.png)
