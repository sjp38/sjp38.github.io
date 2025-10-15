---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Creating DAMON logo using DAMON"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "heatmap", "logo", "damo", "linux", "kernel"]
categories: ["damon"]
date: 2024-07-13T13:56:02-07:00
lastmod: 2024-07-13T13:56:02-07:00
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

I just made a DAMON logo using DAMON, like below.

```
$ git clone https://github.com/sjp38/masim && cd masim
$ cat damon_pixel_2
11111111
11    11
 111111

11111111
11 11
11111111

11111111
 1111
11111111

11111111
11    11
11111111

11111111
  1111
11111111
$ ./pixels_to_access_config.py ./damon_pixel_2 $((100*1024*1024)) 300 damon.cfg
$ sudo damo record "./masim ./configs/stairs.cfg"
$ sudo damo report heatmap --output damon.png
```

The output is below:

![DAMON logo](/img/damon_logo.png)

The cropped one:

![Cropped DAMON logo](/img/damon_logo_cropped.png)
