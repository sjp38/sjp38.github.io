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

Alpha 에만 의존적인 메모리 모델 요소인 `smp_read_barrier_depends()` 는
`READ_ONCE()` 에 내장됨으로써 Alpha-specific 하지 않은 커널 코드에서는 Alpha 를
신경쓰지 않아도 되게 되었죠.  그럼에도 불구하고 이걸 신경쓰는 코드가 올라오는게
신경쓰였나 봅니다.
이 패치셋은 커널 코드의 모든 문서와 주석에서 해당 기능에 대한 설명을 삭제해
버립니다.


[PATCH v4 00/10] Add Kernel Concurrency Sanitizer (KCSAN)
---------------------------------------------------------

https://lkml.kernel.org/r/20191114180303.66955-1-elver@google.com

구글의 동시성 버그를 잡아주는 KCSAN 패치입니다.  이번 버전은 x86 만을 위한
버전이지만 조만간 ARM64 와 POWER 지원을 추가할 예정이라는군요.  이번 네번째
버전은 이전 버전에 비해 성능이 33% 향상되었다고 합니다.


Linux 5.4-rc8
-------------

https://lkml.kernel.org/r/CAHk-=wiyR4Np_n5O6=rbf1GVNdr_zUd1WAC_GJDnc_hUhHqwWg@mail.gmail.com

정식버전이 나올지 rc8 이 나올지 나름 두근두근한 일주일이었는데, 결국 rc8 이
나왔습니다.  하지만 딱히 문제가 있었던 건 아니라는군요.  떠들썩했던 인텔 취약점
패치가 들어온 한주였음에도 매우 조용했다고 합니다.

다다음주는 Thanksgiving 이군요.  이 점을 생각하면 다음주는 5.4 에 대한
수정사항보다는 5.5 머지윈도우를 위한 early pull request 가 오길 바란다고
합니다.
