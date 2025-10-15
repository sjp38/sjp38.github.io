---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.19"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-07-25T16:40:01-07:00
lastmod: 2022-07-25T16:40:01-07:00
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

[PATCH v4 0/3] mm/mprotect: Fix soft-dirty checks (Peter Xu)
------------------------------------------------------------

https://lkml.kernel.org/r/20220725142048.30450-1-peterx@redhat.com

Fourth version of the soft-dirty check fixes for mprotect has posted.  This
version polishes the commit message and adds tests.


[PATCH v2 1/2] mm/slub: enable debugging memory wasting of kmalloc (Feng Tang)
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220725112025.22625-1-feng.tang@intel.com

As slab allocates memory in only power of 2 bytes size, memory can be wasted
when slab allocation is requested for a large number of times for objects that
sizes not aligned in power of two bytes.  For example, if 1025 bytes memory
allocation is requested, slab will allocate 2048 bytes in real and therefore
1023 bytes are only wasted.  This patch makes the existing slab debugging
interface (`/sys/kernel/debug/slab/kmalloc-xx/alloc_traces`) to show how much
if the memory is wasted due to the requested memory size that not aligned to
`2^n`.


[PATCH v2] mm/page_owner.c: add llseek for page_owner (Kassey Li)
-----------------------------------------------------------------

https://lkml.kernel.org/r/20220727125508.5154-1-quic_yingangl@quicinc.com

This patch allows specifying ppos as `start_pfn` for page_owner information of
given cma region.


[GIT PULL] hotfixes for 5.19 (Andrew Morton)
--------------------------------------------

https://lkml.kernel.org/r/20220726184208.db1dc1adf4f59b86f0e5099a@linux-foundation.org

Andrew has posted a pull request for mm hotfixes to Linus.


[PATCH v11 0/8] mm/demotion: Memory tiers and demotion ("Aneesh Kumar K.V")
---------------------------------------------------------------------------

https://lkml.kernel.org/r/20220728190436.858458-1-aneesh.kumar@linux.ibm.com

The eleventh version of the patchset for the better memory tiering structure
management and demotion has posted.


[RFC PATCH bpf-next 00/15] bpf: Introduce selectable memcg for bpf map (Yafang Shao)
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20220729152316.58205-1-laoar.shao@gmail.com

This patchset introduces an independent memcg for limiting bpf program's memory
usage.  It allows assigning a specific memcg when creating bpf map.


[GIT PULL] final hotfixes for 5.19 (Andrew Morton)
--------------------------------------------------

https://lkml.kernel.org/r/20220729204454.b38fba22290c5b54733cedb5@linux-foundation.org

Andrew Morton sent two more hotfixes for v5.19 to Linus Torvalds.  This must be
the final hotfixes.


Linux 5.19 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com

Linus has released the v5.19 Linux kernel.  Some changes for arch to annotate
`READ_ONCE()` calls for static checkers and random small changes are there.
Torvalds also note that this release has made on arm64 thank to Asahi team's
efforts.  Maybe he's using the Macbook.

Now, the merge window for the next version of the Linux kernel will open.
Torvalds also note that the next version will be 6.0 instead of 5.20.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.9-rc1..v5.19.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-07-31 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
