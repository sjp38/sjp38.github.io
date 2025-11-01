---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "A mini desktop as a local kernel hacking machine"
subtitle: ""
summary: ""
authors: []
tags: ["minipc", "debian", "kcbench", "development environment setup"]
categories: ["setup"]
date: Fri, 31 Oct 2025 17:37:13 -0700
lastmod: Fri, 31 Oct 2025 17:37:13 -0700
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

A few weeks ago I heard modern normal computers can build kernel
[faster](https://social.kernel.org/notice/AymCqaJxA552BYAxqC) than I expected.
My 10 years old personal laptop (Thinkpad X1) used to build a kernel per a
couple of hours.  The last time I built kernel on the laptop was about 8 years
ago.  Since then, I was always using only workstation or server level machines
for building kernels.

So I wanted to know how good modern normal desktop-level machines are, by
myself.  Also I was about to lose access to my previous development
environment, and expecting a few weeks for setting a new one.

So I bought a ~$320 mini PC from
[Amazon](https://www.amazon.com/dp/B0F62NFK51?ref=ppx_yo2ov_dt_b_fed_asin_title).
On the machine, I installed Debian13 desktop and ran
[kcbench](https://gitlab.com/knurd42/kcbench).  The results are as below:

```
$ bash kcbench -s 6.17
Processor:           AMD Ryzen 7 6800H with Radeon Graphics [16 threads]
Cpufreq; Memory:     powersave [amd-pstate-epp]; 27841 MiB
Linux running:       6.12.48+deb13-amd64 [x86_64]
Compiler:            gcc (Debian 14.2.0-19) 14.2.0
Linux compiled:      6.17.0 [/.../.cache/kcbench/linux-6.17]
Config; Environment: defconfig; CCACHE_DISABLE="1"
Build command:       make vmlinux
Filling caches:      This might take a while... Done
Run 1 (-j 16):       161.38 seconds / 22.31 kernels/hour [P:1440%, 134 maj. pagefaults]
Run 2 (-j 16):       162.53 seconds / 22.15 kernels/hour [P:1441%, 140 maj. pagefaults]
Run 3 (-j 19):       172.87 seconds / 20.82 kernels/hour [P:1366%, 266 maj. pagefaults]
Run 4 (-j 19):       164.76 seconds / 21.85 kernels/hour [P:1446%, 258 maj. pagefaults]
Run 5 (-j 8):        190.83 seconds / 18.86 kernels/hour [P:742%, 49 maj. pagefaults]
Run 6 (-j 8):        190.21 seconds / 18.93 kernels/hour [P:743%, 55 maj. pagefaults]
Run 7 (-j 11):       178.62 seconds / 20.15 kernels/hour [P:1011%, 96 maj. pagefaults]
Run 8 (-j 11):       185.62 seconds / 19.39 kernels/hour [P:975%, 126 maj. pagefaults]
```

So, about three minutes per clean kernel build.  I'd say this is not bad for
small kernel hacking setup.  While the build is ongoing, I can definitely hear
the fan is running.  But that's not that bad.  At least not worse than the fan
for myself that I use in summer.

I also setup a QEMU-based virtual machine, providing 8 cores and 16 GiB memory.
Still, it works reasonably fast.

```
Processor:           QEMU Virtual CPU version 2.5+ [8 threads]
Cpufreq; Memory:     Unknown; 6738 MiB
Linux running:       6.18.0-rc1-mm-new-damon+ [x86_64]
Compiler:            gcc (Debian 14.2.0-19) 14.2.0
Linux compiled:      6.17.0 [/.../.cache/kcbench/linux-6.17/]
Config; Environment: defconfig; CCACHE_DISABLE="1"
Build command:       make vmlinux
Filling caches:      This might take a while... Done
Run 1 (-j 8):        209.24 seconds / 17.21 kernels/hour [P:742%, 33 maj. pagefaults]
Run 2 (-j 8):        209.67 seconds / 17.17 kernels/hour [P:742%, 40 maj. pagefaults]
Run 3 (-j 10):       214.39 seconds / 16.79 kernels/hour [P:744%, 133 maj. pagefaults]
Run 4 (-j 10):       214.73 seconds / 16.77 kernels/hour [P:744%, 134 maj. pagefaults]
```

I have used this mini machine as my DAMON hacking environment for last three
weeks, and quite satisfied so far.  I even traveled with it.  I brought
bluetooth keyboard (having a trackpoint like Thinkpad laptops) and an HCMI
cable together, and connected the machine with a tv in the hotel room.  It was
weird to code on the bad, but anyway it worked with no problem.

So my take on these results I got so far is that the world has been much more
kind for hobbyist kernel hackers.  And I can continue kernel hacking without
serious build machine resource dependencies.
