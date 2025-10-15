---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "LKML News v5.6-rc1"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "lkml", "news"]
categories: ["lkml news"]
date: 2020-01-29T07:11:00+01:00
lastmod: 2020-01-29T07:11:00+01:00
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

[LSF/MM/BPF TOPIC] Memory Tiering discussion
--------------------------------------------

https://lkml.kernel.org/r/CAHbLzkqOKtM684SGnCaa9ObHj082KenoPmRXvxMJ1UjcdvrhMQ@mail.gmail.com

The author, Yang Shi has posted a patchset for tiered memory management last
year, but received no many comments.  Meanwhile, Dave posted another similar
patch.  He wants to discuss about this in LSF/MM this year.


Linux 5.6-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wjVopuAm5Vwa1kK5O1tTzQAGFtCHm8_Hzy3Us1OC=PgUw@mail.gmail.com

After the two weeks, the merge window for 5.6 has finished and therefore the
5.6-rc1 has released.

This merge window was __slightly__ smaller than usual.  Torvalds think this is
the slow effect from the year end holiday season.  That said, there were still
huge changes (more than 10K commits) and the changes are normal.
