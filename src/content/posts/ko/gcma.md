+++
date = "2017-01-14T23:11:23+09:00"
categories = [
	"projects",
]
tags = [
	"projects",
	"gcma",
]
thumbnail = ""
title = "GCMA: Guaranteed Contiguous Memory Allocator"
description = ""

+++

The importance of physically contiguous memory has increased in modern
computing environments, including both low- and high-end systems. Existing
physically contiguous memory allocators generally have critical limitations.
For example, the most commonly adopted solution, the memory reservation
technique, wastes a significant amount of memory space. Scatter/Gather direct
memory access (DMA) and input-output memory management units (IOMMUs) avoid
this problem by utilizing additional hardware for address space virtualization.
However, additional hardware means an increase in costs and power consumption,
which is especially disadvantageous for small systems and they do not provide
real contiguous memory. Linux Contiguous Memory Allocator (CMA) aims to provide
both contiguous memory allocation and to maximize memory utilization based on
page migration, but they suffer from unpredictably long latency and a high
probability of allocation failure. Therefore, we introduce a new solution to
this problem, the guaranteed contiguous memory allocator (GCMA). This
guarantees efficient memory space utilization, short latency, and successful
allocation. The GCMA uses a reservation scheme and increases memory utilization
by sharing the memory with immediately discardable data. Our evaluation of a
GCMA on a Raspberry Pi 2 finds a latency that is 15-130 times lower compared to
a CMA, and a latency that is up to 10 times lower when taking a photo. Using a
large working set in a memory-fragmented high-end system, the GCMA is able to
produce a 2.27× speedup.


Source Code
===========

The source code for this version has been submitted to [LKML](
https://lkml.org/lkml/2015/2/23/480) for discussion.
A complete git tree is also available at [Github](
https://github.com/sjp38/linux.gcma).


Publications and Presentations
==============================

- SeongJae Park, Minchan Kim, Heon Y. Yeom, __GCMA: Guaranteed Contiguous
  Memory Allocator.__ In _Transactions on Computers_, March 2019.
  [Link](https://ieeexplore.ieee.org/document/8456561)
- SeongJae Park, __GCMA: Guaranteed Contiguous Memory Allocator.__ In _The
  Linux Kernel Summit_, November 2018.
  [Slides](https://linuxplumbersconf.org/event/2/contributions/247/attachments/74/85/gcma_ksummit2018.pdf),
  [Video](https://www.youtube.com/watch?v=ARrelFfdVkw),
  [Link](https://linuxplumbersconf.org/event/2/contributions/247/)
- SeongJae Park, Minchan Kim, Heon Y. Yeom, __GCMA: Guaranteed Contiguous
  Memory Allocator.__ In _45th issue of ACM SIGBED Review_, January 2016.
  [Paper](http://sigbed.seas.upenn.edu/archives/2016-01/EWiLi15_4.pdf),
  [Link](http://sigbed.seas.upenn.edu/vol13_num1.html#issue)
- SeongJae Park, Minchan Kim, Heon Y. Yeom, __GCMA: Guaranteed Contiguous
  Memory Allocator.__ In _Embedded Operating Systems Workshop (EWiLi)_, October
  2015.
  [Paper](http://ceur-ws.org/Vol-1464/ewili15_12.pdf),
  [Slides](https://www.slideshare.net/SeongJaePark1/gcma-guaranteed-contiguous-memory-allocator)
- SeongJae Park, Minchan Kim, __GCMA: Guaranteed Contiguous Memory Allocator.__
  In _Linux Foundation Korea Linux Forum (LFKLF)_, October 2014.
  [Slides](http://events.linuxfoundation.org/sites/events/files/slides/gcma-guaranteed_contiguous_memory_allocator-lfklf2014_0.pdf)
