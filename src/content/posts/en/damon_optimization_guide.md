---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON-based System Optimization Guide"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "projects", "linux", "mm"]
categories: ["damon"]
date: 2023-01-15T10:36:11-08:00
lastmod: 2023-01-15T10:36:11-08:00
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

This document helps you estimating the amount of benefit that you could get
from DAMON-based system optimizations, and describes how you could achieve it.


Check The Signs
===============

No optimization can provide same extent of benefit to every case.  Therefore
you should first guess how much improvements you could get using DAMON.  If
some of below conditions match your situation, you could consider using DAMON.

- *Low IPC and High Cache Miss Ratios.*  Low IPC means most of the CPU time is
  spent waiting for the completion of time-consuming operations such as memory
  access, while high cache miss ratios mean the caches don't help it well.
  DAMON is not for cache level optimization, but DRAM level.  However,
  improving DRAM management will also help this case by reducing the memory
  operation latency.
- *Memory Over-commitment and Unknown Users.*  If you are doing memory
  overcommitment and you cannot control every user of your system, a memory
  bank run could happen at any time.  You can estimate when it will happen
  based on DAMON's monitoring results and act earlier to avoid or deal better
  with the crisis.
- *Frequent Memory Pressure.*  Frequent memory pressure means your system has
  wrong configurations or memory hogs.  DAMON will help you find the right
  configuration and/or the criminals.
- *Heterogeneous Memory System.*  If your system is utilizing memory devices
  that placed between DRAM and traditional hard disks, such as non-volatile
  memory or fast SSDs, DAMON could help you utilizing the devices more
  efficiently.

Profile
=======

If you found some positive signals, you could start by profiling your workloads
using DAMON.  Find major workloads on your systems and analyze their data
access pattern to find something wrong or can be improved.  The DAMON user
space tool (``damo``) will be useful for this.  You can get ``damo`` from
https://github.com/damonitor/damo.

We recommend you to start from working set size distribution check using ``damo
report wss``.  If the distribution is ununiform or quite different from what
you estimated, you could consider `Memory Configuration` optimization.

Then, review the overall access pattern in heatmap form using ``damo report
heats``.  If it shows a simple pattern consists of a small number of memory
regions having high contrast of access temperature, you could consider manual
`Program Modification`.

If the access pattern is very frequently changing so that you cannot figure out
what is the performance important region using your human eye, `Automated
DAMON-based Memory Operations` might help the case owing to its machine-level
microscope view.

If you still want to absorb more benefits, you should develop `Personalized
DAMON Application` for your special case.

You don't need to take only one approach among the above plans, but you could
use multiple of the above approaches to maximize the benefit.


Optimize
========

If the profiling result also says it's worth trying some optimization, you
could consider below approaches.  Note that some of the below approaches assume
that your systems are configured with swap devices or other types of auxiliary
memory so that you don't strictly required to accommodate the whole working set
in the main memory.  Most of the detailed optimization should be made on your
concrete understanding of your memory devices.


Memory Configuration
--------------------

No more no less, DRAM should be large enough to accommodate only important
working sets, because DRAM is highly performance critical but expensive and
heavily consumes the power.  However, knowing the size of the real important
working sets is difficult.  As a consequence, people usually equips
unnecessarily large or too small DRAM.  Many problems stem from such wrong
configurations.

Using the working set size distribution report provided by ``damo report wss``,
you can know the appropriate DRAM size for you.  For example, roughly speaking,
if you worry about only 95 percentile latency, you don't need to equip DRAM of
a size larger than 95 percentile working set size.

Let's see a real example.  This `page
<https://damonitor.github.io/doc/html/v17/admin-guide/mm/damon/guide.html#memory-configuration>`
shows the heatmap and the working set size distributions/changes of
``freqmine`` workload in PARSEC3 benchmark suite.  The working set size spikes
up to 180 MiB, but keeps smaller than 50 MiB for more than 95% of the time.
Even though you give only 50 MiB of memory space to the workload, it will work
well for 95% of the time.  Meanwhile, you can save the 130 MiB of memory space.


