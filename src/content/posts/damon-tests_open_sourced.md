---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Tests package for DAMON is released under GPL v2"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm", "tests"]
categories: ["damon"]
date: 2020-09-26T08:47:12+02:00
lastmod: 2020-09-26T08:47:12+02:00
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

DAMON contains a number of tests based on the kselftest and kunit in its
patchset itself.  As it is preferred to contain only tests having short runtime
in kernel tree, I organized time consuming tests in a package and used it in my
company only.  Tests could be used as a good document and essential for
contributors.  For the reason, I promised I will make it open source in the
last kernel summit talk
(https://linuxplumbersconf.org/event/7/contributions/659/).

Yesterday, I finally publicly released the
[package](https://github.com/damonitor/damon-tests) under GPL v2.  Now you can
use the package to understand the DAMON interface and test it on your machine
by yourself.
