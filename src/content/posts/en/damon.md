---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON: Data Access Monitor"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm", "projects"]
categories: ["damon"]
date: 2019-12-27T18:21:07+01:00
lastmod: Fri Oct 18 11:57:51 PDT 2024
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
projects: ["damon"]
---

__!! NOTE !!__

This post has migrated to https://damonitor.github.io/posts/damon.  This
out-dated post will be removed soon.

---

With increasingly data-intensive workloads and limited DRAM capacity, optimal
memory management based on dynamic access patterns is becoming increasingly
important. Such mechanisms are only possible if accurate and efficient dynamic
access pattern monitoring is available.

DAMON is a Data Access MONitoring framework subsystem for the Linux kernel
developed for such memory management.  It is designed with some key mechanism
(refer to [Design](https://docs.kernel.org/mm/damon/design.html) for the
detail) that make it

- accurate (the monitoring output is useful enough for DRAM level memory
  management; It might not be appropriate for CPU Cache levels, though),
- light-weight (the monitoring overhead is low enough to be applied online),
  and
- scalable (the upper-bound of the overhead is in constant range regardless of
  the size of target workloads).

Therefore, DAMON can be used to develop memory management based on any access
pattern. To make it easier to develop such systems, DAMON provides a feature
called DAMON-based Operation Schemes (DAMOS). This allows DAMON users to
develop and execute access-aware memory management without code but with a
simple setup.

Simple mechanisms based on DAMOS can
[achieve](https://www.amazon.science/publications/daos-data-access-aware-operating-system)
up to 12% performance improvement and 91% memory savings.  Detailed evaluation
of DAMON and DAMON-based system optimizations are available at another
[post]({{< ref "damon_evaluation.md" >}}).

DAMON is also currently being used in real-world products including AWS
[Aurora Serverless v2](https://www.amazon.science/publications/resource-management-in-aurora-serverless)
and SK hynix [HMSDK v2](https://github.com/skhynix/hmsdk/tree/hmsdk-v2.0).

Table Of Contents
-----------------

- [Demo Video](#demo-video)
- [Demo Screenshot](#demo-screenshot)
- [Recent News](#recent-news)
- [Getting Started](#getting-started)
- [Install](#install)
- [Source Code](#source-code)
- [User-space Tool](#user-space-tool)
- [Tests Package](#tests-package)
- [Official Document](#official-document)
- [Showcase Website](#showcase-website)
- [Evaluation Results](#evaluation-results)
- [DAMON-based System Optimization Guide](#damon-based-system-optimization-guide)
- [Profile-Guided Optimization Example](#profile-guided-optimization-example)
- [Community](#community)
- [Contribution](#contribution)
- [Publications and Presentations](#publications-and-presentations)


Demo Video
----------

![damo monitor for water_nsquared](/img/damo_monitor_water_nsquared.gif)

{{< youtube l63eqbVBZRY >}}


Demo Screenshot
---------------

![masim stairs snapshot](/img/masim_stairs_snapshot.png)
![masim stairs heatmap in ascii](/img/masim_stairs_heatmap_ascii.png)


Recent News
-----------

Below are only a short list of recent news.  For __complete list of the news__,
please refer to a dedicated [post]({{< ref "damon_news.md" >}}).

_2024-10-15_: DAMON debugfs interface removal RFC patch has
[posted](https://lore.kernel.org/20241015175412.60563-1-sj@kernel.org).

_2024-10-10_: Monthly PyPI downloads of DAMON user-space too, DAMO, doubled
again after ten days.
[!damo_9000_monthly_downloads](/img/damo_download_9213.png)
[!damo_rolling_monthly_downloads_2024-10-10](/img/damo_rolling_monthly_downloads_2024-10-10.png)

_2024-10-08_: Videos for
[DAMON recipes](https://youtu.be/xKJO4kLTHOI?feature=shared) at Open Source
Summit EU'2024 and
[DAMON long-term plans](https://youtu.be/mRU1ZeNB9WY?feature=shared) at Kernel
Memory Management Microconference'2024 are uploaded to YouTube.

_2024-10-01_: 2024-Q3 DAMON news letter including news for new features,
more users, repos reorganizations, and conference talks is
[posted](https://lore.kernel.org/20241001191425.588219-1-sj@kernel.org).

_2024-09-30_: DAMON User Space Tool, DAMO,
[surpasses](https://pypistats.org/packages/damo) 4,000 monthly PyPI downloads!
![damo_4000_monthly_downloads](/img/damo_download_4122.png)


Getting Started
---------------

You can start using DAMON by
- installing [DAMON-enabled kernel](#install) and its
  [user-space tool](#user-space-tool),
- following the [tutorial](https://github.com/damonitor/damo#getting-started) of
  the user-space tool, and
- run the automated [tests suite](#tests-package).

By following those, you will be able to know if DAMON works on your machine and
how you can use it.

You can also [participate](#contribution) in the development if you're
interested.


Install
-------

DAMON is implemented in the Linux kernel, so you should install DAMON-enabled
Linux kernel to use it.  To check if you're already running DAMON-enabled
kernel, you could:

    $ if grep -q '^CONFIG_DAMON=y' /boot/config-$(uname -r);
    then
        echo "installed"
    else
        echo "not installed"
    fi

As of 2024-09-23, kernels of Linux distros including Amazon Linux, Android,
Arch, CentOS, Debian, Fedora, and Oracle Linux are known to have enabled DAMON.

You could further find a list of DAMON-enabled Linux kernels from Oracle's
kconfigs
[tool](https://oracle.github.io/kconfigs/?config=UTS_RELEASE&config=DAMON).
The tool doesn't support every distros at the moment, though.

If your package system doesn't support DAMON-enabled kernel, you can
fetch a DAMON-merged Linux kernel [source tree](#source-code), build, and
install it.  Note that you should enable kernel configuration options for
DAMON, depending on your demands.  For example:

    $ cd $THE_FETCHED_DAMON_KERNEL_SOURCE_TREE
    $ make olddefconfig
    $ echo 'CONFIG_DAMON=y' >> ./.config
    $ echo 'CONFIG_DAMON_VADDR=y' >> ./.config
    $ echo 'CONFIG_DAMON_PADDR=y' >> ./.config
    $ echo 'CONFIG_DAMON_SYSFS=y' >> ./.config
    $ echo 'CONFIG_DAMON_DBGFS=y' >> ./.config
    $ echo 'CONFIG_DAMON_RECLAIM=y' >> ./.config
    $ echo 'CONFIG_DAMON_LRU_SORT=y' >> ./.config
    $ make -j$(nproc)
    $ sudo make modules_install install


Source Code
-----------

There are several Linux kernel source trees having DAMON for different users.
You may pick one among those based on your needs.

For users who want a __stable__ version of DAMON, Linus Torvalds'
[mainline tree](https://git.kernel.org/torvalds/h/master) is recommended.

If you have interests in DAMON features under __development__, below trees will
be appropriate.  These trees contain latest version of DAMON which having
features under development.

- [mm-unstable](https://git.kernel.org/akpm/mm/h/mm-unstable) contains the
  latest DAMON patches, which are under testing with other unstable memory
  management subsystem patches.  So this tree is likely unstable and frequently
  updated, but would be a good baseline for your DAMON development.
- [damon/next](https://git.kernel.org/sj/h/damon/next) contains the latest
  changes, which might not tested at all.  So this tree is likely more unstable
  and frequently updated than mm-unstable.  This tree also contains some
  changes that exist only for DAMON hacks itself rather than eventually be
  merged in the mainline.

For people who have interest in DAMON features under development but use LTS
kernels as their baseline, three _were_ trees that based on three latest LTS
kernels.

NOTE: Below trees were continuously getting DAMON backports on latest 5.4.y,
5.10.y, and 5.15.y.  But those are deprecated as of 2022-09-03, and therefore
there will be no update to the trees.

- [damon/for-v5.15.y](https://git.kernel.org/sj/h/damon/for-v5.15.y)
- [damon/for-v5.10.y](https://git.kernel.org/sj/h/damon/for-v5.10.y)
- [damon/for-v5.4.y](https://git.kernel.org/sj/h/damon/for-v5.4.y)

The source code of DAPTRACE, which is a prototype of DAMON, is also
[available](https://github.com/daptrace).


User-space Tool
---------------

A user-space tool for DAMON, which is called DAMO (Data Access Monitoring
Operator), is available at
[Github](https://github.com/damonitor/damo) and
[PyPi](https://pypi.org/project/damo/).  You may start using DAMON by following
the [Getting Started](https://github.com/damonitor/damo#getting-started) of the
tool for start.


Tests Package
-------------

There is a [tests suite](https://github.com/damonitor/damon-tests) for
correctness verification and performance evaluation of DAMON.  Those are
actively used for the development of DAMON.  Using that, you can test DAMON on
your machine with only a few simple commands or deeply understand the user
interface of DAMON.

So, if you finished the
[tutorial](https://github.com/damonitor/damo#getting-started) but have no idea
about what to do next, running the tests would be a good start.  If any test
fails, please report that to the maintainer via mail (sj@kernel.org or
damon@lists.linux.dev) or
[github](https://github.com/damonitor/damon-tests/issues).


Official Document
-----------------

The official document of DAMON in the latest mainline for
[users/sysadmins](https://docs.kernel.org/admin-guide/mm/damon/index.html) and
[kernel programmers](https://docs.kernel.org/mm/damon/index.html) are
available.  Those for next major release are also available([users/sysadmins
doc](https://docs.kernel.org/next/admin-guide/mm/damon/index.html), [kernel
programmers doc](https://docs.kernel.org/next/mm/damon/index.html)).


Showcase Website
----------------

There is a showcase [website](https://damonitor.github.io/_index) that you can
get more information of DAMON.
The site hosts

- the heatmap format dynamic access pattern of various realistic workloads for
  [heap](https://damonitor.github.io/test/result/visual/latest/rec.heatmap.0.png.html)
  area,
  [mmap()-ed](https://damonitor.github.io/test/result/visual/latest/rec.heatmap.1.png.html)
  area,
  and
  [stack](https://damonitor.github.io/test/result/visual/latest/rec.heatmap.2.png.html)
  area,
- the dynamic working set size
  [distribution](https://damonitor.github.io/test/result/visual/latest/rec.wss_sz.png.html)
  and chronological working set
  size [changes](https://damonitor.github.io/test/result/visual/latest/rec.wss_time.png.html),
  and
- daily performance test
  [results](https://damonitor.github.io/test/result/perf/index.html).


Evaluation Results
------------------

Evaluation of DAMON and DAMON-based system optimizations are
[available]({{< ref "damon_evaluation.md" >}}).


DAMON-based System Optimization Guide
-------------------------------------

A guide for DAMON-based system optimizations are also
[available]({{< ref "damon_optimization_guide.md" >}}).


Profile-Guided Optimization Example
-----------------------------------

An example of DAMON-based profile-guided optimization is also
[available]({{<ref "damon_profile_callstack_example.md" >}}).


Community
---------

DAMON is maintained and developed by its own community, which is a sub-set of
the linux kernel development community.

The community is mainly driven by the mailing list (damon@lists.linux.dev).
All the patches are posted there and reviewed.  Almost every discussions are
also made there.

For easy communication, a mailing tool called
[HacKerMaiL](https://github.com/sjp38/hackermail) is recommended.  The tool
is maintained by DAMON maintainer and committed to support DAMON community.

If you prefer web-based interface for reading the mails, you can use
[lore](https://lore.kernel.org/damon/).  If you prefer the traditional
subscription based mailing workflow, you can subscribe to the mailing list via
[subspace.kernel.org](https://subspace.kernel.org/lists.linux.dev.html)
following the [instruction](https://subspace.kernel.org/#subscribing).  

The community also have an open, regular, and informal virtual bi-weekly
meeting series for DAMON community called DAMON Beer/Coffee/Tea chat
[series](https://lore.kernel.org/damon/20220810225102.124459-1-sj@kernel.org/).


Contribution
------------

DAMON and its related projects including
[`damo`](https://github.com/damonitor/damo) and
[`hackermail`](https://github.com/sjp38/hackermail) are open source projects.
You can contribute to the development following the guidelines.  Please refer
to below contribution guidelines of each project to further look into the
process.

- [DAMON](https://www.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html)
- [damo](https://github.com/damonitor/damo/blob/next/CONTRIBUTING)
- [hkml](https://github.com/sjp38/hackermail/blob/master/CONTRIBUTING)


Publications and Presentations
------------------------------

Below are featured and/or upcoming publications and presentations covering
DAMON.
For __more complete list__ of those, please refer to another
dedicated [post]({{< ref "damon_publications_talks.md" >}}).

_What to read/cite?_

For people who more familiar to academic papers, DAMON papers for
[Middleware'19 Industry](https://dl.acm.org/doi/abs/10.1145/3366626.3368125)
and
[HPDC'22](https://dl.acm.org/doi/abs/10.1145/3502181.353146) are recommended to
read and/or cite.  The paper for Middleware'19 covers DAMON's monitoring
mechanisms and access pattern profiling-guided optimizations.  The paper for
HPDC'22 extends the coverage to DAMOS (automated access-aware system
operations) and user-space driven auto-tuning.

- SeongJae Park, __DAMON: Long-term Plans for Kernel That {Just
  Works,Extensible}.__ In Linux Kernel Memory Management Microconferenct at
  Linux Plumbers, Sep 2024.
  [Slides](https://lpc.events/event/18/contributions/1768/attachments/1637/3383/damon_longtern_plans_kmm_mc_lpc.pdf),
  [Video](https://youtu.be/mRU1ZeNB9WY?feature=shared),
  [Link](https://lpc.events/event/18/contributions/1768/)
- SeongJae Park, __DAMON Recipes: Ways to Save Memory Using a Linux Kernel
  Subsystem in the Real World.__ In Open Source Summit Europe, Sep 2024.
  [Slides 1](https://static.sched.com/hosted_files/osseu2024/50/damon_recipes_osseu_2024_overall.pdf?_gl=1*9ygnyb*_gcl_au*MTE4NTExNjkzLjE3MjU5MjQ4NzQ.*FPAU*MTk0NDY0NTM3LjE3MjI0MzA5MjA.),
  [Slides 2](https://static.sched.com/hosted_files/osseu2024/68/damon_recipes_osseu_hmsdk.pdf?_gl=1*9ygnyb*_gcl_au*MTE4NTExNjkzLjE3MjU5MjQ4NzQ.*FPAU*MTk0NDY0NTM3LjE3MjI0MzA5MjA.),
  [Video](https://youtu.be/xKJO4kLTHOI?feature=shared),
  [Link](https://sched.co/1ej2S)
- Jonathan Corbet, __An update and future plans for DAMON.__ In Linux Weekly
  News, May 2024.
  [Article](https://lwn.net/Articles/973702/)
- SeongJae Park, __DAMON Updates and Plans: Automation of DAMON tuning,
  tiering, and VM guest scaling.__
  In _Linux Storage | Filesystem | MM & BPF Summit_, May 2024.
  [Slides](https://github.com/damonitor/talks/blob/master/2024/lsfmmbpf/damon_lsfmmbpf_2024.pdf),
  [Video](https://youtu.be/ywmwXq01ySA?feature=shared),
  [Link](https://docs.google.com/spreadsheets/d/176LXLys9Uh6A-Eal2flrzcbUSJMUXGkGwyihr9jAAaQ/edit?usp=sharing)
- Jonathan Corbet, __An update and future plans for DAMON.__ In Linux Weekly
  News, May 2024.
  [Article](https://lwn.net/Articles/973702/)
- SeongJae Park, __DAMO[N,S]?: Implementing Self-Driven Data Access-Aware
  Efficient Linux System.__ In Open Source Summit North America, Apr 2024.
  [Slides](https://static.sched.com/hosted_files/ossna2024/ff/damo_damon_damos_ossummit_na_2024.pdf),
  [Video](https://youtu.be/vP5x5P47S1U?feature=shared),
  [Link](https://sched.co/1aBOg)
- SeongJae Park, __DAMON: Current Status and Future Plans.__
  In Kernel Summit, Nov 2023.
  [Slides](https://lpc.events/event/17/contributions/1624/attachments/1340/2732/damon_status_and_plans_kernel_summit_2023_11_15.pdf),
  [Video](http://www.youtube.com/watch?v=rwHCGA3ppT4),
  [Link](https://lpc.events/event/17/contributions/1624/)
- SeongJae Park, __Data Access Monitoring Operator (DAMO): User-Space
  Tool/Python Library for Access-Aware Profiling and Optimization of Your Linux
  Systems.__
  In Open Source Summit Europe, Sep 2023.
  [Slides](https://static.sched.com/hosted_files/osseu2023/92/damo_ossummit_eu_2023.pdf?_gl=1*ddzen2*_ga*NTQ4MTgzOTIyLjE2Nzg4MTE1NzY.*_ga_XH5XM35VHB*MTY5NTE5NDc1My4xNS4xLjE2OTUxOTc4NTUuNjAuMC4w),
  [Video](https://youtu.be/i7_W8-MozxY?si=AFhtdAzTbJJJFeGE),
  [Link](https://sched.co/1OGf9)
- Jonathan Corbet, __A 2023 DAMON update.__ In Linux Weekly News, May 2023.
  [Article](https://lwn.net/Articles/931769/)
- SeongJae Park, __DAMON, DAMOS, and DAMO: Kernel Subsystems and User-Space
  Tools for Data Access-Aware System Analysis/Optimizations.__
  In _Open Source Summit North America_, May 2023.
  [Slides](https://github.com/damonitor/talks/blob/master/2023/ossummit_na/damon_damos_damo_ossummit_na_2023.pdf),
  [Video](https://youtu.be/fImXcHS5PPE),
  [Link](https://sched.co/1K5HS)
- SeongJae Park, __DAMON updates and future plans.__
  In _Linux Storage | Filesystem | MM & BPF Summit_, May 2023.
  [Slides](https://github.com/damonitor/talks/blob/master/2023/lsfmmbpf/damon_lsfmmbpf_2023.pdf),
  [Video](https://www.youtube.com/watch?v=bbC23ApPvow),
  [Link](https://events.linuxfoundation.org/lsfmm/program/schedule-at-a-glance/)
- SeongJae Park, __Current Status and Future Plans of DAMON.__
  In _The Linux Kernel Summit_, September 2022.
  [Slides](https://lpc.events/event/16/contributions/1224/attachments/1107/2137/damon_status_plan_ksummit_2022.pdf),
  [Video](https://youtu.be/e2SZoUPhDRg?t=13245),
  [Link](https://lpc.events/event/16/contributions/1224/)
- Jonathan Corbet, __LRU-list manipulation with DAMON.__ In Linux Weekly News,
  August 2022.  [Article](https://lwn.net/Articles/905370/)
- SeongJae Park, Madhuparna Bhowmik, Alexandru Uta, __DAOS: Data Access-aware
  Operating System.__ In _The 31st International ACM Symposium on
  High-Performance Parallel and Distributed Computing (HPDC'22)_, June 2022.
  [Paper](https://www.amazon.science/publications/daos-data-access-aware-operating-system),
  [Slides](https://damonitor.github.io/misc/daos_hpdc_2022_slides.pdf),
  [Poster](https://damonitor.github.io/misc/daos_hpdc_2022_poster.pdf)
- Jonathan Corbet, __Using DAMON for proactive reclaim.__ In Linux Weekly News,
  July 2021.  [Article](https://lwn.net/Articles/863753/)
- Jonathan Corbet, __Memory-management optimization with DAMON.__ In Linux
  Weekly News, February 2020.
  [Article](https://lwn.net/Articles/812707/)
- SeongJae Park, Yunjae Lee, Heon Y. Yeom, __Profiling Dynamic Data Access
  Patterns with Controlled Overhead and Quality.__ In 20th ACM/IFIP
  International Middleware Conference Industry, December 2019.
  [Paper](https://dl.acm.org/citation.cfm?id=3368125)
