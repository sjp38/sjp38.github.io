---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "A mini desktop as a local kernel hacking machine"
subtitle: ""
summary: ""
authors: []
tags: ["minipc", "debian", "kcbench", "development environment setup"]
categories: []
date: 2025-10-10T17:21:24-07:00
lastmod: 2025-10-10T17:21:24-07:00
featured: false
draft: true

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

Seems modern normal computers can build kernel
[faster](https://social.kernel.org/notice/AymCqaJxA552BYAxqC) than I expected.
My 10 years old personal laptop (Thinkpad X1) used to build a kernel per ~2.5
hours.  The last time I built kernel on the laptop was about 8 years ago.

The last time I worked with local machines was more than 6 year ago.  Since
then, I was always using only cloud-like environment.

So I got curious how good modern normal desktop-level machines are.  Also I am
gonna lose access to my current development environment soon, and expecting a
few weeks for setting next environment.

So I bought a ~$320 mini PC from
[Amazon](https://www.amazon.com/dp/B0F62NFK51?ref=ppx_yo2ov_dt_b_fed_asin_title).

Installed Debian13 desktop and ran
[kcbench](https://gitlab.com/knurd42/kcbench).  I can hear the fan is running,
but not that bad.  At least not worse than the fan for myself that I use in
summer.

The kcbench results:

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

I prefer isolating my development environment on a virtual machine since I
don't have many spare machines.  I therefore setup a QEMU-based virtual
machine, provide 8 cores and 16 GiB memory.  Still, it works reasonably fast
for kernel compile.

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
