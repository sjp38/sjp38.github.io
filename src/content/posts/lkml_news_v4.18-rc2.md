+++
title = "Lkml_news_v4.18 Rc2"
date = 2018-06-25T08:45:22+09:00
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

Linux 4.18-rc2
--------------

https://lkml.kernel.org/r/alpine.LFD.2.21.999.1806242116240.20621@xps13.linux-foundation.org

이번주도 지난주처럼 평소보단 빠른 릴리즈입니다.  토발즈가 여전히
여행중이라는군요.  지난주엔 일본이었고, 이번주는 중국이라는군요.  그런고로 중국
시간으로 일요일 저녁의 rc 릴리즈입니다.

이번 rc 에서도 큰 변경은 없고 평범한 rc 입니다.


[PATCH tip/core/rcu 0/40] RCU ->gp_seq conversion for v4.19
-----------------------------------------------------------

https://lkml.kernel.org/r/20180626000841.GA15696@linux.vnet.ibm.com

RCU 의 `->gpnum` 과 `->completed` 필드를 하나의 `->gp_seq` 로 대체하는
패치입니다.  그동안 `->gpnum` 과 `->completed` 로 grace period 를 관리해오고
있지만 사실상 `->gpnum` 과 `->completed` 는 수가 똑같거나 하나 차이이니 하나의
bit 으로도 같은 정보를 처리할 수 있을 뿐더러 로드 횟수를 두번에서 한번으로 줄일
수 있다는 거죠.
