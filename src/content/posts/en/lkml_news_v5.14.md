---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.14"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2021-08-24T07:29:50+02:00
lastmod: 2021-08-24T07:29:50+02:00
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

[GIT PULL] Memory folios for v5.15 (Matthew Wilcox)
---------------------------------------------------

https://lkml.kernel.org/r/YSPwmNNuuQhXNToQ@casper.infradead.org

Matthew Wilcox sent a pull request for his page folio works to Linus Torvalds.
Linus Torvalds replied he wants this to work in reverse.  That is, calling head
pages as normal pages but calling tail pages something other, as the term,
page, is more common and de-facto standard in the industry.


mmotm 2021-08-23-16-42 uploaded (Andrew Morton)
-----------------------------------------------

https://lkml.kernel.org/r/20210823234329.H9WD-du1K%akpm@linux-foundation.org

MMOTM is rebased on v5.14-rc7 and uploaded.  In total, 10 patches dropped and
16 added.

```
Dropped
-------

hugetlb-dont-pass-page-cache-pages-to-restore_reserve_on_error.patch
kfence-fix-is_kfence_address-for-addresses-below-kfence_pool_size.patch
maintainers-update-clangbuiltlinux-irc-chat.patch
mm-hwpoison-retry-with-shake_page-for-unhandlable-pages.patch
mm-memcontrol-fix-occasional-ooms-due-to-proportional-memorylow-reclaim.patch
mm-page_alloc-dont-corrupt-pcppage_migratetype.patch
mm-vmscan-fix-missing-psi-annotation-for-node_reclaim.patch
mmflagsh-add-missing-__gfp_zerotags-and-__gfp_skip_kasan_poison-names.patch
revert-mm-shmem-fix-shmem_swapin-race-with-swapoff.patch
revert-mm-swap-check-if-swap-backing-device-is-congested-or-not.patch

Added
-----

checkpatch-improve-git_commit_id-test-fix.patch
checkpatch-improve-git_commit_id-test.patch
compiler-attributes-add-__alloc_size-for-better-bounds-checking-fix.patch
kernel-unexport-get_mmtask_exe_file.patch
mm-memory_hotplug-fix-potential-permanent-lru-cache-disable.patch
mm-memory_hotplug-make-hwpoisoned-dirty-swapcache-pages-unmovable.patch
mm-memory_hotplug-use-helper-zone_is_zone_device-to-simplify-the-code.patch
mm-migrate-change-to-use-bool-type-for-page_was_mapped.patch
mm-migrate-fix-the-incorrect-function-name-in-comments.patch
mm-migrate-introduce-a-local-variable-to-get-the-number-of-pages.patch
mm-migrate-simplify-the-file-backed-pages-validation-when-migrating-its-mapping.patch
mm-secretmem-use-refcount_t-instead-of-atomic_t.patch
mm-unexport-folio_memcg_unlock.patch
mm-unexport-unlock_page_memcg.patch
mm-vmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
selftests-vm-use-kselftest-skip-code-for-skipped-tests.patch

summary: 10 drop, 16 add, 49 modified
# from 2021-08-20 07:38:07 +0200 to 2021-08-24 07:36:41 +0200
```


[PATCH 0/6] netfs, afs, ceph: Support folios, at least partially (David Howells)
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk

This patchset makes netfs to use folios, though it's unclear if folio will be
merged in as is now.


[PATCH v4 00/14] mm, sparse-vmemmap: Introduce compound devmaps for device-dax (Joao Martins)
---------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20210827145819.16471-1-joao.m.martins@oracle.com

This patchset tries to minimize the 'struct page' overhead for pmem use case.


[PATCH v8 0/3] Anonymous VMA naming patches (Suren Baghdasaryan)
----------------------------------------------------------------

https://lkml.kernel.org/r/20210827191858.2037087-1-surenb@google.com

There were several idea for making anonymous virtual memory area to be able to
be named, but not yet any implementation was merged.  This patchset continues
the work.


Discontiguous folios/pagesets (Matthew Wilcox)
----------------------------------------------

https://lkml.kernel.org/r/YSqIry5dKg+kqAxJ@casper.infradead.org

Folio is for helping VM dealing with physically contiguous chunks of memory.
This mail iscuss about extending folios for logically contiguous but physically
discontiguous chunks of memory.


Linux 5.14 (Linus Torvalds)
---------------------------

https://lkml.kernel.org/r/CAHk-=wh75ELUu99yPkPNt+R166CK=-M4eoV+F62tW3TVgB7=4g@mail.gmail.com

One week after the -rc7, Linux 5.14 is released.  Now let's see what v5.15
would be look like after the merge window completes.

Below is the diffstat of the releases in the last two years.

![Kernel release stat](/img/kernel_release_stat/v5.3-rc8..v5.14.png)

Note that the y-axis is in logarithm.  I draw it using
https://github.com/sjp38/relstat and https://github.com/sjp38/lazybox using
below command:

    $ relstat.py --since 2019-06-28 | ~/lazybox/gnuplot/plot.py \
	    --data_fmt table --type labeled-lines --xtics_rotate -90 \
	    --font "Times New Roman, 5pt" --ylog --pointsize 0.3
