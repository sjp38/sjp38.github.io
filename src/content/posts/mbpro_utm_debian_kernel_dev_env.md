+++
title = 'UTM-based Linux kernel development environment on Macbook Pro'
date = 2025-11-01T14:16:09-07:00
draft = false
tags = ["macbook pro", "development environment setup", "kcbench", "debian"]
categories = ["setup"]
+++

I got a Macbook Pro.  I was wondering if I can do kernel development on it
since I recently [learned]({{< relref
"posts/mini_desktop_as_local_kernel_hacking_machine.md" >}}) that modern small
computers are fast enough to be used for frequent kernel builds.  I also heard
a few of my previous colleague kernel developers use their Macbook for kernel
builds.

Unfortunately I cannot install Linux kernel on the laptop at the moment,
though.  I hence created a Debian13 VM on it using
[UTM](https://mac.getutm.app/) and ran the kernel compile benchmark.  I use UTM
since a few web search results warned me QEMU might have some problems with
GUI.  I want Gnome desktop for making slides for my future talks.  Anyway, the
performance of the VM is not bad: a couple of minutes for building a kernel.
More detailed results are as below:

```
$ bash kcbench -s 6.17
[NOTE] Downloading source of Linux 6.17; this might take a while...
Processor:           - [10 threads]
Cpufreq; Memory:     Unknown; 11942 MiB
Linux running:       6.12.48+deb13-arm64 [aarch64]
Compiler:            gcc (Debian 14.2.0-19) 14.2.0
Linux compiled:      6.17.0 [/home/debianutm/.cache/kcbench/linux-6.17]
Config; Environment: defconfig; CCACHE_DISABLE="1"
Build command:       make vmlinux
Filling caches:      This might take a while... Done
Run 1 (-j 10):       124.32 seconds / 28.96 kernels/hour [P:925%, 46 maj. pagefaults]
Run 2 (-j 10):       124.26 seconds / 28.97 kernels/hour [P:925%, 48 maj. pagefaults]
Run 3 (-j 13):       125.89 seconds / 28.60 kernels/hour [P:930%, 87 maj. pagefaults]
Run 4 (-j 13):       126.08 seconds / 28.55 kernels/hour [P:930%, 90 maj. pagefaults]
```

While compiling, the fan noise is not quiet.  I can obviously hear it, and
it is much louder than that of my [mini PC]({{< relref
"posts/mini_desktop_as_local_kernel_hacking_machine.md" >}}).  But, I think
this is still a good option for building kernel while traveling.
