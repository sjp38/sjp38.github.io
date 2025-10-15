+++
title = "LKML News v5.4-rc4"
date = 2019-10-16T20:29:00+02:00
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

[PATCH 0/8] Add Kernel Concurrency Sanitizer (KCSAN)
----------------------------------------------------

https://lkml.kernel.org/r/20191016083959.186860-1-elver@google.com

구글에서 만든 동시성 버그 탐색기능, KCSAN 을 추가하는 패치셋입니다.
처음 세상에 모습을 드러낸건 9월이었고, 최근 컨퍼런스들에서도 발표가 있었죠.
메커니즘은 간단하다면 간단한, 샘플링 기반입니다.
구글 내부 fuzzing tester 인 syzkaller 는 이미 이 기능을 켠채 돌아간다는군요.


[PATCH 2/2] mm, zswap: Support THP
----------------------------------

https://lkml.kernel.org/r/1571111349-5041-2-git-send-email-teawater@gmail.com

Zswap 이THP 를 지원하도록 수정하는 패치입니다.  그냥 `zswap_frontswap_store()`
함수가 THP 페이지를 연속적인 4 KiB 페이지로 인식하고 처리하게끔 했군요.


[PATCH RFC v1 00/26] Add KernelMemorySanitizer infrastructure
-------------------------------------------------------------

https://lkml.kernel.org/r/20191018094304.37056-1-glider@google.com

구글에서 만든 또다른 sanitizer, KMSAN 입니다.  자매품으로 address sanitizer
등이 있고, 앞서 소개한 concurrency sanitizer 도 있죠.  KMSAN 은 초기화 안된
메모리에의 접근 문제를 찾아내는 Sanitizer 입니다.
Syzkaller 에 적용되어 지난 2년간 무려 200개가 넘는 문제를 발견했다고 합니다.

이 패치셋은 KMSAN 을 적용한 커널을 QEMU 에서 부팅시킬 수 있게 해줍니다.
알려진 false positive 는 없지만 실제로 적용해보면 있을수도 있다고 하는군요.


Linux 5.4-rc4
-------------

https://lkml.kernel.org/r/CAHk-=wh3jhffc0u7s5n=-zUFpztuh+0Hfth4vwuyfc5SpBmvSA@mail.gmail.com

네번째 rc 버전 릴리즈입니다.  딱히 특별한 일 없이 평범한 릴리즈라고
자평하는군요.  토발즈는 이번주에 OSSummit Europe 참가를 위해 프랑스로 가는
모양입니다.  하지만 지금처럼 조용하면 큰일은 없을 것 같다고 하네요.
