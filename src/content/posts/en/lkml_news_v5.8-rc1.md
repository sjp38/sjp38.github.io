---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.8-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-06-03T06:45:01+02:00
lastmod: 2020-06-03T06:45:01+02:00
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

[PATCH v6] mm: Proactive compaction (Nitin Gupta)
-------------------------------------------------

https://lkml.kernel.org/r/20200601194822.30252-1-nigupta@nvidia.com

This is the sixth version of the proactive compaction patchset.  It makes
compaction to be able to triggered earlier than final memory pressure using
knobs.  The goal is better THP allocation success.


[PATCH] vmalloc: Convert to XArray (Matthew Wilcox)
---------------------------------------------------

https://lkml.kernel.org/r/20200603171448.5894-1-willy@infradead.org

This patchset converts the radix tree for vmap blocks into XArray.


incoming (Andrew Morton)
------------------------

https://lkml.kernel.org/r/20200608212922.5b7fa74ca3f4e2444441b7f9@linux-foundation.org

MM-side pull request.  It contains the "mmap locking API: initial
implementation as rwsem wrappers" patchset.  I believe this would help killing
the ``mmap_sem``.


[Ksummit-discuss] [TECH TOPIC] Documentation (Jonathan Corbet)
--------------------------------------------------------------

https://lkml.kernel.org/r/20200609145353.628a342d@lwn.net

The 4th kernel summit talk proposal.  Jonathan says the conversion of the
kernel doc to RST is almost done, and he wants to discuss about the next step
in the kernel summit.


[RFC v6 00/51] Large pages in the page cache (Matthew Wilcox)
-------------------------------------------------------------

https://lkml.kernel.org/r/20200610201345.13273-1-willy@infradead.org

Yet another version of the patchset.  More bugs are fixed and therefore more of
xfstests passes, though not complete.


[PATCH v2] scripts/spelling: Recommend blocklist/allowlist instead of blacklist/whitelist (SeongJae Park)
---------------------------------------------------------------------------------------------------------

https://lore.kernel.org/lkml/20200609122549.26304-1-sjpark@amazon.com/

This patchset adds blacklist/whitelist in the spelling typo file of the kernel
so that every patches using the term could get warnings.  The patch merged in
the ``-mm`` tree immediately, but dropped again[1] as the maintainer of the
``checkpatch.pl` required a revisement.

[1] https://marc.info/?l=linux-mm-commits&m=159182303424009&w=2


[patch 24/25] mm: use only pidfd for process_madvise syscall (Linus Torvalds)
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/CAHk-=wgx=-vbxpDqsunkMTqQDD+oqcU9JQeW+MApGQeZD6hr6Q@mail.gmail.com

The pull request for ``process_madvise()`` patchset finally made, but Torvalds
denied it, due to the inconcrete decision of the signature.  The author of the
patchset, Minchan, promised he will revise it after this merge window finishes.


Linux 5.8-rc1 (Linus Torvalds)
------------------------------

https://lkml.kernel.org/r/CAHk-=whfuea587g8rh2DeLFFGYxiVuh-bzq22osJwz3q4SOfmA@mail.gmail.com

The merge window is finished and 5.8-rc1 is released.  Unexpectedly, this
release is the biggest one in the kernel history.  There is no other tricks
such as pending of the release or some strange script based change.  About 20%
of all the files in the kernel tree has modified.

Below is the diffstat of the releases in the last two years.  Note that the
y-axis is in logarithm.  I draw it using https://github.com/sjp38/relstat.

![Kernel release stat](/img/kernel_release_stat/v4.18-rc2..v5.8-rc1.png)
