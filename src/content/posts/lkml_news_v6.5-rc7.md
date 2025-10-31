---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.5-rc7"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2023-08-15T06:38:39-07:00
lastmod: 2023-08-15T06:38:39-07:00
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

[MAINTAINERS SUMMIT] Handling of embargoed security issues -- security@korg vs. linux-distros@ (Jiri Kosina)
------------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm

Yet another maintainers summit agenda proposal about security issue handling
has posted.  There are securitiy@korg and linux-distros@.  The kernel community
wants to do handling of the security fixes from only security@, without being
bothered by linux-distros@.  Jiri proposes to discuss about if it could
eventually better handled with linux-distros@.


Maintainers Summit 2023 Call for Topics (Theodore Ts'o)
-------------------------------------------------------

https://lkml.kernel.org/r/20230815052947.GA3214753@mit.edu

The CFP for the maintainers summit of this year has posted.  Already some
interesting topics have suggested to ksummit@lists.linux.dev.


[PATCH 0/5] use refcount+RCU method to implement lockless slab shrink (part 1) (Qi Zheng)
-----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230816083419.41088-1-zhengqi.arch@bytedance.com

Qi Zheng is splitting their lockless slab shrink
[patchset](https://lore.kernel.org/lkml/20230807110936.21819-1-zhengqi.arch@bytedance.com/)
into three parts and posting the first part.


[MAINTAINERS SUMMIT] timing of releases, scheduling shutdowns and their impact on maintainer burnout
----------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230815090023.1bf2e833@kernel.org

Yet another maintainer summit topic for maintainer burnout.


[MAINTAINERS SUMMIT] Quality standards for embargoed code (Sasha Levin)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/ZNuuvS5BtmjcazIv@sashalap

One problem about embargoed fixes is that those are usually developed under the
hood, without the many eyeballs.  As a result, the quality of those are not
that guaranteed.  Sasha suggests a maintainer summit topic for making a
standard process for ensuring the qulity.


[PATCH v32 0/6] Implement IOCTL to get and optionally clear info about PTEs (Muhammad Usama Anjum)
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230816113049.1697849-1-usama.anjum@collabora.com

This patchset adds `PAGEMAP_SCAN` ioctl to emulate Windows `GetWriteWatch()`
and `ResetWriteWatch()` systemcalls.


[PATCH -V2 0/4] memory tiering: calculate abstract distance based on ACPI HMAT (Huang Ying)
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20230816080024.105554-1-ying.huang@intel.com

Second version of the patchset for adding abstract distance calculation
algorithm management mecanism for various types of memory devices.


[PATCH 0/4] Improve mm documentation (Matthew Wilcox)
-----------------------------------------------------

https://lkml.kernel.org/r/20230818200630.2719595-1-willy@infradead.org

Willy is fixing kernel documentation comments errors in mm/, and link all of
those to rst documents.


Linux 6.5-rc7 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whD0w46GUTwp_tyzjZRg8Nk-U2e3ucM7EntKPfn+iOSAw@mail.gmail.com

The seventh release candidate, which usually the last rc of the regular
release, has released a little bit earlier than usual, since Linus is
travelling in a timezone other than his usual one.  Things continue looking
normal, though Linus feels many maintainers are on the vacation.  That's same
for DAMON maintainer ;) Nevertheless, Linus tries to be optimistic, so probably
we will have the v6.5 Linux kernel next Sunday.

FYI, I'm traveling with a laptop that I don't use for building this blog in
usual, and having trouble at doing it with the laptop I brought to this travel.
I don't think I will fix it soon.  I'm writing this post in usual time (in
unusual timezone), but the publishment might be after I finish my travel.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.14..v6.5-rc7.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2021-08-20 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc6 releases in the last two years.

![rc7 release stat](/img/kernel_release_stat/v6.5-rc7-only.png)
