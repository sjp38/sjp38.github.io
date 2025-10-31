---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON Publications and Presentations"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm", "presentations", "publications", "talks"]
categories: ["damon"]
tags: []
categories: []
date: 2023-05-06T12:17:00-07:00
lastmod: Sun Sep 22 06:54:37 PDT 2024
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

This post has migrated to
https://damonitor.github.io/posts/damon_publications_talks.  This out-dated
post will be removed soon.

---

Below is a list of publications and presentations that cover
DAMON [project]({{< ref "damon.md" >}}).

This list is not exhaustive and is compiled to the best of our ability, as some
publications or presentations may have been made without the knowledge of the
DAMON maintainers. If you find a publication or announcement that should be
added to this list, please let us know at sj@kernel.org and/or
damon@lists.linux.dev.

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
- SeongJae Park, __Current Status, Future Plans, and Possible Collaborations
  for DAMON.__ In _The Linux Kernel Summit_, September 2022.
  [Link](https://lpc.events/event/16/contributions/1224/)
- SeongJae Park, Madhuparna Bhowmik, Alexandru Uta, __DAOS: Data Access-aware
  Operating System.__ In _The 31st International ACM Symposium on
  High-Performance Parallel and Distributed Computing (HPDC'22)_, June 2022.
  [Paper](https://www.amazon.science/publications/daos-data-access-aware-operating-system),
  [Slides](https://damonitor.github.io/misc/daos_hpdc_2022_slides.pdf),
  [Poster](https://damonitor.github.io/misc/daos_hpdc_2022_poster.pdf)
- SeongJae Park, __Writing a fine-grained access pattern oriented lightweight
  kernel module using DAMON/DAMOS in 10 minutes.__
  In _The Linux Kernel Summit_, September 2021.
  [Slides](https://linuxplumbersconf.org/event/11/contributions/984/attachments/870/1670/daos_ksummit_2021.pdf),
  [Video](https://youtu.be/gpFfJkrrEEs?t=5290),
  [Link](https://linuxplumbersconf.org/event/11/contributions/984/)
- Jonathan Corbet, __Using DAMON for proactive reclaim.__ In Linux Weekly News,
  July 2021.  [Article](https://lwn.net/Articles/863753/)
- SeongJae Park, __DAMON: Data Access Monitoring Framework for Fun and Memory
  Management Optimizations,__ In _The Linux Kernel Summit_, August 2020.
  [Slides](https://www.linuxplumbersconf.org/event/7/contributions/659/attachments/503/1195/damon_ksummit_2020.pdf),
  [Video](https://youtu.be/jOBkKMA0uF0?t=10696),
  [Link](https://www.linuxplumbersconf.org/event/7/contributions/659/)
- Yunjae Lee, Yunhee Kim, and Heon. Y. Yeom, __Lightweight Memory Tracing for
  Hot Data Identification,__ In _Cluster computing_, 2020.
  [Paper](https://link.springer.com/article/10.1007/s10586-020-03130-1)
- Jonathan Corbet, __Memory-management optimization with DAMON.__ In Linux
  Weekly News, February 2020.
  [Article](https://lwn.net/Articles/812707/)
- SeongJae Park, Yunjae Lee, Heon Y. Yeom, __Profiling Dynamic Data Access
  Patterns with Controlled Overhead and Quality.__ In 20th ACM/IFIP
  International Middleware Conference Industry, December 2019.
  [Paper](https://dl.acm.org/citation.cfm?id=3368125)
- SeongJae Park, __Tracing Data Access Pattern with Bounded Overhead and
  Best-effort Accuracy.__ In _The Linux Kernel Summit_, September 2019.
  [Slides](https://linuxplumbersconf.org/event/4/contributions/548/attachments/311/590/damon_ksummit19.pdf),
  [Link](https://linuxplumbersconf.org/event/4/contributions/548/)
- SeongJae Park, Yunjae Lee, Yunhee Kim, Heon Y. Yeom, __Profiling Dynamic Data
  Access Patterns with Bounded Overhead and Accuracy.__ In IEEE International
  Workshop on Foundations and Applications of Self-* Systems (FAS* 2019),
  June 2019.
  [Paper](https://ieeexplore.ieee.org/abstract/document/8791992)
