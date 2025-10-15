---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.18-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-03-22T06:59:56+01:00
lastmod: 2022-03-22T06:59:56+01:00
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

[LSF/MM TOPIC] Improving OOM debugging (Ken Overstreet)
-------------------------------------------------------

https://lkml.kernel.org/r/20220322005101.actefn6nttzeo2qr@moria.home.lan

Ken proposes an LSF/MM slot for discussing OOM debugging situation improvement
with two ideas from his side.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220322143803.04a5e59a07e48284f196a2f9@linux-foundation.org

Andrew Morton has sent 227 patches to Linus Torvalds, as the first batch of the
pull requests for v5.18.  It includes DAMON patches including pid hiding and
its sysfs interface, and merged.


[PATCH 0/2] mm: madvise: return exact bytes advised with process_madvise under error (Charan Teja Kalla)
--------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1648046642.git.quic_charante@quicinc.com

`process_madvise()` can partially success, but it doesn't allow users to know
that.  As a result, the user should merely repeat the call until it's perfectly
success.  This commit tries to help the situation.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220323160453.65922ced539cbf445b191555@linux-foundation.org

41 more patches from Andrew Morton for various subsystems except mm have sent
to Linus Torvalds.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220324180758.96b1ac7e17675d6bc474485e@linux-foundation.org

Andrew sent 114 patches for mm subsystem, which were staged after willystuff in
-next tree.


[GIT PULL] Multi-gen LRU for 5.18-rc1 (Yu Zhao)
-----------------------------------------------

https://lkml.kernel.org/r/20220326010003.3155137-1-yuzhao@google.com

Yu is directly sending a pull request for multi-gen LRU to Linus.  Wondering if
this will be merged as is, as Linus asks if this has been tested in -next and
-mm, which is not the case.


[PATCH v2 0/3] shmem: Allow userspace monitoring of tmpfs for lack of space. (Gabriel Krisman Bertazi)
------------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220328020443.820797-1-krisman@collabora.com

This patch adds two sysfs counters for monitoring tmpfs.


[PATCH v2 RESEND] arm64: mm: hugetlb: add support for free vmemmap pages of HugeTLB (Muchun Song)
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220329045535.45641-1-songmuchun@bytedance.com

This patch makes HugeTLB vmemmap pages freeing be supported on arm64.


[PATCH] mm: migrate: set demotion targets differently (Jagdish Gediya)
----------------------------------------------------------------------

https://lkml.kernel.org/r/20220329115222.8923-1-jvgediya@linux.ibm.com

There is some limits at sharing demotion targets between multiple nodes for
identifying the demotion targets.  This patch helps the situation.


[PATCH v2 00/48] Add KernelMemorySanitizer infrastructure (Alexander Potapenko)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220329124017.737571-1-glider@google.com

This patchset adds a uninitialized memory use error detector infrastructure in
the kernel.


mmotm 2022-03-30-13-01 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220330200158.2F031C340EC@smtp.kernel.org

-mm of the second has updated.  It is rebased on v5.17, added 86 new patches,
modified 13 patches, and dropped 445 patches.  In total, 122 patches in the
queue.


mmotm 2022-03-31-20-37 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20220401033845.8359AC2BBE4@smtp.kernel.org

-mm of the moment has updated.  It's based on v5.17, added 58 new patches,
modified 27 existing patches, and dropped 17 patches.  In total, 163 patches in
the queue.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20220401112740.351496714b370467a92207a6@linux-foundation.org

16 more patches for mm has sent from Andrew Morton to Linus, and merged in.


Linux 5.18-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com

After the two weeks, the merge window for v5.18 has closed and the first
release candidate has released.  Diffstat looks very weird due to the AMD's
generated register definitions, but others are faily normal.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.7-rc2..v5.18-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-04-04 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v5.18-rc1-only.png)
