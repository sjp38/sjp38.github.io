---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON News List"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm", "projects", "news"]
categories: ["damon"]
date: 2023-05-06T11:27:07-07:00
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
projects: []
---

__!! NOTE !!__

This post has migrated to https://damonitor.github.io/posts/damon_news.  This
out-dated post will be removed soon.

---

Below is a list of news around DAMON [project]({{< ref "damon.md" >}}).

This list is not exhaustive but just a DAMON maintainer's collection of news.
If you find a news that should be added to this list, please let us know at
sj@kernel.org and/or damon@lists.linux.dev.

---

2024
----

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

_2024-09-20_: Livestreamed video for DAMON talk at kernel memory management
microconference 2024 is now
[available](https://www.youtube.com/live/CTWQ-d7pj5s?feature=shared&t=20182) at
Youtube.

_2024-09-19_: An academic paper preprint that optimizing THP using DAMON and
BPF, titled "eBPF-mm: Userspace-guided memory management in Linux with
eBPF" is [uploaded](https://arxiv.org/pdf/2409.11220) to ArXiv

_2024-09-16_: `CONFIG_DAMON` is
[enabled](https://salsa.debian.org/kernel-team/linux/-/merge_requests/1172) on
Debian kernel

_2024-08-14_: GitHub repos for non-kernel parts of DAMON project including
'damo', 'damon-tests' and 'damoos' will be
[moved](https://lore.kernel.org/20240813232158.83903-1-sj@kernel.org/) from
'[awslabs](https://github.com/awslabs)' to
'[damonitor](https://github.com/damonitor)', by 2024-09-05

_2024-07-29_: VLDB paper about Aurora Serverless V2, which reveals their usage
of DAMON on the product, is now
[available](https://www.amazon.science/publications/resource-management-in-aurora-serverless).

_2024-07-21_: Memory Management subsystem pull request for Linux v6.11-rc1 is
[posted](https://lore.kernel.org/20240721145415.fbeb01a853962ef91334f3d1@linux-foundation.org)
with DAMON changes for CXL memory
[tiering](https://lore.kernel.org/20240614030010.751-1-honggyu.kim@sk.com),
[documentation](https://lore.kernel.org/20240621163626.74815-1-sj@kernel.org)
of a mailing tool for newcomers, and minor fixups.

_2024-07-18_: DAMON topic for Linux Kernel Memory Management Microconference at
LPC'24 has [accepted](https://lpc.events/event/18/contributions/1768/).

_2024-07-11_: ATC'24 also published two DAMON-citing papers at the same time. The
first [one](https://www.usenix.org/conference/atc24/presentation/nair) proposes
a way to improve monitoring accuracy of DAMON, while the
second [one](https://www.usenix.org/conference/atc24/presentation/tabatabai)
mentions DAMON can be useful for extensible memory management.

_2024-07-11_: A couple of OSDI'24 papers
([1](https://www.usenix.org/conference/osdi24/presentation/xiang),
[2](https://www.usenix.org/conference/osdi24/presentation/zhong-yuhong)) for
memory tiering that references and exploring DAMON as a part of them are
available now.

_2024-07-01_: DAMON Quaterly Newsletter for 2024-Q2 has
[posted](https://lore.kernel.org/20240701212244.52288-1-sj@kernel.org).

_2024-06-21_: HacKerMaiL (hkml) has
[announced](https://lore.kernel.org/20240621170355.939F7C2BBFC@smtp.kernel.org)
as a mailing tool for DAMON community that the maintainer is committed to
support.

_2024-06-14_: DAMON talk for Kernel Summit 2024 is
[proposed](https://lore.kernel.org/20240614175504.87365-1-sj@kernel.org/).

_2024-06-14_: SK hynix' patch series "DAMON based tiered memory management for
CXL memory" has
[merged](https://lore.kernel.org/all/20240614185328.BA2C1C2BD10@smtp.kernel.org/)
into -mm tree.

_2024-06-12_: DAMON talk for OpenSource Summit Europe 2024 has been accepted
and [scheduled](https://sched.co/1ej2S).

_2024-05-18_: Memory management subsystem pull
[request](https://lore.kernel.org/20240517192239.9285edd85f8ef893bb508a61@linux-foundation.org)
for Linux 6.10-rc1 has been posted.  This pull request includes DAMOS young
page filter, a DAMOS functionality kselftest, and misc cleanups/fixups for
code, documentation, and tests.

_2024-05-17_: LWN published an [article](https://lwn.net/Articles/973702/)
introducing DAMON session at LSFMM 2024.

_2024-05-02_: LSFMMBPF schedule is
[uploaded](https://docs.google.com/spreadsheets/d/176LXLys9Uh6A-Eal2flrzcbUSJMUXGkGwyihr9jAAaQ/edit?usp=sharing).
DAMON talk is scheduled for the Monday noon.

_2024-04-29_: The video of the DAMON presentation at OSSummit NA'24 is
[uploaded](https://youtu.be/vP5x5P47S1U?feature=shared).

_2024-04-28_: Yet another academic
[paper](https://dl.acm.org/doi/abs/10.1145/3620666.3651355) exploring DAMON for
serverless computing has published on ASPLOS 24.

_2024-04-17_: The third in-person DAMON meetup has
[held](https://sched.co/1cP4G) as a unconference session of Open Source Summint
North America 2024

_2024-04-03_: Oracle released a
[tool](https://blogs.oracle.com/linux/post/explore-linux-kernel-kconfigs) that
[helps](https://oracle.github.io/kconfigs/?config=UTS_RELEASE&config=DAMON&config=DAMON_RECLAIM&config=DAMON_LRU_SORT)
finding distros that enabled DAMON

_2024-04-01_: DAMO v2.2.8 is out. This version
[supports](https://github.com/damonitor/damo/blob/v2.2.8/USAGE.md#recording-memory-footprints)
recording memory footprint of monitoring target processes together with their
access pattern.  Users could know when how much memory is allocated and really
accessed. Such visualization is one of the future works, though.

_2024-03-13_: Memory management subsystem pull
[request](https://lore.kernel.org/all/20240313200532.34e4cff216acd3db8def4637@linux-foundation.org/)
for Linux 6.9-rc1 has been posted.  To quote Andrew’s summary for DAMON part:
- More DAMON work from SeongJae Park in the series
  - "mm/damon: make DAMON debugfs interface deprecation unignorable"
  - "selftests/damon: add more tests for core functionalities and corner cases"
  - "Docs/mm/damon: misc readability improvements"
  - "mm/damon: let DAMOS feeds and tame/auto-tune itself"

_2024-03-06_: [LSF/MM/BPF 2024](https://events.linuxfoundation.org/lsfmmbpf/)
DAMON discussion
[topic](https://lore.kernel.org/damon/20240129204749.68549-1-sj@kernel.org/) is
accepted

_2024-03-04_: DAMO v2.2.4 is
[released](https://github.com/damonitor/damo/tree/v2.2.4) with a new feature for
access pattern-based
[profiling](https://github.com/damonitor/damo/blob/v2.2.4/USAGE.md#profile).
For example, users can know which code is making their program's memory usage
unexpectedly high, or which code is intensively accessing memory, and optimize.

_2024-02-27_: DAMON user-space tool, [DAMO](https://damonitor.github.io), has
[downloaded](https://pypistats.org/packages/damo) from PyPI more than 2,000
times last month.
![damo_2000_monthly_downloads](/img/damo_download_2005.png)

_2024-02-21_: Yet another academic
[paper](https://pasalabs.org/papers/2024/Eurosys24_M3_Camera_Ready.pdf)
exploring DAMON for tiered memory management will be presented at
[EuroSys 2024](https://2024.eurosys.org/)

_2023-02-20_: DAMO v2.2.2 is released with a new command,
[`replay`](https://github.com/damonitor/damo/blob/v2.2.2/release_note#L5).  It
will hopefully help reproducing the real-world memory access pattern for
analysis and benchmarks.

_2024-02-14_: DAMON talk for OSSummit NA 2024 has been accepted and
[scheduled](https://sched.co/1aBOg)

_2024-02-09_: DAMON in Amazon Linux 5.10.y
[kernel](https://github.com/amazonlinux/linux/tree/amazon-5.10.y/master/mm/damon)
has updated to that of v6.7 Linux kernel. Major updates on this change include
- DAMOS apply target regions
  [tracing](https://git.kernel.org/torvalds/c/c603c630b509) and
- Sampling interval granularity monitoring results
  [generation](https://git.kernel.org/torvalds/c/78fbfb155d20) and
  [DAMOS](https://git.kernel.org/torvalds/c/affa87c70818).

_2024-01-29_: LSF/MM/BPF 2024 topic proposal for DAMON has
[posted](https://lore.kernel.org/linux-mm/20240129204749.68549-1-sj@kernel.org/)

_2024-01-15_: SK Hynix
[shared](https://lore.kernel.org/damon/20240115045253.1775-1-honggyu.kim@sk.com/)
their DAMOS-based tiered memory management test results showing 4-17%
performance slowdown reduction, with patches for that.

_2024-01-12_: LWN [introduced](https://lwn.net/Articles/957188/) the
feedback-driven DAMOS aggressiveness
[auto-tuning](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9294a037c015)
as one of interesting changes for Linux v6.8

_2024-01-08_: Memory management subsystem pull
[request](https://lore.kernel.org/linux-mm/20240108155039.fd2798712a2a93a108b710ce@linux-foundation.org/)
for Linux v6.8-rc1 has posted. To quote Andrew's summary for DAMON part:

- DAMON/DAMOS feature and maintenance work from SeongJae Park in
the series
  - "mm/damon: let users feed and tame/auto-tune DAMOS"
  - "selftests/damon: add Python-written DAMON functionality tests"
  - "mm/damon: misc updates for 6.8"


2023
----

_2023-12-31_: A retrospect of DAMON development in 2023 for the upstream
community has
[posted](https://lore.kernel.org/damon/20231231222250.140364-1-sj@kernel.org/).

_2023-12-27_: SK Hynix released Heterogeneous Memory Software Development Kit
(HMSDK) [v2.0](https://github.com/skhynix/hmsdk/releases/tag/hmsdk-v2.0) which
utilizes DAMON for tiered memory management.

_2023-11-24_: A [paper](https://arxiv.org/pdf/2311.10275.pdf) exploring DAMON
and finding grateful areas to improve has uploaded to arXiv.

_2023-11-17_: Livestreamed video for DAMON talk at kernel summit 2023 is now
[available](https://www.youtube.com/live/VxaAorwL89c?si=vUk1V5jAZhw8YFdV&t=19455)
at YouTube.

_2023-11-12_: RFC idea for DAMOS-based tiered memory management is
[sent](https://lore.kernel.org/damon/20231112195602.61525-1-sj@kernel.org/).

_2023-11-12_: RFC idea for Access/Contiguity-aware Memory Auto-scaling is
[sent](https://lore.kernel.org/damon/20231112195114.61474-1-sj@kernel.org/).

_2023-11-12_: RFC patchset for Aim-oriented Feedback-driven DAMOS
Aggressiveness Auto Tuning is
[sent](https://lore.kernel.org/damon/20231112194607.61399-1-sj@kernel.org/).

_2023-11-08_: The second in-person DAMON community meetup at LPC has
[accepted](https://lpc.events/event/17/contributions/1652C) and
[announced](https://lore.kernel.org/damon/20231108145525.12650-1-sj@kernel.org/).

_2023-11-02_: Memory management subsystem pull requests for Linux v6.7-rc1,
which contains the changes for DAMON, has
[sent](https://lore.kernel.org/mm-commits/20231101145447.60320c9044e7db4dba2d93e3@linux-foundation.org/).

_2023-10-22_: An SOSP [paper](https://dl.acm.org/doi/10.1145/3600006.3613167)
for tiered memory management that referencing and exploring DAMON has found.

_2023-10-12_: LPC BoF session proposal for DAMON community in-person meetup has
submitted.

_2023-10-04_: DAMON talk for Kernel Summit track of Linux Plumbers Conference
2023 has [accepted](https://lpc.events/event/17/contributions/1624/).

_2023-09-07_: Yet another academic paper
[preprint](https://arxiv.org/pdf/2309.01736.pdf) regarding serverless on CXL
using/citing DAMON has uploaded.  The title of the preprint is "Understanding
and Optimizing Serverless Workloads in CXL-Enabled Tiered Memory"

_2023-08-09_: DAMON community started running its CI test against all stable
kernels and
[report](https://lore.kernel.org/damon/20230809171146.90801-1-sj@kernel.org/)
the results.

_2023-08-08_: DAMON user-space tool (damo) has reached 100 Github stars.
![damo 100 github stars](/img/damo_100_github_stars.png)

_2023-08-07_: DAMON user-space tool (damo) has released its 100th
[version](https://github.com/damonitor/damo/releases/tag/v1.9.3). A mail for the
news, release stats, and appreciation to the DAMON community has also
[posted](https://lore.kernel.org/damon/20230807202044.98700-1-sj@kernel.org/).

_2023-08-03_: DAMON continuous functionality testing started testing stable rc
[kernels](https://github.com/damonitor/damon-tests/commit/acb5f06f861d19b6826e3e339ddf69806da218ee)
and
[report](https://lore.kernel.org/damon/20230802173033.108621-1-sj@kernel.org/)
back the results.

_2023-08-01_: DAMON Beer/Coffee/Tea meeting will be
[postponed](https://lore.kernel.org/damon/20230801012126.6249-1-sj@kernel.org/)
from mid of August to end of OSSummit Euro 2023.

_2023-07-26_: The kernel summit talk proposal for DAMON status and future plans
has
[posted](https://lore.kernel.org/damon/20230726190926.85121-1-sj@kernel.org/)

_2023-07-10_: Hocus wrote an
[article](https://hocus.dev/blog/qemu-vs-firecracker/) introducing DAMON as a
kernel feature that could be useful for memory efficient VM, with its
limitations.

_2023-06-30_: DAMON talk for OSSummit EU 2023 has accepted and
[scheduled](https://sched.co/1OGf9)

_2023-06-25_: DAMON userspace tool, [damo](https://github.com/damonitor/damo) has
[packaged](https://github.com/awslabs/damo/pull/58) for Debian/Ubuntu in
addition to Fedora.  It also turned out it was already packaged for ArchLinux.
Refer to [repology](https://repology.org/project/damo/versions) for detail.

_2023-05-26_: Open Source Summit North America DAMON
[talk](https://sched.co/1K5HS) video is now
[available](https://youtu.be/fImXcHS5PPE) at Youtube

_2023-05-26_: LSF/MM+BPF DAMON
[discussion](https://lore.kernel.org/damon/20230214003328.55285-1-sj@kernel.org/)
video is now
[available](https://www.youtube.com/watch?v=bbC23ApPvow) at Youtube

_2023-05-17_: Now DAMON user space tool (DAMO) is available at
[Fedora Packages](https://packages.fedoraproject.org/pkgs/python-damo/damo/)

_2023-05-16_: Michel from Fedora community is gonna
[package](https://github.com/awslabs/damo/pull/42#issuecomment-1550415746)
DAMON user space tool (DAMO) for Fedora!

_2023-05-16_: An LWN article for LSF/MM+BPF DAMON discussion has
[uploaded](https://lwn.net/Articles/931769/)

_2023-05-04_: The schedule for DAMON talk/discussion at LSFMM is
[available](https://events.linuxfoundation.org/lsfmm/program/schedule-at-a-glance/)
now.

_2023-03-14_: The schedule for DAMON talk at OSSummit NA is
[available](https://sched.co/1K5HS) now.

_2023-03-10_: A DAMON talk proposal for
[OSSummit NA](https://events.linuxfoundation.org/open-source-summit-north-america/)
has accepted.

_2023-03-06_: DAMOS filters feature has introduced as one of the most
significant changes for Linux v6.3 by an LWN
[article](https://lwn.net/Articles/924384/)

_2023-02-24_: A preprint of an academic paper that compares their approach
against DAMON has [uploaded](https://arxiv.org/pdf/2302.09468.pdf) to ArXiv.

_2023-02-13_: LSF/MM/BPF topic proposal for DAMON has
[posted](https://lore.kernel.org/linux-mm/20230214003328.55285-1-sj@kernel.org/)

_2023-02-09_: DAMON debugfs deprecation patchset has
[posted](https://lore.kernel.org/damon/20230209192009.7885-1-sj@kernel.org/)

2022
----

_2022-12-29_: DAMON development summary of 2022 has
[shared](https://lore.kernel.org/lkml/20221229171209.162356-1-sj@kernel.org/)
and [featured](https://www.phoronix.com/news/DAMON-Linux-2022) by Phoronix.

_2022-12-16_: The DAMOS filtering for anon pages and/or memory
cgroups have
[merged](https://lore.kernel.org/mm-commits/20221216235930.526BAC433EF@smtp.kernel.org/)
in mm tree.

_2022-10-19_: An RFC patchset for efficient query-like DAMON monitoring results
have
[posted](https://lore.kernel.org/damon/20221019001317.104270-1-sj@kernel.org/)

_2022-09-15_: The [video](https://youtu.be/e2SZoUPhDRg?t=13245) for my kernel
summit DAMON talk this year is now available at Youtube

_2022-09-09_: The plan for the first in-person DAMON community meetup at LPC
and the in-person office hour at OSSummit EU has
[announced](https://lore.kernel.org/damon/20220909173856.55818-1-sj@kernel.org/)

_2022-09-06_: AL2 5.10 kernel's DAMON code has
[updated](https://github.com/amazonlinux/linux/commit/5441c2036382e1957492a6d762f0dfbd172aa225)
to that of v5.19

_2022-08-30_: AL2 5.10 kernel's DAMON code has
[updated](https://github.com/amazonlinux/linux/commit/8fde5ce7c81c1ecf6c3ac2595774eac0e6784869)
to that of v5.18

_2022-08-22_: LWN [introduced](https://lwn.net/Articles/905370/) DAMON-based
LRU-lists manipulation (DAMON_LRU_SORT) in detail

_2022-08-15_: LWN [introduced](https://lwn.net/Articles/904032/) DAMON’s new
features including 'LRU_SORT' as significant changes for Linux 6.0

_2022-08-12_: Bi-weekly DAMON Beer/Coffee/Tea Chat series for open, regular,
and informal community syncups and discussions has
[announced](https://lore.kernel.org/damon/20220810225102.124459-1-sj@kernel.org/).

_2022-07-29_: Current status, future plans, and possible collaborations for
DAMON will be [presented](https://lpc.events/event/16/contributions/1224/) at
the Kernel Summit 2022.

_2022-06-26_: The poster of the DAOS
[paper](https://www.amazon.science/publications/daos-data-access-aware-operating-system)
is
[available](https://damonitor.github.io/misc/daos_hpdc_2022_poster.pdf) online.

_2022-06-13_: DAMON-based LRU-lists sorting patchset has
[posted](https://lore.kernel.org/damon/20220613192301.8817-1-sj@kernel.org/)
and immediately
[merged](https://lore.kernel.org/mm-commits/20220613194036.C4AC5C34114@smtp.kernel.org/)
in the -mm tree

_2022-05-04_: A paper introducing DAMON and related works have accepted by
[HPDC22](https://www.hpdc.org/2022/program/accepted/)

_2022-05-03_: Now DAMON has its own open mailing
[list](https://lore.kernel.org/damon/)

_2022-04-29_: Patches for DAMON online tuning have
[merged](https://lore.kernel.org/mm-commits/20220429162617.04E08C385A7@smtp.kernel.org/)
in -mm tree

_2022-04-27_: Android has
[backported](https://android.googlesource.com/kernel/common/+log/b3190b539a0845d3b849926b723deeeacc7491a4)
and
[enabled](https://android.googlesource.com/kernel/common/+/0496c13ded02bd72426d189b777bf303fe490f62)
building `DAMON` and `DAMON_RECLAIM` for the common kernel.

_2022-04-27_: Alibaba has
[shared](https://lore.kernel.org/linux-mm/e3c1beb1-e3d5-6e26-bae2-06785080b57e@linux.alibaba.com/)
thier own DAMON user space
[tool](https://github.com/aliyun/data-profile-tools).

_2022-02-28_: The DAMON sysfs interface patchset has
[merged](https://lore.kernel.org/mm-commits/20220228194808.91315C340F3@smtp.kernel.org/)
in -mm tree.

_2022-02-17_: An [RFC
patchset](https://lore.kernel.org/linux-mm/20220217161938.8874-1-sj@kernel.org/)
for sysfs-based DAMON's new user interface has posted.

_2022-01-20_: A
[roadmap](https://lkml.kernel.org/r/20220119133110.24901-1-sj@kernel.org) of
DAMON has shared.

_2022-01-09_: Linux 5.16 is released.  "DAMON-based proactive memory
reclamation, operation schemes and physical memory monitoring" are marked as
prominent features of the release by the [Kernel
newbies](https://kernelnewbies.org/Linux_5.16) and
[LWN](https://kernelnewbies.org/Linux_5.16).

2021
----

_2021-12-23_: A great blog
[post](https://stevescargall.com/2021/12/23/how-to-build-a-custom-linux-kernel-to-test-data-access-monitor-damon/)
for DAMON-enabled kernel has uploaded

_2021-11-07_: DAMON patches for automated memory management
[optimization](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=68536f8e01e571f553f78fa058ba543de3834452),
the physical address space monitoring
[support](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c638072107f52ec35f292c97b6f3df9b9f2ed87d),
and [proactive
reclamation](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bec976b69143)
have merged in the mainline.

_2021-11-01_: DAMON has
[released](https://kernelnewbies.org/Linux_5.15#DAMON.2C_a_data_access_monitor)
with Linux [v5.15](https://lwn.net/Articles/874493).

_2021-10-14_: DAMON_RECLAIM patchset is
[merged](https://github.com/amazonlinux/linux/commit/99c8ec092e82) in the
Amazon Linux 5.10.y kernel tree.

_2021-10-02_: DAMOS patchset is
[merged](https://lore.kernel.org/mm-commits/20211001233339.SV5JeiSqb%25akpm@linux-foundation.org/)
in the -mm tree.

_2021-09-23_: DAMON and DAMOS are presented in the kernel summit.
[Slides](https://linuxplumbersconf.org/event/11/contributions/984/attachments/870/1670/daos_ksummit_2021.pdf),
[Video](https://youtu.be/gpFfJkrrEEs?t=5290),
[Link](https://linuxplumbersconf.org/event/11/contributions/984/)

_2021-09-16_: DAMON development tree on
[kernel.org](https://git.kernel.org/sj/h/damon/next/about) is created.

_2021-09-08_: DAMON patchset is
[merged](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2d338201d5311bcd79d42f66df4cecbcbc5f4f2c)
in the Linus Torvalds' tree, aka
[mainline](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/damon?id=2d338201d5311bcd79d42f66df4cecbcbc5f4f2c)

_2021-09-07_: DAMON/DAMOS will be
[presented](https://linuxplumbersconf.org/event/11/contributions/984/) at
the Kernel Summit 2021

_2021-08-31_: DAMON user-space tool is uploaded to the official Python
packages system, [PyPi](https://pypi.org/project/damo/)

_2021-08-06_: DAMON patchset is
[merged](https://lore.kernel.org/linux-mm/20210805174324.2aaf0fb67cd19da893a86d80@linux-foundation.org/)
in the -mm tree

_2021-07-27_: LWN published a second
[article](https://lwn.net/Articles/863753/) introducing DAMON patchset series

_2021-06-11_: DAMON-based proactive reclamation RFC patchset has shared on the
[hackernews](https://news.ycombinator.com/item?id=27459675) and introduced by a
Phoronix
[article](https://www.phoronix.com/scan.php?page=news_item&px=DAMON-Page-Reclamation-RFC)

_2021-05-31_: DAMON-based proactive reclamation RFC patchset has
[posted](https://lore.kernel.org/linux-mm/20210531133816.12689-1-sj38.park@gmail.com/)

_2021-05-26_: DAMON-enabled Amazon Linux 2 kernels have [deployed to all
users](https://twitter.com/sjpark0x00/status/1397484233413832705)

_2021-05-07_: DAMON has merged in the public source tree for Amazon Linux
v5.4.y
[kernel](https://github.com/amazonlinux/linux/tree/amazon-5.4.y/master/mm/damon)

_2021-04-05_: `damo` now supports heatmap visualization on the
[terminal](https://raw.githubusercontent.com/damonitor/damo/master/for_doc/masim_zigzag_heatmap_ascii.png)

_2021-03-31_: DAMON user-space tool (`damo`) is released as an
[individual open source project](https://github.com/damonitor/damo)

_2021-03-19_: DAMON has merged in the public source tree for Amazon Linux
v5.10.y
[kernel](https://github.com/amazonlinux/linux/tree/amazon-5.10.y/master/mm/damon)

_2021-03-04_: DAMON supports for two latest LTS kernels
[announced](https://lore.kernel.org/linux-mm/20210304100732.7844-1-sjpark@amazon.com/)

_2021-03-03_: DAMON is merged in v5.10 based public Amazon Linux kernel
[tree](https://github.com/amazonlinux/linux/commit/10e0ec07f9085a42f724b28912a1dadc0b5d3c80)

_2021-02-25_: An example usage of DAMON for profiling is
[shared](https://twitter.com/sjpark0x00/status/1364591344300273666)

_2021-01-07_: A runtime system for DAMON-based optimal operation scheme finding
is [released](https://github.com/damonitor/damoos)

2020
----

_2020-12-03_: Further plans around DAMON is
[shared](https://lore.kernel.org/linux-mm/20201202082731.24828-1-sjpark@amazon.com)

_2020-11-17_: A real-world user story of DAMON is
[shared](https://lore.kernel.org/linux-mm/20201117143021.11883-1-sjpark@amazon.com/)

_2020-09-26_: The tests package for DAMON is
[released](https://github.com/damonitor/damon-tests) under GPL v2 license

_2020-08-19_: A demo video is [available](https://youtu.be/l63eqbVBZRY)

_2020-08-05_: DAMON will be
[presented](https://www.linuxplumbersconf.org/event/7/contributions/659/) at
the Kernel Summit 2020

_2020-06-04_: Physical Memory Monitoring is now
[available](https://lore.kernel.org/linux-mm/20200603141135.10575-1-sjpark@amazon.com/)

_2020-05-18_: DAMON showcase website is announced

_2020-05-13_: DAMON official document is uploaded
[online](https://damonitor.github.io/doc/html/latest/admin-guide/mm/damon/)

_2020-02-20_: DAMON has introduced by an LWN
[article](https://lwn.net/Articles/812707/)

_2020-02-10_: The first RFC of Data Access Monitoring-based Operating Schemes
(DAMOS) has posted to
[LKML](https://lore.kernel.org/linux-mm/20200210150921.32482-1-sjpark@amazon.com/)

_2020-01-23_: The RFC of DAMON has introduced by LWN's ['Kernel patches of
interest'](https://lwn.net/Articles/809100/)

_2020-01-20_: The first RFC patchset of DAMON has posted to
[LKML](https://lore.kernel.org/linux-mm/20200110131522.29964-1-sjpark@amazon.com/)
