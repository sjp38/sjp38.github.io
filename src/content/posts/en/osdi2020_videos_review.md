---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Watching OSDI 2020 presentation videos"
subtitle: ""
summary: ""
authors: []
tags: ["osdi", "osdi20", "paper"]
categories: ["researches review"]
date: 2020-12-19T22:35:27+01:00
lastmod: 2020-12-19T22:35:27+01:00
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

I set watching at least one OSDI'20 presentation video per day during the
long vacation as one of my plans.

---

A large scale analysis of hundreds of in-memory cache clusters at Twitter
-------------------------------------------------------------------------

https://www.youtube.com/watch?v=OQtMM5vdhlI&feature=emb_title

The authors traced and analyzed the workloads on the Twitter's in-memory cache
systems.  To me, below findings were interesting.  

- There are many write requests.
- Size of each object is not so big (median 200 bytes), so metadata, which
  sizes 64 bytes per each object, is a burden
- Size of each key is not small compared to the size of each value.

The trace data is available via github[1].  It's 2.8TB for compressed version,
and 14TB for uncompressed version.

[1] https://github.com/twitter/cache-trace


AIFM: High-Performance, Application-Integrated Far Memory
---------------------------------------------------------

https://www.youtube.com/watch?v=xHhaniGXTUg&feature=emb_title