Program Modification
--------------------

If the data access pattern heatmap plotted by ``damo report heats`` is quite
simple so that you can understand how the things are going in the workload with
your human eye, you could manually optimize the memory management.

For example, suppose that the workload has two big memory object but only one
object is frequently accessed while the other one is only occasionally
accessed.  Then, you could modify the program source code to keep the hot
object in the main memory by invoking ``mlock()`` or ``madvise()`` with
``MADV_WILLNEED``.  Or, you could proactively evict the cold object using
``madvise()`` with ``MADV_COLD`` or ``MADV_PAGEOUT``.  Using both together
would be also worthy.

A research work [1] using the ``mlock()`` achieved up to 2.55x performance
speedup.

Let's see another realistic example access pattern for this kind of
optimizations.  This `another page
<https://damonitor.github.io/doc/html/v17/admin-guide/mm/damon/guide.html#program-modification>`
shows the visualized access patterns of streamcluster workload in PARSEC3
benchmark suite.  We can easily identify the 100 MiB sized hot object.


Automated DAMON-based Memory Operations
---------------------------------------

Though `Manual Program Optimization` works well in many cases and DAMON can
help it, modifying the source code is not a good option in many cases.  First
of all, the source code could be too old or unavailable.  And, many workloads
will have complex data access patterns that even hard to distinguish hot memory
objects and cold memory objects with the human eye.  Finding the mapping from
the visualized access pattern to the source code and injecting the hinting
system calls inside the code will also be quite challenging.

By using DAMON-based operation schemes (DAMOS) via ``damo schemes``, you will
be able to easily optimize your workload in such a case.  Our example schemes
called 'efficient THP' and 'proactive reclamation' achieved significant speedup
and memory space saves against 25 realistic workloads [2].

That said, note that you need careful tune of the schemes (e.g., target region
size and age) and monitoring attributes for the successful use of this
approach.  Because the optimal values of the parameters will be dependent on
each system and workload, misconfiguring the parameters could result in worse
memory management.

For the tuning, you could measure the performance metrics such as IPC, TLB
misses, and swap in/out events and adjusts the parameters based on their
changes.  The total number and the total size of the regions that each scheme
is applied, which are provided via the debugfs interface and the programming
interface can also be useful.  Writing a program automating this optimal
parameter could be an option.


Personalized DAMON Application
------------------------------

Above approaches will work well for many general cases, but would not enough
for some special cases.

If this is the case, it might be the time to forget the comfortable use of the
user space tool and dive into the debugfs interface (refer to :doc:`usage` for
the detail) of DAMON.  Using the interface, you can control the DAMON more
flexibly.  Therefore, you can write your personalized DAMON application that
controls the monitoring via the debugfs interface, analyzes the result, and
applies complex optimizations itself.  Using this, you can make more creative
and wise optimizations.

If you are a kernel space programmer, writing kernel space DAMON applications
using the API (refer to the :doc:`/mm/damon/api` for more detail) would be an
option.


Reference Practices
===================

Referencing previously done successful practices could help you getting the
sense for this kind of optimizations.  There is an academic paper [1]
reporting the visualized access pattern and manual `Program
Modification` results for a number of realistic workloads.  You can also get
the visualized access patterns [3,4,5] and
`Automated DAMON-based Memory Operations` results for other realistic
workloads that collected with latest version of DAMON [2].

[1] https://dl.acm.org/doi/10.1145/3366626.3368125  
[2] https://damonitor.github.io/test/result/perf/latest/html/  
[3] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.1.png.html  
[4] https://damonitor.github.io/test/result/visual/latest/rec.wss_sz.png.html  
[5] https://damonitor.github.io/test/result/visual/latest/rec.wss_time.png.html
