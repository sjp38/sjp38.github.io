+++
title = "LKML News v5.4-rc8"
date = 2019-11-12T20:08:10+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

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

`[PATCH 00/13] Finish off [smp_]read_barrier_depends()`
-------------------------------------------------------

https://lkml.kernel.org/r/20191108170120.22331-1-will@kernel.org

The memory model element which is depends only on Alpha,
`smp_read_barrier_depends()` is built into `READ_ONCE()`, so that you don't
have to worry about Alpha in non-alpha-specific kernel code.
Nevertheless, the author of this patchset concerned about the continuing
uploads of the code that cares it.
This patchset removes the description of the feature from all documentation and
comments in the kernel code.


[PATCH v4 00/10] Add Kernel Concurrency Sanitizer (KCSAN)
---------------------------------------------------------

https://lkml.kernel.org/r/20191114180303.66955-1-elver@google.com

This is the Google's KCSAN patch that catches concurrency bugs. This version is
for x86 only, but will add ARM64 and POWER support soon. This fourth version
has a 33% performance improvement over previous versions.


Linux 5.4-rc8
-------------

https://lkml.kernel.org/r/CAHk-=wiyR4Np_n5O6=rbf1GVNdr_zUd1WAC_GJDnc_hUhHqwWg@mail.gmail.com

It's been a week of thrilling to see if the full version or rc8 will be
available. But it wasn't just a problem. It's been a quiet week, even though
it's been a week since the bustling Intel vulnerability patch.

Next week is Thanksgiving. With that in mind, next week we hope to have an
early pull request for 5.5 merge windows rather than a fix for 5.4.
