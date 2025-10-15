---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My opensource commits statistics in 2022"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source", "commits", "github", "statistics"]
categories: ["statistics"]
date: Sat Dec 31 13:48:12 PST 2022
lastmod: Sat Dec 31 13:48:12 PST 2022
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

As today is the last day of 2022, I checked some open source commits statistics
using my simple and buggy script[1], and github.

Linux kernel statistics
-----------------------

I ran my buggy script[1] to show some 2022 statistics for memory management
subsystem and whole tree of Linux kernel as below.

![script outputs](/img/2022_open_source_commits_stat/linux_kernel_authors.png)


### Memory Management

In 2022, 305 people participated in Linux kernel memory management subsystem
development by making 81,631 lines of changes with 2,135 commits.

I made 2nd and 3rd biggest changes among the 305 people, for lines of changes
(10,537) and commits (106).

### Linux kernel Whole Tree

In 2022, 5,286 people participated in Linux kernel development by making
6,841,739 lines of changes with 77,636 commits.

I made 85th and 89th biggest changes among the 5,286 people, for lines of
changes (11,907) and commits (155).

Github
------

On github, I made 2,316 commits in 2022.  It's counting only the commits that I
made with my github main account's email address, so it doesn't cover some of
my commits for some projects including Linux kernel.  I made commits everyday
except three days in 2022.

![github contributions in 3d](/img/2022_open_source_commits_stat/github_sj38_park_3d.png)
![github contributions in 2d](/img/2022_open_source_commits_stat/github_sj38_park_2d.png)

Apparently 2022 was a busy year for me and the world.  Hope I and the community
to continue happy hacking in 2023.

[1] https://github.com/sjp38/lazybox/blob/master/git_helpers/authors.py

After sharing this to
[Linkedin](https://www.linkedin.com/feed/update/urn:li:activity:7015077088412004353/)
and [Twitter](https://twitter.com/i/timeline),
I got more than 190 Linkedin reactions, 50 Linkedin connection requests, 45
Twitter heart, and 30 Twitter followers within a day.  So impressive.  Thank
you for motivating me!
