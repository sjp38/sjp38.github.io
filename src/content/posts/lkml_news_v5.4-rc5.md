+++
title = "LKML News v5.4-rc5"
date = 2019-10-27T12:48:30+01:00
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

`[PATCH 00/12] mm: remove __ARCH_HAS_4LEVEL_HACK`
-------------------------------------------------

https://lkml.kernel.org/r/1571822941-29776-1-git-send-email-rppt@kernel.org

서로 다른 아키텍쳐 간의 페이지 테이블 구조로 인해 사용해야 했던
`__ARCH_HAS_4LEVEL_HACK` 을 제거하는 패치입니다.  Alpha, arm, c6x 등의
아키텍쳐가 변경되는군요.
UML, qemu 등에서 부팅 테스트를 거쳤군요.


Linux 5.4-rc5
-------------

https://lkml.kernel.org/r/CAHk-=wgpewLxHxnO71tFHh=M4C4iUofJykMqq3r=eRyxUyVsiw@mail.gmail.com

다섯번째 rc 버전 릴리즈입니다.
하지만 안타깝게도 이번 릴리즈는 마냥 조용하진 않았다는군요.
최근의 다른 rc5 들에 비하면 조금 큰 크기의 릴리즈가 되었습니다.
그렇다곤 해도 아주 특이할 만한 정도는 아니라 토발즈도 큰 걱정은 없다는군요.
