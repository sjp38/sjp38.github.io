---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.5-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2019-12-02T00:28:42+01:00
lastmod: 2019-12-02T00:28:42+01:00
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


`Splitting the mmap_sem`
------------------------

https://lkml.kernel.org/r/20191203222147.GV20752@bombadil.infradead.org

The `mmap_sem` is a big scalability bottleneck and there are several projects
for solving it.  In this mail, Matthew Wilcox suggests his plan for his
solution and asks whether a exceptional case in his solution is acceptable to
other people.


Linux 5.5-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wiEJK=yo9vEhX_4b4ROvCqUA_rjK7g996h-5MbfOMeDrw@mail.gmail.com

Linux 5.5 merge window closed and the -rc1 has released.
It was a tiny bit larger release compared to recent several releases, but
fairly regular overall.
`perf` and `kselftest` was a standout, but Torvalds says it is normal in these
days.

My favorite new feature in 5.5-rc1 is `kunit`.  Now you can do unit test of the
kernel in very fast and convenient way!
