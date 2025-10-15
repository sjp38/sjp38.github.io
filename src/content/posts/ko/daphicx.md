+++
title = "DAPHICX: Data Access Pattern Hint Injecting Compiler Extension"
date = 2019-05-30T18:59:53+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = [
	"projects",
	"daphicx",
]
categories = ["projects"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

Memory pressure is inevitable as the size of working sets is rapidly growing
while the capacity of dynamic random access memory (DRAM) is not. Meanwhile,
storage devices have evolved so that their speed is comparable to the speed of
DRAM while their capacity scales are comparable to that of hard disk drives
(HDD). Thus, hierarchial memory systems configuring DRAM as the main memory and
high-end storages as swap devices will be common.

Due to the unique characteristics of these modern storage devices, the swap
target decision should be optimal. It is essential to know the exact data
access patterns of workloads for such an optimal decision, although underlying
systems cannot accurately estimate such complex and dynamic patterns. For this
reason, memory systems allow programs to voluntarily hint their data access
pattern. Nevertheless, it is exhausting for a human to manually figure out the
patterns and embed optimal hints if the workloads are huge and complex.

This project introduces a compiler extension that automatically optimizes a
program to voluntarily hint its dynamic data access patterns to the underlying
swap system using a static/dynamic analysis based profiling result. To our best
knowledge, this is the first profile-guided optimization (PGO) for modern swap
devices. Our empirical evaluation of the scheme using realistic workloads shows
consistent improvement in performance and swap device lifetime up to 2.65 times
and 2.98 times, respectively.


Publications And Presentations
==============================

- SeongJae Park, Yunjae Lee, Moonsub Kim Heon Y. Yeom, __Automating Context
  Based Access Pattern Hint Injection for System Performance and Swap Storage
  Durability.__ In 11th USENIX Workshop on Hot Topics in Storage and File
  Systems (HotStorage), July 2019.
  [Paper](https://www.usenix.org/system/files/hotstorage19-paper-park.pdf),
  [Slides](https://www.usenix.org/sites/default/files/conference/protected-files/hotstorage19_slides_park.pdf)
- SeongJae Park, Yunjae Lee, Moonsub Kim, Heon Y. Yeom, __Automated Data Access
  Pattern Hint Instrumentation for System Performance and Durability of Swap
  Storages.__ (WiP) In 17th USENIX Conference on File and Storage Technologies
  (FAST), February 2019.
  [Link](https://www.usenix.org/conference/fast19/wips)
