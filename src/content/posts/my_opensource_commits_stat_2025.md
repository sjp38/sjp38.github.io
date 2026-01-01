---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My opensource commits statistics in 2025"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source", "commits", "github", "statistics"]
date: Thu, 01 Jan 2026 12:21:28 -0800
categories: ["statistics"]
featured: false
draft: false
---

As today is the first day of 2026, I checked my open source commits statistics
using my simple and buggy
[scripts](https://github.com/sjp38/lazybox/blob/master/git_helpers/).  Similar
statistics for 2024 is available at another [post]({{< ref
"my_opensource_commits_stat_2024.md" >}}).

Note that the script may have bugs, and numbers don't tell everything.

TL; DR
------

In short, I made 2nd and 1st biggest changes to Linux kernel memory management
subsystem among the 321 people, in terms of lines of changes (6,661 / 73,685
lines) and commits (199 / 1,870 commits).

For the Linux kernel whole tree, the numbers become 71-st (11,362 / 4,809,577
lines) and 25th (333 / 75,462 commits) among 5,637 people.

For open source projects other than Linux, I made around 564,210 lines of
changes with around 2,157 commits.

Linux kernel statistics
-----------------------

I mostly work on Linux kernel for fun and profit.  So made the 2025 statistics
for Linux kernel.

### Linux kernel memory management subsystem

Linux is a huge system that constructed with a number of subsystems.  Among the
subsystems, I mostly work on DAMON and memory management subsystems.  DAMON is
also a part of memory management subsystem.  Let's see the statistics for
memory mangement subsystem, first.

I ran my buggy script[1] to show some 2024 statistics for memory management
subsystem and whole tree of Linux kernel as below.

#### In terms of the number of changed lines

In 2025, 321 people made 73,685 lines of changes to Linux kernel memory
management subsystem.  Among the people, I made second biggest lines of
changes (6,661 / 73,685 lines).

```
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby lines --max_nr_authors 9
[...]
2. SeongJae Park <sj@kernel.org>: 6661 lines
[...]
# 321 authors, 73685 lines in total
```

To show the overall numbers distribution and where I am, I ran another
[script](https://github.com/sjp38/lazybox/tree/master/format_data/plot) to plot
the distribution and where I am.

```
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby lines --max_nr_authors 400 \
        --pr_for_plot |
    ../format_data/plot/plot.py 2025_changed_lines_per_author_linux_mm.png \
        --ylog --pointsize 0.3 --gnuplot_arrow 20 8000 2 6667
```

The resuling plot is like below.  The arrow is showing where I am.  Note that
the y axis is in logscale.

![number of changed lines per author for mm in
2025](/img/2025_open_source_commits_stat/2025_changed_lines_per_author_linux_mm.png)

#### In terms of the nuber of commits

In 2025, the 321 people made 1,870 commits to Linux kernel memory management
subsystem.  Among the people, I made the biggest number of commits (199 / 1,870
commits).

```
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby commits --max_nr_authors 9
1. SeongJae Park <sj@kernel.org>: 199 commits
[...]
# 321 authors, 1870 commits in total
```

To show the overall numbers distribution and where I am, I ran another
[script](https://github.com/sjp38/lazybox/tree/master/format_data/plot) to plot
the distribution and where I am.

```
$ ./authors.py ~/linux --commits linus/master \
        --linux_subsystems "MEMORY MANAGEMENT" \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby commits --max_nr_authors 400 \
        --pr_for_plot |
    ../format_data/plot/plot.py 2025_commits_per_author_linux_mm.png \
        --ylog --pointsize 0.3 --gnuplot_arrow 20 8000 2 6667
```

The resuling plot is like below.  The arrow is showing where I am.  Note that
the y axis is in logscale.

![number of commits per author for mm in
2025](/img/2025_open_source_commits_stat/2025_commits_per_author_linux_mm.png)

### Linux kernel whole tree

I'm not working only on memory mangement subsystems.  Also, some DAMON source
files are outside of memory management subsystem.  I therefore made the
statistics for whole Linux tree.

#### In terms of the number of changed lines

In 2025, 5,637 people made 4,089,577 lines of changes to Linux kernel.  Among
the people, I made 71-st biggeest amount of changes (11,362 / 4,809,577 lines).

```
$ ./authors.py ~/linux --commits linus/master \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby lines --max_nr_authors 6000
[...]
71. SeongJae Park <sj@kernel.org>: 11362 lines
[...]
# 5637 authors, 4809577 lines in total
```

To show the overall numbers distribution and where I am, I ran another
[script](https://github.com/sjp38/lazybox/tree/master/format_data/plot) to plot
the distribution and where I am.

```
$ ./authors.py ~/linux --commits linus/master \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby lines --max_nr_authors 6000 \
        --pr_for_plot |
    ../format_data/plot/plot.py 2025_changed_lines_per_author_linux.png \
        --ylog --xlog --pointsize 0.3 --gnuplot_arrow 100 50000 71 11362
```

The resuling plot is like below.  The arrow is showing where I am.  Note that
both x and y axes are in logscale.

![number of changed lines per author for linux in
2025](/img/2025_open_source_commits_stat/2025_changed_lines_per_author_linux.png)

#### In terms of the nuber of commits

In 2025, the 5,637 people made 75,462 commits to Linux kernel.  Among the
people, I made the 25-th biggest number of commits (333 / 5,637 commits).

```
$ ./authors.py ~/linux --commits linus/master \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby commits --max_nr_authors 6000
[...]
25. SeongJae Park <sj@kernel.org>: 333 commits
[...]
# 5637 authors, 75462 commits in total
```

To show the overall numbers distribution and where I am, I ran another
[script](https://github.com/sjp38/lazybox/tree/master/format_data/plot) to plot
the distribution and where I am.

```
$ ./authors.py ~/linux --commits linus/master \
        --since 2025-01-01 --until 2025-12-31 \
        --skip_merge_commits --sortby commits --max_nr_authors 6000 \
        --pr_for_plot |
    ../format_data/plot/plot.py 2025_commits_per_author_linux.png \
        --xlog --ylog --pointsize 0.3 --gnuplot_arrow 40 500 25 333
```

The resuling plot is like below.  The arrow is showing where I am.  Note that
both x and y axes are in logscale.

![number of commits per author for mm in
2025](/img/2025_open_source_commits_stat/2025_commits_per_author_linux.png)

Non-Linux Kernel Contributions
------------------------------

In 2025, I also I spend some of my time on projects other than Linux kernel
including
- DAMON user-space tool ([`damo`](https://github.com/damonitor/damo)),
- an email tool for DAMON and Linux kernel contributors
  ([`hkml`](https://github.com/sjp38/hackermail)),
- my personal scripts toolbox (['lazybox'](https://github.com/sjp38/lazybox)), and

Let's see simple record of my contributions on those.

```
$ ./profile_author.py SeongJae --repo ~/damo --max_files 5 --since 2025-01-01 --until 2025-12-31
# below changes made by
# - SeongJae Park <sj@kernel.org>
# since 2025-01-05 09:37:04 -0800 until 2025-12-29 18:42:38 -0800
# <changed_lines> <file>
516424 tests/report/expects/report-heats
4166 tests/report/expects/report-detailed-inactive
3129 src/damo_report_access.py
1837 tests/report/expects/report-detailed-unmapped
1751 src/damo_report_heatmap.py
# 545688 total lines
# 147 total files
# 1291 commits

$ ./profile_author.py SeongJae --repo ~/hackermail --max_files 5 --since 2025-01-01 --until 2025-12-31
# below changes made by
# - SeongJae Park <sj@kernel.org>
# since 2025-01-02 11:05:19 -0800 until 2025-12-30 20:22:45 -0800
# <changed_lines> <file>
1720 src/hkml_view_mails.py
1132 src/hkml_list.py
923 src/hkml_patch_format.py
732 src/hkml_view_text.py
674 src/hkml_view.py
# 9051 total lines
# 44 total files
# 800 commits

$ ./profile_author.py SeongJae --repo ~/lazybox/ --max_files 5 --since 2025-01-01 --until 2025-12-31
# below changes made by
# - SeongJae Park <sj@kernel.org>
# since 2025-03-01 12:05:12 -0800 until 2025-12-30 22:12:02 -0800
# <changed_lines> <file>
542 scripts/gen_report/ltldat.py
542 format_data/ltldat.py
351 scripts/report/statof.py
212 gnuplot/plot.py
212 format_data/plot/plot.py
# 9471 total lines
# 232 total files
# 66 commits
```

Like other years, I made no small amount of changes for non-Linux projects in
2025.  2,157 commits of 56,4210 lines of change in total, for the three
projects.  As I committed not only for the three projects, the total numbers
may slightly bigger.

Similar to [2024]({{< ref "my_opensource_commits_stat_2024.md" >}}), I spent
most changes on `damo`.  `hkml` has continued to be my another major project.
I also gave a [presentation]({{< ref "lpc_ossjp_2025_talk.md" >}}) of the tool
at Open Source Summit Japan this year.  I still commit on `lazybox`.
Especially, I completed the reorganization of the repo this year.  As a result,
it got the 1st and 2nd biggest changes among the three projects, in terms of
the changed files and lines of code.  Nonetheless, the number of commits for
`lazybox` is much smaller than those for the other two projects.  The project
is somewhat matured now, and hence got not that much changes in 2025.
