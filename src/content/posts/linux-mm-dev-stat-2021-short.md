---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Linux Memory Management Subsystem Development Statistics in 2021 (Short)"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "mm", "statistics"]
categories: ["linux dev statistics"]
date: 2021-12-31T07:52:00+01:00
lastmod: 2021-12-31T07:52:00+01:00
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

Whenever reading the kernel development statistics
[report](https://lwn.net/Articles/874283/) for each release from LWN, I wanted
to scope it down to specific subsystems.  For that, I wrote a
[script](https://github.com/sjp38/lazybox/blob/master/scripts/git_stats/authors.py).

Belows are the top 10 kernel hackers who contributed to the memory management
subsystem of Linux kernel, sorted by number of commits and changed (added,
deleted, or modified) lines, respectively.

```
$ ./authors.py ~/linux --file mm/ --since 2021-01-01 --author_identity name --sortby lines --max_nr_authors 10
1. SeongJae Park: 4860 lines
2. Matthew Wilcox (Oracle): 4391 lines
3. Muchun Song: 2091 lines
4. Mel Gorman: 1737 lines
5. Yang Shi: 1615 lines
6. Marco Elver: 1442 lines
7. Mike Kravetz: 1419 lines
8. Alexander Potapenko: 1383 lines
9. Miaohe Lin: 1256 lines
10. Vlastimil Babka: 1245 lines
# 262 authors, 45700 lines in total
$ 
$ ./authors.py ~/linux --file mm/ --since 2021-01-01 --author_identity name --sortby commits --max_nr_authors 10
1. Matthew Wilcox (Oracle): 133 commits
2. Miaohe Lin: 125 commits
3. Linus Torvalds: 78 commits
4. Muchun Song: 51 commits
5. Mel Gorman: 46 commits
6. Vlastimil Babka: 44 commits
7. SeongJae Park: 43 commits
8. Hugh Dickins: 41 commits
9. Yang Shi: 38 commits
10. David Hildenbrand: 33 commits
# 265 authors, 1527 commits in total
```
