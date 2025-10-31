---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.15-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-09-01T07:28:13+02:00
lastmod: 2021-09-01T07:28:13+02:00
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

[RFC PATCH] mm/oom: detect and kill task which has allocation forbidden by cpuset limit (Feng Tang)
---------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1630399085-70431-1-git-send-email-feng.tang@intel.com

Docker needs to allocate memory in non-movable zones for creation of an OS
(e.g., `GFP_HIGHUSER`).  However, if it is binded to a cpuset which has only
movable zone, the allocation fails and OOM storm attacks other innocent
processes.  This patch detects the case and kill only the allocation failing
process.


Folios: Can we resolve this please? (David Howells)
---------------------------------------------------

https://lkml.kernel.org/r/3285174.1630448147@warthog.procyon.org.uk

David Howells is trying to resolve the folio issue within this merge window, as
his work also depend on the folio work.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210902144820.78957dff93d7bea620d55a89@linux-foundation.org

The first pull request from Andrew Morton for 212 patches is posted.

`Patch series "Migrate Pages in lieu of discard", v11` is included here.


Report Bug to Linux Memory Management (nzyang@xidian.edu.cn)
------------------------------------------------------------

https://lkml.kernel.org/r/4f29a246.310.17bb4e8e686.Coremail.nzyang@stu.xidian.edu.cn

If a system has too many dirty memory, Linux kernel tries to reduce the dirty
ratio by running a background writeback daemon.  If it doesn't make progress,
kernel makes all I/O write-through.  As a result, all I/O intensive processes
will be slow.  This mail argues that a malicious user can make whole system
slow by intensively dirtying its memory.


Re: [PATCH] Enable '-Werror' by default for all kernel builds (Guenter Roeck)
-----------------------------------------------------------------------------

https://lore.kernel.org/all/20210906142615.GA1917503@roeck-us.net/

Linus Torvalds recently enabled `-WError` compile option, which treats every
build warnings as error.  The intention is to make all kernel build clean.  Of
course, it will cause many build failures.  With this mail, Guenter reports 64
build failures among 153 builds due to this change.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210907195226.14b1d22a07c085b22968b933@linux-foundation.org

Second pull request for memory management subsystem has sent to Linus Torvalds.
The patchset for DAMON also included here.


Merge branch 'akpm' (patches from Andrew) (Linus Torvalds)
----------------------------------------------------------

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2d338201d5311bcd79d42f66df4cecbcbc5f4f2c

Torvalds merged lots of patches in Andrew's second pull request, including
DAMON.  Now, DAMON is in the mainline.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20210908180859.d523d4bb4ad8eec11c61500d@linux-foundation.org

Yet more patches from Andrew, for hotfixes, which also need to be merged in the
stable trees.  Linus quickly merged those.


[RFC PATCH] psi : calc psi memstall time more precisely (Huangzahoyang)
-----------------------------------------------------------------------

https://lkml.kernel.org/r/1631188824-25623-1-git-send-email-huangzhaoyang@gmail.com

This patch makes PSI's memstall time more precise by excluding the task's
off-cpu time.


Linux 5.15-rc1 (Linus Torvalds)
-------------------------------

https://lkml.kernel.org/r/CAHk-=wgbygOb3hRV+7YOpVcMPTP2oQ=iw6tf09Ydspg7o7BsWQ@mail.gmail.com

The merge window is closed and the first release candidate for v5.15 is out.
Number of commits are not so huge.  In fact, smaller than usual of v5.x.
However, number of lines changed are about the average.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.4-rc1..v5.15-rc1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-09-13 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3


And, below is the diffstat of the -rc1 releases in the last two years.

![rc1 release stat](/img/kernel_release_stat/v5.15-rc1-only.png)
