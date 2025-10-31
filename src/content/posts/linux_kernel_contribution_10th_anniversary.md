---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My 10th anniversary of the Linux kernel contribution"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source"]
categories: ["record"]
date: 2022-10-16T09:09:55-07:00
lastmod: 2022-10-16T09:09:55-07:00
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

Today is the 10th anniversary of my Linux kernel contribution. Including the
tiny and trivial patch, I made 381 patches merged in the mainline during the 10
years.


```
$ git log --author SeongJae --reverse
commit cf174b0ef52ad8184779e1da4132e2d9d17247e5
Author: SeongJae Park <sj38.park@gmail.com>
Date:   Tue Oct 16 16:47:50 2012 +0900

    staging: csr: csr_framework_ext_types.h: fix coding style

    Fix coding style of csr_framework_ext_types.h
        
    Signed-off-by: SeongJae Park <sj38.park@gmail.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[...]
$ git log --author SeongJae --oneline | wc -l
381
```

I'm looking forward to the next 10 years.
