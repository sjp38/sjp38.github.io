+++
title = "LKML News v5.2-rc6"
date = 2019-06-17T19:22:48+09:00
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

[PATCH NOTFORMERGE 0/5] Extend remote madvise API to KSM hints
--------------------------------------------------------------

https://lkml.kernel.org/r/20190616085835.953-1-oleksandr@redhat.com

이 블로그에서도 여러번 소개한 remote `madvise()` 에 대한 관심이 많이 있는 것
같네요.
이 패치셋은 `MADV_MERGEABLE`, `MADV_UNMERGEABLE` 을 추가해서 KSM 힌트도
`madvise()` 를 통해 줄 수 있게 합니다.

논의를 위한 패치라 이대로 머지되진 않겠지만, 사용처가 많이 늘어날 것 같네요.


Linux 5.2-rc6
-------------

https://lkml.kernel.org/r/CAHk-=wg+nPKhdn=vKSgJQkfOSGhauTO4jyt=0FH9cnM_QChDLw@mail.gmail.com

안타깝게도 기대와 달리 이번 릴리즈는 조용하지 않았습니다.  이번 5.2 개발을
위한 릴리즈 중 머지 윈도우와 rc1 을 제외하면 rc6 가 오히려 가장 많은 변화를
담고 있다는군요.  TCP SACK/fragmentation/mss 수정이 영향을 끼친 것들 중
하나라고 합니다.

또, 이번에도 릴리즈가 빨라진 건 내일 토발즈가 비행기 타기 때문이랍니다.
컨퍼런스도 참여해야하고 휴양도 취하는 모양입니다.  이 때문에 rc7 은 조금 늦어질
수 있다는군요.  보통은 rc6 가 가장 안정화 되었을 무렵이라 이렇게 일정을
잡았다고 합니다만, 일이 복잡해졌네요.  자신에게 무슨 일이 있으면 Greg 이 대신할
거라고 합니다.

뭐, 그렇다곤 해도 5.2 릴리즈 진행은 예정대로 진행될 것 같다고도 합니다.  이번
릴리즈의 주요 변경은 SPDX 제외하면 네트워킹, 셀프테스트 그리고 문서화였군요.
