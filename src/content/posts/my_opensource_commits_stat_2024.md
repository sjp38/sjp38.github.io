---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My opensource commits statistics in 2024"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source", "commits", "github", "statistics"]
categories: ["statistics"]
date: Tue, 31 Dec 2024 10:16:21 -0800
lastmod: Tue, 31 Dec 2024 10:16:21 -0800
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

As today is the last day of 2024, I checked my open source commits statistics
using my simple and buggy
[scripts](https://github.com/sjp38/lazybox/blob/master/git_helpers/).  Similar
statistics for 2023 is available at another [post]({{< ref
"my_opensource_commits_stat_2023.md" >}}).

Note that the script may have bugs, and numbers don't tell everything.

In short, I made 7th and 2nd biggest changes to Linux kernel memory
management subsystem among the 340 people, in terms of lines of changes (2,347)
and commits (102).

For the Linux kernel whole tree, the numbers become 235-th (3,754 lines) and
74th (150 commits) among 5,278 people.

I also made around 45,000 lines of changes with around 2,500 commits for
non-Linux open source projects.

Linux kernel statistics
-----------------------

I ran my buggy script[1] to show some 2024 statistics for memory management
subsystem and whole tree of Linux kernel as below.

```
$ date
Tue Dec 31 10:23:57 AM PST 2024
$
$ # for memory management subsystem, number of changed lines
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2024-01-01 --until 2024-12-31 --skip_merge_commits \
        --sortby lines --max_nr_authors 9
[...]
7. SeongJae Park <sj@kernel.org>: 2347 lines
[...]
# 340 authors, 82650 lines in total
$
$ # for memory management subsystem, number of commits
$ ./authors.py ~/linux --commits linus/master --linux_subsystems "MEMORY MANAGEMENT" --since 2024-01-01 --until 2024-12-31 --skip_merge_commits --sortby commits --max_nr_authors 9
[...]
2. SeongJae Park <sj@kernel.org>: 102 commits
[...]
# 340 authors, 1938 commits in total
$
$ # for linux whole tree, number of changed lines
$ ./authors.py ~/linux --commits linus/master \
        --since 2024-01-01 --until 2024-12-31 --skip_merge_commits \
        --sortby lines --max_nr_authors 6000
[...]
235. SeongJae Park <sj@kernel.org>: 3754 lines
[...]
# 5278 authors, 4698294 lines in total
$
$ # for linux whole tree, number of commits
$ ./authors.py ~/linux --commits linus/master \
        --since 2024-01-01 --until 2024-12-31 --skip_merge_commits \
        --sortby commits --max_nr_authors 6000
[...]
74. SeongJae Park <sj@kernel.org>: 150 commits
[...]
# 5278 authors, 71163 commits in total
```

### Memory Management Subsystem

In 2024, 340 people participated in Linux kernel memory management subsystem
development by making 82,650 lines of changes with 1,938 commits.

I made 7th and 2nd biggest changes among the 340 people, for lines of changes
(2,347) and commits (102).  Note that I counted only files under `mm/`
directory of the source tree, though.

Distribution of the numbers can be plotted like below.
```
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2024-01-01 --until 2024-12-31 --skip_merge_commits \
        --sortby lines --max_nr_authors 400 --pr_for_plot | \
        ../gnuplot/plot.py --ylog --pointsize 0.3 mm-lines-per-author-2024.png
```

The plot for the distribution of the number of changed lines per author for
memory management subsystem in 2024 is like below.  Note that y-axis is in
logscale.  My number on the graph is 2,347.

![number of changed lines per author for mm in 2024](/img/2024_open_source_commits_stat/2024_changed_lines_per_author_mm.png)

The plot for the distribution of the number of commits per author for memory
management subsystem in 2024 is like below.  Note that both x-axis and y-axis
are in logscale.  My number on the graph is 102.

![number of commits per author for mm in 2024](/img/2024_open_source_commits_stat/2024_commits_per_author_mm.png)


### Linux kernel Whole Tree

In 2024, 5,278 people participated in Linux kernel development by making
4,598.294 lines of changes with 71,163 commits.

I made 235th and 74th biggest changes among the 5,278 people, for lines of
changes (3,754) and commits (150).

The plot for the distribution of the number of changed lines per author for the
whole Linux kernel source tree in 2024 is like below.  Note that both x-axis
and y-axis are in logscale.  My number on this graph is 3,754.

![number of changed lines per author for linux in 2024](/img/2024_open_source_commits_stat/2024_changed_lines_per_author_linux.png)

The plot for the distribution of the number of commits per author for the whole
Linux kernel source tree in 2024 is like below.  Note that both x-axis and
y-axis is in logscale.  My number on this graph is 150.

![number of commits per author for linux in 2024](/img/2024_open_source_commits_stat/2024_commits_per_author_linux.png)


Non-Linux Kernel Contributions
------------------------------

In 2024, I also I spend some of my time on projects other than Linux kernel
including
- DAMON user-space tool ([`damo`](https://github.com/damonitor/damo)),
- an email tool for DAMON and Linux kernel contributors
  ([`hkml`](https://github.com/sjp38/hackermail)),
- my personal scripts toolbox (['lazybox'](https://github.com/sjp38/lazybox)), and
- perfbook Korean translation (https://github.com/sjp38/perfbook-ko_KR).

Let's see simple record of my contributions on those.

```
$ ./profile_author.py SeongJae --repo ~/damo --max_files 5
# below changes made by
# - SeongJae Park <sj@kernel.org>
# - SeongJae Park <sj38.park@gmail.com>
# since 2024-01-01 11:29:53 -0800 until 2024-12-30 13:56:29 -0800
# <changed_lines> <file>
2846 _damon_sysfs.py
2660 USAGE.md
2079 src/damo_report_access.py
1330 src/damo_show.py
946 src/_damo_records.py
# 19745 total lines
# 113 total files
# 1021 commits

$ ./profile_author.py SeongJae --repo ~/hackermail/ --max_files 5
# below changes made by
# - SeongJae Park <sj@kernel.org>
# - SeongJae Park <sj38.park@gmail.com>
# - SeongJae Park <sjpark@amazon.com>
# since 2024-01-01 11:46:33 -0800 until 2024-12-28 15:02:12 -0800
# <changed_lines> <file>
3753 src/hkml_view.py
2832 src/hkml_view_mails.py
2471 hkml_list.py
2045 USAGE.md
1398 src/hkml_list.py
# 22074 total lines
# 57 total files
# 1560 commits

$ ./profile_author.py SeongJae --repo ~/lazybox/ --max_files 5
# below changes made by
# - SeongJae Park <sj38.park@gmail.com>
# since 2024-01-03 18:16:02 -0800 until 2024-07-26 17:18:56 -0700
# <changed_lines> <file>
513 git_helpers/relstat.py
329 git_helpers/profile_author.py
222 parallel_runs/README.md
219 README.md
208 parallel_runs/exp.py
# 3525 total lines
# 57 total files
# 90 commits

$ ./profile_author.py SeongJae --repo ~/perfbook-ko_KR/ --max_files 5
# below changes made by
# - SeongJae Park <sj38.park@gmail.com>
# since 2024-01-06 09:09:02 -0800 until 2024-02-11 09:09:47 -0800
# <changed_lines> <file>
1814 appendix/whymb/whymemorybarriers.tex
622 glossary.tex
427 appendix/toyrcu/toyrcu.tex
# 2863 total lines
# 3 total files
# 42 commits
```

Like other years, I made no small amount of changes for non-Linux projects in
2024.  Around 2,500 commits of around 45,000 lines of change in total.  I
remind and find a few interesting points below from the numbers.

The last commit to perfbook Korean translation was February 2024, since I
completed the translation of the second edition, which I started since 2021.  I
may do the translation from the scratch again, once the third edition is
tagged.  I highly recommend every programmer to read the book, since it is not
only about performance and parallelism but general software engineering, in my
opinion.

My last commit to `lazybox` was July 2024.  It is a bit surprise to me, since
most of my hobby programming time was spent on it for many years.  I might
became a boring man, or just became busy for other projects.  Hopefully I will
revisit it next year.

The number of changes to `hkml` is pretty impressive to me.  I made changes for
`hkml` even more than those for `damo`.  I actually made an official support
commitment this year, and looking forward to introduce it to more people in
FOSDEM'25, to promote more DAMON contributors.
