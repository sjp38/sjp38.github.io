---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Summary of DAMON Development in 2022"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "damon", "mm", "statistics", "2022"]
categories: ["damon"]
date: 2022-12-29T19:35:00-08:00
lastmod: 2022-12-29T19:35:00-08:00
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

A summary of DAMON development in 2022 has posted:
https://lore.kernel.org/damon/20221229171209.162356-1-sj@kernel.org/

2022 was a year of active and healthy DAMON development.

Seven new DAMON major features were delivered to users. Some of those were
featured in articles and academic papers.

It was possible thanks to the DAMON community. The community has expanded with
its own mailing list and an open bi-weekly chat series. 40 people contributed
their great code to DAMON via making their 275 commits merged into the
mainline. About 33% of the commits were made by Amazon-external contributors.

The amount of DAMON changes in 2022 (v5.15..v6.2-rc1) was not that tiny
compared to other subsystems. About 0.2% of the commits for whole Linux tree
was for DAMON. Among the changes for DAMON's parent subsystem, mm, about 8% of
commits and 14% of lines of changes were made for DAMON.
