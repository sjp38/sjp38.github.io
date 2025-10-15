---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "OSDI 2021 papers summary"
subtitle: ""
summary: ""
authors: []
tags: ["osdi", "osdi21", "paper"]
categories: ["researches review"]
date: 2021-08-07T09:27:55+02:00
lastmod: 2021-08-07T09:27:55+02:00
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

This post is for recording some notes from a few OSDI'21 papers that I got fun.

---

DMon: Efficient Detection and Correction of Data Locality Problems Using Selective Profiling
--------------------------------------------------------------------------------------------

https://www.usenix.org/system/files/osdi21-khan.pdf

DMon is a compiler-based data locality optimization system.  The approach is
quite similar to that of [daphicx](https://sjp38.github.io/post/daphicx/) or
similar things.  It injects data access profiling code in the target program,
build and run it with some workload, collect the profiling code-generated
results, analyze the profile results to figure out what kind of optimization
can provide some benefit to the program, injects the optimization code in the
program, built it again, and deploy the version to the production.

Biggest novelty of DMon is its selective profiling.  It first figure out for
what resource (e.g., CPU, L1/L2/L3$, or memory) the program's performance is
bounded, and select what information to collect based on that.  It also uses
a simple sampling technique.  The default sampling rate is 1 sample per 1000
events, though it can be tuned by user.  In this way, DMon profile only
necessary information and therefore incurs only small overhead (1.36% on
average).  This allows DMon to do the profiling not only under production-like
workloads but also real production.

For the optimization, it uses some existing well-known techniques including
(in)direct prefetching, and structure merging, based on the analyzed profiling
results.  The paper claims this provide 16.83% speedup on average.  For the
evaluation, the authors use some benchmarks including PARSEC3/SPLASH-2X, NPB,
TPC-H on PostgreSQL, and Renaissance benchmark suite.

The idea is novel and makes sense.  However, because this is a compiler-based
approach, it has a limitation in language.  It supports only C and C++ for now.
Also, though it claims it can be used on production, I unsure if real
production people agrees.  Especially, the re-deployment of the optimized
version would not be so easy for long-running systems.


Rearchitecting Linux Storage Stack for µs Latency and High Throughput
---------------------------------------------------------------------

https://www.usenix.org/conference/osdi21/presentation/hwang

When latency-sensitive apps and throughput-bound apps are co-running, Linux
kernel cannot achieve microseconds-scale latency and high throughput.  Both
SPDK and advanced SPDK usage are same.  This paper finds the storage stack of
Linux kernel is somewhat like network switch, because it routes I/O request
from CPU cores to input queues of storage devices.  This paper introduces
blk-switch, which modifies the stack to decouple request processing from the
application cores and utilizing multiple egress queue having several advanced
features including prioritization and steering.  It achieves microseconds-scale
latency and high throughput under the situation, without modification of the
application.


Beyond malloc efficiency to fleet efficiency: a hugepage-aware memory allocator
-------------------------------------------------------------------------------

https://www.usenix.org/conference/osdi21/presentation/hunter

This paper optimizes TCMALLOC by making it more aware of hugepage and using it
on Google's warehouse scale computing.  The optimization is mostly based on
some model-based heuristics.  It's description on TCMALLOC internal and the
problem background is quite useful.


Nap: A Black-Box Approach to NUMA-Aware Persistent Memory Indexes
-----------------------------------------------------------------

https://www.usenix.org/conference/osdi21/presentation/wang-qing

Intel released Optane PM DIMM, so real PM world has already started long time
ago.  This paper explores the performance of the PM indexing on NUMA systems.
It finds PM performance is degraded on NUMA systems, and current NUMA-aware PM
indexing systems are not working good enough for NUMA systems.  Based on
findings that most of the real world workloads have highly skewed access
pattern, the authors implemented a system called Nap, which translates the PM
indexing to be NUMA-awared.
