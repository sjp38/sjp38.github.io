+++
date = "2017-01-14T04:51:08+09:00"
lastmod = "Wed Jul 24 07:27:25 PDT 2024"
categories = [
	"about",
]
tags = [
	"about",
]
thumbnail = ""
title = "About"
description = ""

+++

Bio
===

SeongJae Park is a Linux kernel programmer who maintains
[DAMON](https://damonitor.github.io), a data access monitoring framework for
the Linux kernel. He is developing a data access-aware Linux system for AWS
using this framework as a core component. He basically enjoys analyzing and
developing systems, and is particularly interested in operating system kernels,
parallel computing, and memory management. He received his PhD degree from the
Department of Computer Science, Seoul National University in 2019.


Contacts
========

- [sj@kernel.org](mailto:sj@kernel.org)
- [sjpark@amazon.com](mailto:sjpark@amazon.com)
- [sj38.park@gmail.com](mailto:sj38.park@gmail.com)


Education
=========

- __Ph.D, Computer Science and Engineering__ at _Seoul National
  University_, Aug 2019
- __B.S., Electrical Engineering / Information and Computer Engineering (dual
  degree)__ at _Ajou University_, Jan 2009


Experiences
===========

- __Kernel Development Engineer__ at __Amazon__, May 2022 - Present
- __Kernel / Hypervisor Engineer__ at __Amazon__, Sep 2019 - May 2022
- __Graduate Research Assistant__ at __DCSLAB, Seoul National University__,  
  Jul 2012 - Aug 2019
- __Part-time Linux Kernel Hacker__ at __Korea Open Source Software Lab__,  
  Jan 2016 - May 2019
- __Full-time Linux Kernel Hacker__ at __Korea Open Source Software Lab__,  
  Dec 2013 - Dec 2014
- __Free-lance S/W Developer__, Aug 2011 - Nov 2013
- __Software Engineer__ at __Samsung Electronics__, Feb 2009 - Jul 2011
- __Software Engineer__ at __Samsung Software Membership__, Jan 2008 - Jan 2009


Recent Linux Kernel Contributions
=================================

```
$ git clone https://github.com/sjp38/lazybox
$ ./lazybox/git_hepers/profile_author.py "SeongJae Park" \
                      --repo ./linux --branch linus/master  --max_files 10
since 2023-04-14 until 2024-04-13
# <changed_lines> <file>
746 mm/damon/sysfs-schemes.c
735 Documentation/admin-guide/mm/damon/usage.rst
646 mm/damon/core.c
522 Documentation/mm/damon/design.rst
405 tools/testing/selftests/damon/_damon_sysfs.py
291 include/linux/damon.h
273 mm/damon/sysfs.c
179 mm/damon/core-test.h
100 Documentation/ABI/testing/sysfs-kernel-mm-damon
86 mm/damon/sysfs-test.h
# 5035 total lines
# 52 total files
# 172 commits
```


Publications And Presentations
==============================

- SeongJae Park, __DAMON: Long-term Plans for Kernel That {Just
  Works,Extensible}.__ In Linux Kernel Memory Management Microconferenct at
  Linux Plumbers, Sep 2024.
  [Link](https://lpc.events/event/18/contributions/1768/)
- SeongJae Park, __DAMON Recipes: Ways to Save Memory Using a Linux Kernel
  Subsystem in the Real World.__ In Open Source Summit Europe, Sep 2024.
  [Link](https://sched.co/1ej2S)
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
- SeongJae Park, __DAMON, DAMOS, and DAMO: Kernel Subsystems and User-Space
  Tools for Data Access-Aware System Analysis/Optimizations.__
  In _Open Source Summit North America_, May 2023.
  [Slides](https://github.com/damonitor/talks/blob/master/2023/ossummit_na/damon_damos_damo_ossummit_na_2023.pdf),
  [Link](https://sched.co/1K5HS)
- SeongJae Park, __DAMON updates and future plans.__
  In _Linux Storage | Filesystem | MM & BPF Summit_, May 2023.
  [Slides](https://github.com/damonitor/talks/blob/master/2023/lsfmmbpf/damon_lsfmmbpf_2023.pdf),
  [Link](https://events.linuxfoundation.org/lsfmm/program/schedule-at-a-glance/)
- SeongJae Park, __Current Status and Future Plans of DAMON.__
  In _The Linux Kernel Summit_, September 2022.
  [Slides](https://lpc.events/event/16/contributions/1224/attachments/1107/2137/damon_status_plan_ksummit_2022.pdf),
  [Video](https://youtu.be/e2SZoUPhDRg?t=13245),
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
- SeongJae Park, __DAMON: Data Access Monitoring Framework for Fun and Memory
  Management Optimizations,__ In _The Linux Kernel Summit_, August 2020.
  [Slides](https://www.linuxplumbersconf.org/event/7/contributions/659/attachments/503/1195/damon_ksummit_2020.pdf),
  [Video](https://youtu.be/jOBkKMA0uF0?t=10696),
  [Link](https://www.linuxplumbersconf.org/event/7/contributions/659/)
- SeongJae Park, Paul E. McKenney, Laurent Dufour, Heon Y. Yeom, __An HTM-Based
  Update-side Synchronization for RCU on NUMA systems.__ In _15th ACM European
  Conference on Computer Systems (EuroSys)_, April 2020.
  [Paper](https://dl.acm.org/doi/abs/10.1145/3342195.3387527), 
  Video ([5min](https://www.youtube.com/watch?v=QydRe1z5uYk&feature=youtu.be),
  [12min](https://www.youtube.com/watch?v=h7RzyhR_lPQ&feature=youtu.be)),
  [Slides](https://www.eurosys2020.org/wp-content/uploads/2020/04/slides/166_seongjae_slides.pdf)
- SeongJae Park, Yunjae Lee, Heon Y. Yeom, __Profiling Dynamic Data Access
  Patterns with Controlled Overhead and Quality.__ In _20th ACM/IFIP
  International Middleware Conference (MIDDLEWARE) Industry_, December 2019.
  [Paper](https://dl.acm.org/citation.cfm?id=3368125)
- SeongJae Park, __Tracing Data Access Pattern with Bounded Overhead and
  Best-effort Accuracy.__ In _The Linux Kernel Summit_, September 2019.
  [Slides](https://linuxplumbersconf.org/event/4/contributions/548/attachments/311/590/damon_ksummit19.pdf),
  [Link](https://linuxplumbersconf.org/event/4/contributions/548/)
- SeongJae Park, Yunjae Lee, Moonsub Kim Heon Y. Yeom, __Automating Context
  Based Access Pattern Hint Injection for System Performance and Swap Storage
  Durability.__ In _11th USENIX Workshop on Hot Topics in Storage and File
  Systems (HotStorage)_, July 2019.
  [Paper](https://www.usenix.org/system/files/hotstorage19-paper-park.pdf),
  [Slides](https://www.usenix.org/sites/default/files/conference/protected-files/hotstorage19_slides_park.pdf)
- SeongJae Park, Yunjae Lee, Yunhee Kim, Heon Y. Yeom, __Profiling Dynamic Data
  Access Patterns with Bounded Overhead and Accuracy.__ In IEEE International
  Workshop on Foundations and Applications of Self-* Systems (FAS*),
  June 2019.
  [Paper](https://ieeexplore.ieee.org/abstract/document/8791992)
- SeongJae Park, __Biscuit: an operating system written in Go.__ In _1st GDG
  Golang Korea meetup_, May 2019.
  [Slides](https://www.slideshare.net/SeongJaePark1/biscuit-an-operating-system-written-in-go),
  [Video](https://youtu.be/e-5kCRZhOw8)
- SeongJae Park, Minchan Kim, Heon Y. Yeom, __GCMA: Guaranteed Contiguous
  Memory Allocator.__ In _Transactions on Computers_, March 2019.
  [Paper](https://ieeexplore.ieee.org/document/8456561)
- SeongJae Park, Yunjae Lee, Moonsub Kim, Heon Y. Yeom, __Automated Data Access
  Pattern Hint Instrumentation for System Performance and Durability of Swap
  Storages.__ (WiP) In 17th USENIX Conference on File and Storage Technologies
  (FAST), February 2019.
  [Link](https://www.usenix.org/conference/fast19/wips)
- SeongJae Park, __GCMA: Guaranteed Contiguous Memory Allocator.__ In _The
  Linux Kernel Summit_, November 2018.
  [Slides](https://linuxplumbersconf.org/event/2/contributions/247/attachments/74/85/gcma_ksummit2018.pdf),
  [Video](https://www.youtube.com/watch?v=ARrelFfdVkw),
  [Link](https://linuxplumbersconf.org/event/2/contributions/247/)
- SeongJae Park, __Linux Kernel Memory Model.__ In _4th Korea Linux Kernel
  Conference_, November 2018.
  [Slides](https://www.slideshare.net/SeongJaePark1/linux-kernel-memory-model)
- SeongJae Park, __An Introduction to the Formalised Memory Model for Linux
  Kernel.__ In _Korea Open Source Software Conference (KOSSCON)_, Aug 2018.
  [Slides](https://www.slideshare.net/SeongJaePark1/an-introduction-to-the-formalised-memory-model-for-linux-kernel)
- SeongJae Park, __Design Choices of Golang for High Scalability.__ In _GDG
  Korea Meeup_,  
  Sept 2017.
  [Slides](https://www.slideshare.net/SeongJaePark1/design-choices-of-golang-for-high-scalability)
- SeongJae Park, __Brief Introduction to Kselftest.__ In _Korea Linux Kernel
  Conference_,  
  July 2017.
  [Slides](https://www.slideshare.net/SeongJaePark1/brief-introduction-to-kselftest)
- SeongJae Park, __Understanding of Linux Kernel Memory Model.__ In _Korea Open
  Source Software Conference (KOSSCON)_, November 2016.
  [Slides](https://www.slideshare.net/SeongJaePark1/understanding-of-linux-kernel-memory-model)
- SeongJae Park, Minchan Kim, Heon Y. Yeom, __GCMA: Guaranteed Contiguous
  Memory Allocator.__ In _Embedded Operating Systems Workshop (EWiLi)_, October
  2015.
  [Paper](http://ceur-ws.org/Vol-1464/ewili15_12.pdf),
  [Slides](https://www.slideshare.net/SeongJaePark1/gcma-guaranteed-contiguous-memory-allocator)
- SeongJae Park, __Develop Android/iOS app using golang.__ In _Gophercon Korea_,  
  August 2015.
  [Slides](https://www.slideshare.net/SeongJaePark1/develop-androidios-app-using-golang)
- SeongJae Park, Minchan Kim, __GCMA: Guaranteed Contiguous Memory Allocator.__
  In _Linux Foundation Korea Linux Forum (LFKLF)_, October 2014.
  [Slides](http://events.linuxfoundation.org/sites/events/files/slides/gcma-guaranteed_contiguous_memory_allocator-lfklf2014_0.pdf)
- SeongJae Park, __How GIT Works Internally.__ In _Samsung Open-source Software
  Conference (SOSCON)_, September 2014.
  [Slides](https://www.slideshare.net/SeongJaePark1/deep-darkside-ofgit)
- Hyuck Han, SeongJae Park, Hyungsoo Jung, Alan Fekete, Uwe Rohm, Heon Y.
  Yeom, __Scalable Serializable Snapshot Isolation for Multicore Systems.__ In
  _IEEE 30th International Conference on Data Engineering (ICDE)_, March 2014.
  [Paper](http://ieeexplore.ieee.org/document/6816693/)
- SeongJae Park, __Let The Contribution Begin.__ In _Google Developers Group
  DevFest W_, March 2013.
  [Slides](https://www.slideshare.net/SeongJaePark1/let-the-contribution-begin)


Other Links
===========

- [LinkedIn](https://www.linkedin.com/in/seongjae-park-1a5b9954)
- [Github](https://github.com/sjp38)
- [Openhub](https://www.openhub.net/accounts/sjpark)
- [Slideshare](https://www.slideshare.net/SeongJaePark1)
