---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Hackermail v1 is released"
subtitle: ""
summary: ""
authors: ["hackermail", "projects", "release", "mailing list", "lkml"]
tags: ["projects"]
categories: []
date: 2024-02-17T10:40:58-08:00
lastmod: 2024-02-17T10:40:58-08:00
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

I started subscribing linux kernel mailing list with my gmail account in 2013.
Dealing with the large amount of mails was not that easy, probably due to my
poor setup and being lazy at trying more tools.

In 2019, while returning from Linux Plumbers Conference, I read an LWN
[article](https://lwn.net/Articles/799134/) saying Linus Torvalds is now
considering unsubscribing the linux kernel mailing list, owing to the
evolvement of the public-inbox and lore.kernel.org.

lore.kernel.org was so nice but I wanted some more personalized mails
management setup, and wanted to avoid the dependency on the web browser and the
internet.  I hence further looked into the internal of public-inbox a bit.  The
git-based mails management structure of public-inbox made me believe maybe I
could hack my own mail client using it.  I hence started the
[hackermail](https://github.com/sjp38/hackermail) project.
 After about a few weeks of the hack, I replaced some parts of my mail workflow
with the new tool, namely `hkml`, and it became much better than before.  It
looked like there were many more things that I could improve with it, but
because it was already enough for my personal workflow, I stopped working on
the project for a while.  I only fixed some bugs and implemented features as
required for myself.

After I started using hackermail, I met a few kernel hackers who reached out to
me asking how I manage mails.  They were also finding a better way for the
kernel mails management.  I introduced them hackermail and my workflow.
Because it was optimized for only my personal workflow, my answer was not that
helpful for them.  They gave me many helpful advice, though.  I added some
TODO items for them but didn't prioritize and work for those.

A few months ago, I learned that too many gmail accounts subscribing linux
kernel mailing list can be a
[problem](https://lore.kernel.org/ksummit/20231106-venomous-raccoon-of-wealth-acc57c@nitro/).
I personally want every discussion to Cc linux-kernel@, but don't want to make
kernel.org have the problem.  Hence I unsubscribed the mailing lists and
[decided](https://social.kernel.org/notice/AcuiYjPsv2iaUqRshM) to improve
`hkml` to a level that I can migrate all my workflow on it.  I also wanted it
to be good enough for not only my workflow but also for general.  At least the
old TODO items should be removed.

So I hacked on it in personal time again.  After a few months of such a hack,
now I feel I made all the features I wanted to have.  The old todo items are
now removed.  Some of the items were added for not myself but others, but some
of those turned out to be very helpful for me, too.  Now I think my workflow
itself is much more improved.

Due to my tiny source of ideas rather than the quality of the tool, now I show
not many TODO items.  Hence, I
[tagged](https://github.com/sjp38/hackermail/tree/v1.0.0) the current version
of the tool as v1.0.0.  I hope it answers the questions on my mail management
workflow, better than those of the past.
