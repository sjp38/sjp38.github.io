---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My opensource commits statistics in 2023"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source", "commits", "github", "statistics"]
categories: ["statistics"]
date: Sun Dec 31 12:57:52 PST 2023
lastmod: Sun Dec 31 12:57:52 PST 2023
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

As today is the last day of 2023, I checked some open source commits statistics
using my simple and buggy
[script](https://github.com/sjp38/lazybox/blob/master/git_helpers/authors.py),
and github.  Similar statistics for 2022 is available at another [post]({{< ref
"my_opensource_commits_stat_2022.md" >}}).

In short, I made 8th and 4th biggest changes to Linux kernel memory management
subsystem among the 295 people, for lines of changes (1,910) and commits (66).

For the Linux kernel whole tree, the numbers become 264th (3,562 lines) and
80th (147 commits) among 5,006 people.

Linux kernel statistics
-----------------------

I ran my buggy script[1] to show some 2023 statistics for memory management
subsystem and whole tree of Linux kernel as below.

```
$ date
Sun Dec 31 01:26:17 PM PST 2023
$ ./authors.py ~/linux --commits linus/master --file mm/ \
>         --since 2023-01-01 --skip_merge_commits \
>         --sortby lines --max_nr_authors 9
1. Mike Rapoport (IBM) <rppt@kernel.org>: 5686 lines
2. Hugh Dickins <hughd@google.com>: 3938 lines
3. Qi Zheng <zhengqi.arch@bytedance.com>: 2775 lines
4. Kefeng Wang <wangkefeng.wang@huawei.com>: 2382 lines
5. Matthew Wilcox (Oracle) <willy@infradead.org>: 2278 lines
6. Huang Ying <ying.huang@intel.com>: 2149 lines
7. Liam R. Howlett <Liam.Howlett@Oracle.com>: 1995 lines
8. SeongJae Park <sj@kernel.org>: 1910 lines
9. Lorenzo Stoakes <lstoakes@gmail.com>: 1779 lines
# 272 authors, 57035 lines in total
$
$ ./authors.py ~/linux --commits linus/master --file mm/ \
>         --since 2023-01-01 --skip_merge_commits \
>         --sortby commits --max_nr_authors 5
1. Matthew Wilcox (Oracle) <willy@infradead.org>: 111 commits
2. Hugh Dickins <hughd@google.com>: 77 commits
3. Kefeng Wang <wangkefeng.wang@huawei.com>: 71 commits
4. SeongJae Park <sj@kernel.org>: 66 commits
5. Lorenzo Stoakes <lstoakes@gmail.com>: 41 commits
# 272 authors, 1690 commits in total
$
$ ./authors.py ~/linux --commits linus/master \
>         --since 2023-01-01 --skip_merge_commits \
>         --sortby lines --max_nr_authors 7000 > 2023_by_lines
$ tail -n 1 2023_by_lines
# 5006 authors, 5253379 lines in total
$ grep -A1 -B1 sj@kernel.org 2023_by_lines
263. Claudiu Beznea <claudiu.beznea@microchip.com>: 3581 lines
264. SeongJae Park <sj@kernel.org>: 3562 lines
265. Thomas Weißschuh <linux@weissschuh.net>: 3558 lines
$
$ ./authors.py ~/linux --commits linus/master \
>         --since 2023-01-01 --skip_merge_commits \
>         --sortby commits --max_nr_authors 7000 > 2023_by_commits
$ tail -n 1 2023_by_commits
# 5006 authors, 74198 commits in total
$ grep -A1 -B1 sj@kernel.org 2023_by_commits
79. Pavel Begunkov <asml.silence@gmail.com>: 150 commits
80. SeongJae Park <sj@kernel.org>: 147 commits
81. Andrii Nakryiko <andrii@kernel.org>: 146 commits
```

### Memory Management

In 2023, 272 people participated in Linux kernel memory management subsystem
development by making 57,035 lines of changes with 1,690 commits.

I made 8th and 4th biggest changes among the 295 people, for lines of changes
(1,910) and commits (66).  Note that I counted only files under `mm/`
directory of the source tree, though.

Distribution of the numbers can be plotted like below.
```
$ ./authors.py ~/linux --commits linus/master --file mm/ --since 2023-01-01 \
        --skip_merge_commits --sortby lines --max_nr_authors 300 \
	--pr_for_plot | ../gnuplot/plot.py --ylog --pointsize 0.2 output.png
```

The plot for the distribution of the number of changed lines per author for
memory management subsystem in 2023 is like below.  Note that y-axis is in
logscale.  My number on the graph is 1,910.

![number of changed lines per author for mm in 2023](/img/2023_open_source_commits_stat/2023_changed_lines_per_author_mm.png)

The plot for the distribution of the number of commits per author for memory
management subsystem in 2023 is like below.  Note that both x-axis and y-axis
are in logscale.  My number on the graph is 66.

![number of commits per author for mm in 2023](/img/2023_open_source_commits_stat/2023_commits_per_author_mm.png)


### Linux kernel Whole Tree

In 2023, 5,006 people participated in Linux kernel development by making
5,253,379 lines of changes with 74,198 commits.

I made 264th and 80th biggest changes among the 5,006 people, for lines of
changes (3,562) and commits (147).

The plot for the distribution of the number of changed lines per author for the
whole Linux kernel source tree in 2023 is like below.  Note that both x-axis
and y-axis are in logscale.  My number on this graph is 3,562.

![number of changed lines per author for linux in 2023](/img/2023_open_source_commits_stat/2023_changed_lines_per_author_linux.png)

The plot for the distribution of the number of commits per author for the whole
Linux kernel source treein 2023 is like below.  Note that both x-axis and
y-axis is in logscale.  My number on this graph is 147.

![number of commits per author for linux in 2023](/img/2023_open_source_commits_stat/2023_commits_per_author_linux.png)


Github
------

On github, I made 3,264 commits in 2023.  It's counting only the commits that I
made with my github main account's email address, so it doesn't cover some of
my commits for some projects including Linux kernel.  I made commits everyday
except three days in 2023.

![github contributions in 3d](/img/2023_open_source_commits_stat/github_sj38_park_3d.png)
![github contributions in 2d](/img/2022_open_source_commits_stat/github_sj38_park_2d.png)

Apparently 2023 was a busy year for me and the world.  Hope I and the community
to continue happy hacking in 2023.
