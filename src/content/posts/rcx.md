---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "RCX: Read-Copy Transact"
subtitle: ""
summary: ""
authors: []
tags: ["projects", "rcx"]
categories: ["projects"]
date: 2020-02-15T09:11:55+01:00
lastmod: "Tue Apr 28 20:28:18 CEST 2020"
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

Read-copy update (RCU) can provide ideal scalability for read-mostly workloads,
but some believe that it provides only poor performance for updates. This
belief is due to the lack of RCU-centric update synchronization mechanisms. RCU
instead works with a range of update-side mechanisms, such as locking. In fact,
many developers embrace simplicity by using global locking. Logging, hardware
transactional memory, or fine-grained locking can provide better scalability,
but each of these approaches has limitations, such as imposing overhead on
readers or poor scalability on non-uniform memory access (NUMA) systems, mainly
due to their lack of NUMA-aware design principles.

This project introduces an RCU extension (RCX) that provides highly scalable
RCU updates on NUMA systems while retaining RCU’s read-side benefits. RCX
combines hardware transactional memory (HTM) and traditional locking based on
our NUMA-aware design principles for RCU. Micro-benchmarks on a NUMA system
having 144 hardware threads show RCX has up to 22.61 times better performance
and up to 145.00 times lower HTM abort rates compared to a state-of-the-art
RCU/HTM combination. To demonstrate the effectiveness and applicability of RCX,
we have applied RCX to parallelize some of the Linux kernel memory management
system and an in-memory database system. The optimized kernel and the database
show up to 24 and 17 times better performance compared to the original version,
respectively.


Source Code
-----------

The source code of RCX is available at: https://github.com/rcx-sync.


Publications and Presentations
------------------------------

- SeongJae Park, Paul E. McKenney, Laurent Dufour, Heon Y. Yeom, __An HTM-Based
  Update-side Synchronization for RCU on NUMA systems.__ In _15th ACM European
  Conference on Computer Systems (EuroSys)_, April 2020.
  [Paper](https://dl.acm.org/doi/abs/10.1145/3342195.3387527), 
  [Video (Short)](https://www.youtube.com/watch?v=QydRe1z5uYk&feature=youtu.be),
  [Video (Long)](https://www.youtube.com/watch?v=h7RzyhR_lPQ&feature=youtu.be),
  [Slides](https://www.eurosys2020.org/wp-content/uploads/2020/04/slides/166_seongjae_slides.pdf),
  [Link](https://www.eurosys2020.org/program/)


News
----

_2020-04-19_: The EuroSys'20 paper is uploaded at
[ACM DL](https://dl.acm.org/doi/abs/10.1145/3342195.3387527).

_2020-04-04_: The accepted papers list of EuroSys'20 has
[uploaded](https://www.eurosys2020.org/program/accepted-papers/)

_2020-02-14_: The paper introducing RCX has accepted to be presented by
[EuroSys'20](https://www.eurosys2020.org/).
