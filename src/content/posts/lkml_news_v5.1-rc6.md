+++
title = "LKML News v5.1-rc6"
date = 2019-04-16T23:02:17+09:00
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

[PATCH v12 00/31] Speculative page faults
-----------------------------------------

https://lkml.kernl.org/r/20190416134522.17540-1-ldufour@linux.ibm.com

오랫만에 업데이트 된 SPF 패치셋으로, 이번 패치셋은 v5.1 위로 리베이스
되었습니다.  RCU 에서 Fine-grained reader-writer locking 으로 옮겼던 vma 보호를
다시 RCU 로 되돌린 게 눈에 띄는군요.  기존엔 패치셋만 공개했는데, 이젠 패치셋이
적용된 코드 트리를 github 으로도 제공합니다:
https://github.com/ldu4/linux/tree/spf-v12


[PATCH v3 00/11] Provide generic top-down mmap layout functions
---------------------------------------------------------------

https://lkml.kernel.org/r/20190417052247.17809-1-alex@ghiti.fr

아키텍쳐별로 별도 구현을 하지 않고도 전체 mmap 레이아웃을 접근할 수 있게 해주는
범용 함수들을 구현하는 패치셋입니다.


Linux v5.1-rc6
--------------

https://lkml.kernel.org/r/CAHk-=wii=Ym24FWf7J2s1CEwCXU3hjVXeHSkV3A8X5iAj6eT8Q@mail.gmail.com

부활절이었군요.  어쨌건 토발즈는 그런 사소한 휴일에 릴리즈 일정을 바꾸진
않았습니다.

이번 rc6 는 평소보다 조금 커다란 릴리즈였고, 때문에 토발즈도 다시 한번 꼼꼼히
살펴봤지만 그렇게까지 이상한 일은 아니라는군요.  4.18 때와 5.0 때도
이정도였답니다.

네트워킹 쪽 변경이 좀 컸고, 드라이버, arch, selftests 와 perf 쪽에 변경이
있었으며, core mm, filesystem, scheduler, tracing 쪽에도 변경이 조금씩 있었다고
하는군요.

어쨌건 그다지 이상한 건 없다고 합니다.  적어도 아직까진 5.1 을 향한 여정엔
문제가 없어 보이네요!
