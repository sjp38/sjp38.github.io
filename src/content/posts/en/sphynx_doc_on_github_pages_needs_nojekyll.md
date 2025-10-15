---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Sphynx document on Github pages Needs `.nojekyll` File"
subtitle: ""
summary: ""
authors: []
tags: ["tip", "github", "sphynx"]
categories: []
date: 2020-05-13T06:40:03+02:00
lastmod: 2020-05-13T06:40:03+02:00
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

I recently tried to upload the Linux kernel document which is generated in html
form using the Sphynx build system[1] on a Github page[2] so that people can
read DAMON[3] document from everywhere.  The upload was very easy.  I simply
created the repo, put the generated html doc at ``Documentation/output/`` into
the repo and pushed.  However, the theme was not applied.

Github assumes every Github pages to be based on Jekyll[4], and because every
files and directories starting with underscores are handled special in Jekyll,
some directories Sphynx created were ignored.

You can simply let Github pages to know your site is not generated with Jekyll
by putting `.nojekyll` file with no content on your root of the repo and push.
For example,

```
$ cd <your github page repo>
$ touch .nojekyll
$ git add .nojekyll; git commit -m "Add .nojekyll"; git push
```

Note that the file should be located in the root of the repo, not somewhere
else.

After this fix, my document[5] also works :)



[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#sphinx-build  
[2] https://pages.github.com/  
[3] https://sjp38.github.io/post/damon/  
[4] https://jekyllrb.com/  
[5] https://damonitor.github.io/doc/html/latest/admin-guide/mm/data_access_monitor.html
