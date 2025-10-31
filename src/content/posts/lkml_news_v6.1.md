---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v6.1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2022-12-06T07:12:28-08:00
lastmod: 2022-12-06T07:12:28-08:00
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

[PATCH v3] [mm-unstable] mm: Fix memcg reclaim on memory tiered systems (Mina Almasry)
--------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221206023406.3182800-1-almasrymina@google.com

There was a patch for enabling demotion via `memory.reclaim` memcg file.  It
made `try_to_free_mem_cgroup_pages()` behavior changed.  As the changed
behavior is somewhat the users of the caller didn't expect, this patch fixes
it.


[PATCHv8 00/14] mm, x86/cc: Implement support for unaccepted memory (Kirill A. Shutemov)
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221207014933.8435-1-kirill.shutemov@linux.intel.com

Some confidential VM approaches like Intel TDX or AMD SEV-SNP requires the
guests to _accept_ memory that they will use before use.  As the acceptance
takes time, it can increase the boot time.  This patchset makes the kernel to
support the unaccepted memory case for reducing the boot time by postpone
memory acceptance until memory is needed.


[PATCH] cma:tracing: Print alloc result in trace_cma_alloc_finish (Wenchao Hao)
-------------------------------------------------------------------------------

https://lkml.kernel.org/r/20221208142130.1501195-1-haowenchao@huawei.com

`cma_alloc_finish` tracepoint does not print the contiguous memory allocation
result.  To help the result-based following additional operations, this
patchset adds the information to the tracepoint.


[PATCH v8 00/16] TDX host kernel support (Kai Huang)
----------------------------------------------------

https://lkml.kernel.org/r/cover.1670566861.git.kai.huang@intel.com

This patchset adds initial support for Intel Trusted Domain Extension (TDX),
which protects guest VMs from malicious host.


Linux 6.1 (Linus Torvalds)
--------------------------

https://lkml.kernel.org/r/CAHk-=wj_HcgFZNyZHTLJ7qC2613zphKDtLh6ndciwopZRfH0aQ@mail.gmail.com

After the ten eight weeks of staging, Linux 6.1 has released.  This also means
the merge window for v6.2 has opened.  Because the merge window will be through
the holiday season, Linus asks people to be more strict about the merge window
rules.  That is, every pull request should have been ready before the merge
window, and spent some time on the next tree with the automated tests.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.11-rc1..v6.1.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2020-12-12 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
