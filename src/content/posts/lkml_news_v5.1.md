+++
title = "LKML News v5.1"
date = 2019-04-30T14:16:49+09:00
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

[RFC PATCH v4 00/15] Slab Movable Objects (SMO)
-----------------------------------------------

https://lkml.kernel.org/r/20190430030746.26102-1-tobin@kernel.org

앞서 이 블로그에서도 공유한 SMO 패치의 새 버전입니다.  이번 버전은 dcache 쪽
코드를 많이 수정했군요.


Linux 5.1
---------

https://lkml.kernel.org/r/CAHk-=whsbDxdapMJGvy9OkVSrKMsKRJBTrH-Qj-qTbkMUGnWUw@mail.gmail.com

5.1 릴리즈입니다.  일요일 오후 릴리즈란 점은 평소와 같지만 평소보다 조금 늦은
시간이긴 했는데요, 오늘 갑자기 받은 풀 리퀘스트도 있었고, 이번 머지윈도우
기간에 졸업식에 참석해야 해서 조금 망설였다는군요.

하지만 풀리퀘스트도 그렇게 크진 않고, 몇일 머지윈도우에 자리 비우는 정도는
어떻게든 할 수 있을거라 생각해서 5.1 릴리즈가 이뤄졌습니다!

이제 5.2 머지윈도우의 시작이군요!
