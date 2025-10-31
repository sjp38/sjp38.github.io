+++
title = "Biscuit (OS Written in Go) Install"
date = 2019-05-26T23:27:44+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

```
$ git clone https://go.googlesource.com/go go1.4; cd go1.4
$ git checkout release-branch.go1.4; cd src
$ ./make.bash
$ cd ../../
$ git clone https://github.com/mit-pdos/biscuit.git; cd biscuit/src
$ ./make.bash
$ cd ../biscuit/
$ make qemu CPUS=2
```
