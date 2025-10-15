+++
title = "LKML News after v4.19-rc7"
date = 2018-10-08T07:54:09+09:00
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

Linux 4.19-rc7
--------------

https://lkml.kernel.org/r/20181007154529.GA4493@kroah.com

토발즈 없이 진행되는 4.19를 위한 일곱번째 rc 릴리즈입니다.  이번에도 그렉이
대신 하는군요.  이번 릴리즈는 후반부임에도 rc6 보다 조금 더 커졌습니다.  하지만
그렇게까지 큰 차이는 아니라고 하는군요.

일반적이라면 다음 릴리즈가 4.19 정식 릴리즈일텐데, 10월에 컨퍼런스가 많이
있다보니 rc 릴리즈를 한번 더 할 생각이라는군요.  간만에 rc8 을 보겠습니다.


[PATCH -V6 00/21] swap: Swapout/swapin THP in one piece
-------------------------------------------------------

https://lkml.kernel.org/r/20181010071924.18767-1-ying.huang@intel.com

THP 를 한방에 swap out / swap in 하는 Huang Ying 의 패치, 여섯번째 버전입니다.
기존 버전 대비 달라진 점은 크지 않군요.  좀 더 최신 mmotm/master 위로 rebase 한
정도입니다.