OS-level fast-network-based far memory approaches provide transparency to the
application but wastes performance due to the semantic gap due to the
fixed-size page abstraction and the kernel space time consumption.  AIFM solves
the semantic gap using new data structure abstraction and provides user space
runtime that don't need kernel space time consumption.  As a result, the
application is required to be modified, but the authors argue it's only modest
change.  Compared to other state-of-the-art (FastSwap from EuroSys'20), it
achieved 13x speedup.


LinnOS: Predictability on Unpredictable Flash Storage with a Light Neural Network
---------------------------------------------------------------------------------

https://www.youtube.com/watch?v=yzv9lcjxhAg&feature=emb_title

It's not easy to predict each I/O speed of modern fast storage devices, due to
their complex internals like the caching, the wear-leveling and the garbage
collection.  One well-known solution is hedging.  It prepare an array of SSDs,
issue I/O to one of them, and if the response doesn't made until a timeout,
revoke the request and try with another SSD.  The wait time limit bounds the
latency.  LinnOS uses an approach similar to the hedging, but it uses a neural
network that can predict if each I/O to each SSD will be served fast or not.
For this, the neural network receives current I/O queue depth and queue depths
and latencies of last few I/Os as input.  Then, it predicts if the latency will
be only fast or slow.  To mitigate with the effect from wrong predictions, it
uses biased learning and adaptive hedging based on the prediction accuracy.
The network is learned offline.


Do OS abstractions make sense on FPGAs?
---------------------------------------

https://www.youtube.com/watch?v=k-cp4U3JKug&feature=emb_title

Computer systems embedding FPGA in addition to CPU, called heterogeneous
computing systems, are widesparead nowadays.  These systems typically have high
operational complexity.  Especially developing and deploying FPGA application
is quite complicated.  For the reason, some manufacturers provide some FPGA
shells providing some of the OS abstractions.  The authors developed a FPGA
shell called Coyote, which provides full abstraction sets of the OS and
experimented if it works well for the systems.  The result was very positive.


Fast RDMA-based Ordered Key-Value Store using Remote Learned Cache
------------------------------------------------------------------

https://www.youtube.com/watch?v=Qv-0YL_SII4&feature=emb_title

Because server-centric key-value store (KVS) performance bound to the server
CPUs, RDMA-based approaches were proposed.  Because one RTT is required for one
RDMA, the approaches require many round trips and therefore doesn't show high
performance.  Caching the index in client is one solution, but it makes huge
client memory footage.  The authors propose to use neural network as the index
cache.  They train neural network to receive key and provide logical address of
the value for the key in server.  The network retrained for dynamci updates and
copyied to clients.  Then, client use the nerual network, which is much smaller
than the full index tree to know the address of the value and fetch it via the
RDMA.


A Simpler and Faster NIC Driver Model for Network Functions
-----------------------------------------------------------

https://www.youtube.com/watch?v=zKJIY4vbBDA&feature=emb_title

Software-defined network approach, which implements functionality of appliances
like bridege, router, firewall is widespread.  For better performance and
flexibility, the software complexity has increased so that it's hard to do
formal verification of the network stacks.  The authors argue that by
sacrificing some of the fliexibility, it's available to implement simple and
fast network stack.  They prove their idea with a new network driver model,
tinynf.  They implemented a driver for Intel 82599 based on the driver model
with only 550 lines of code.  It was able to finish formal verification 7x
faster than a state-of-the-art driver.  Also, it achieved 1.6x performance
compared to the state-of-the-art.


Theseus: an experiment in operating system structure and state management
-------------------------------------------------------------------------

https://www.youtube.com/watch?v=i1pLDZKtlBI

In this paper, the authors present an OS called Theseus that designed for state
spill problem.  For this, they made it to composed with many tiny components
called 'cell', and applied rust-like language level safe guaranteeness
mechanisms in the OS level.


Specification and verification in the field: Applying formal methods to BPF just-in-time compilers in the Linux kernel
----------------------------------------------------------------------------------------------------------------------

https://www.youtube.com/watch?v=2V3ts5-W_9g&feature=emb_title

BPF program is verified before run, but it runs after compiled via JIT, after
the verification.  Therefore, if there is a bug in the JIT, real problem
occurs.  The authors of this paper devloped a new BPF JIT for RISC-V with a JIT
correctness specification framework, jitterbug.  The changes made to the kernel
are merged into the mainline kernel.


Storage Systems are Distributed Systems (So Verify Them That Way!)
------------------------------------------------------------------

https://www.youtube.com/watch?v=4s8EeXcu_8Y&feature=emb_title

Storage systems have high complexity, so it's hard to do the verification.  The
authors of this paper realized the architecture and charactersitics of the
storage systems are similar to those of distributed systems, and applied the
verification methodologies for distributed systems to the storage systems after
making it more general.  Based on this, they implemented a verifiable key-value
storage, VeriSafeKV.  The performance of it was similar to unverified DB
systems.


Caladan: Mitigating Interference at Microsecond Timescales
----------------------------------------------------------

https://www.youtube.com/watch?v=G-v3ndwixOI&feature=emb_title

On a system, multiple workloads that has different requirements co-scheduled.
For example, some workloads only need best-effort resources while others
require strict tail latency.  Because the workloads share some hardware
resources like LLC and memory bandwidth, it's hard to fulfill all the
requirements.  Well know solution is resource partitioning.  Because static
partitioning could result in low resource utilization, dynamic partitioning
solutions were previously proposed.  However, the dynamic partitioning doesn't
provide microsecond granularity decision, while 100 microseconds is the
marginal timewindow to guarantee the tail latency problem, according to the
authors' arguments.  The authors propose to use different interference signals
and design the system to work in micro-second level.


Semeru: A Memory-Disaggregated Managed Runtime
----------------------------------------------

https://www.youtube.com/watch?v=MFA3MmNDKaM&feature=emb_title

Constructing system as distributed machines for different works such as CPU
works and memory works are know ans resource-disaggregated architecture and
gaining popularity.  However, the architecture is usually written for native
applications rather than GC-based applications.  This paper introduces JVM
runtime, Semeru, which is designed for resource-disaggregation architecture.


PANIC: A High-Performance Programmable NIC for Multi-tenant Networks
--------------------------------------------------------------------

https://www.youtube.com/watch?v=EB6dK3L8Jzg&feature=emb_title

Multi-tenant networks require generality, flexible chaining, isolation, and
performance to programmable NIC.  However, current programmable NICs doesn't
support those.  Authors propose a new programmable NIC design for the
requirements and introduce an implementation on FPGA, PANIC.


Serving DNNs like Clockwork: Performance Predictability from the Bottom Up
--------------------------------------------------------------------------

https://www.youtube.com/watch?v=wHOpY_MY57Y&feature=emb_title

Nowadays, data center serves for many machine learning models for different
users.  Even though the latency of each inference is predictable because it has
no conditional branches, the models serving system could result in
unpredictable end-to-end latency.  This paper proposes a new machine learning
models serving system that designed do protect the latency.


Teting Configuration Changes in Context to Prevent Production Failures
----------------------------------------------------------------------

https://www.youtube.com/watch?v=QrGKmp3ALKQ&feature=emb_title

In this paper, a new test framework called 'ctest' is proposed for validation
of configuration changes that can made in production environment.  It's similar
to other test frameworks like Junit in its form.
