---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "나의 리눅스 커널 컨트리뷰션 10주년"
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

오늘은 제가 리눅스 커널에 처음 기여를 한지 10년이 되는 날입니다.  그 작고
사소했던 패치를 포함해, 지난 10년간 총 381개의 패치를 메인라인에 기여했네요.

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

다음 10년을 기대합니다.
