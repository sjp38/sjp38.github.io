+++
title = "LKML News after v4.16-rc4"
date = 2018-03-05T10:50:48+09:00
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

Linux 4.16-rc4
--------------

https://lkml.kernel.org/r/CA+55aFxXg8hi+T_DNCG_OrAotqSheyREw-Njf9XgUD1vXqAyHQ@mail.gmail.com

벌써 개발 단계의 중반이라 할 수 있는 rc4 의 릴리즈입니다.  4.16 버전의 릴리즈도
얼마 남지 않았군요.  여전히 충분히 조용한 한주였습니다.  다만 여기저기에 조금씩
변경사항이 골고루 있군요.


[PATCH 00/34 v3] PTI support for x32
------------------------------------

https://lkml.kernel.org/r/1520245563-8444-1-git-send-email-joro@8bytes.org

x86-32 를 위한 Page Table Isolation 패치입니다.
