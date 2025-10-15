+++
title = "LKML News after 4.17-rc7"
date = 2018-05-28T10:41:50+09:00
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

Linux 4.17-rc7
--------------

https://lkml.kernel.org/r/CA+55aFwUqz9z1Rf4Wwr29W7DeKxQ67qKEW5xty+JPyCY3aNQ=A@mail.gmail.com

일곱번째 rc 입니다.  지난 몇주보다는 조금 변경사항이 있었지만 그렇다 해도
그렇게 심한 정도는 아니었기에 아마도 이게 마지막 rc 일 거라는군요.


[PATCH 00/13] Introdue io.latency io controller for cgroups
-----------------------------------------------------------

https://lkml.kernel.org/r/20180529211724.4531-1-josef@toxicpanda.com

Cgroup 에 응답시간 (latency) 기반의 I/O 컨트롤러를 추가하는 패치셋입니다.
Cgroup 은 용량 기반의 컨트롤러는 많지만 응답시간 기반의 컨트롤러가 부족하다고
느껴왔는데, 역시 추가되어 가는군요.
