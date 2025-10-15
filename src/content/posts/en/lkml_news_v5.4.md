+++
title = "LKML News v5.4"
date = 2019-11-19T23:13:19+01:00
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

[PATCH RFC v3 00/36] Add KernelMemorySanitizer infrastructure
-------------------------------------------------------------

https://lkml.kernel.org/r/20191122112621.204798-1-glider@google.com

Google's third KMSAN RFC patchset that detects errors caused by accessing
uninitialized memory areas. Like other SAN series, it has been used in Google
syzkaller and found over 200 bugs in the last two years.


LSF/MM/BPF: 2020: Call for Proposals
------------------------------------

https://lkml.kernel.org/r/20191122172502.vffyfxlqejthjib6@macbook-pro-91.dhcp.thefacebook.com

LSF/MM's CFP for the next year was released.  From next year, BPF sessions
will be added to LSF/MM, so the name has changed to LSF/MM/BPF. I can
feel the phase of BPF again!


Linux 5.4
---------

https://lkml.kernel.org/r/CAHk-=wjmzaD=BZ1hjUYu+RTnSGDLfCRwCdg99GeQpCjEwo9uzw@mail.gmail.com

At the end of the eight rc releases, the 5.4 official version is finally
released.  Fortunately, the past week was really calm.  Most of the pull
requests for 5.5 came early for Thanksgiving, and some updates to networking
and GPUs.

In this way 5.5 merge window is open, but I'm a little worried that there's
Thanksgiving in the merge window, but Torvalds believes it won't be a big deal,
and it might be a little slow to take care of the children.
