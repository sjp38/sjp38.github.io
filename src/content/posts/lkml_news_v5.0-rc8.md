+++
title = "LKML News v5.0-rc8"
date = 2019-02-19T08:33:37+09:00
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

Linux v5.0-rc7 릴리즈 (2019년 2월 17일) 부터 v5.0-rc8 릴리즈 (2019년 2월 24일)
사이의 기간에 LKML 에 올라온 흥미로운 메일들을 소개합니다.

[LSF/MM ATTEND] MM track: NUMA, THP locality, reclaim
-----------------------------------------------------

https://lkml.kernel.org/r/20190218143203.GW9565@techsingularity.net

Mel Gorman 의 LSF/MM 참여 메일입니다.  NUMA remote THP vs NUMA local non-THP,
NUMA, 메모리 계층 그리고 디바이스 메모리, NUMA rebalancing 과 메모리 reclaim 에
참여하고 싶다고 이야기 하는군요.


``[LSF/MM TOPIC ][LSF/MM ATTEND] Read-only Mapping of Program Text``
--------------------------------------------------------------------

https://lkml.kernel.org/r/379F21DD-006F-4E33-9BD5-F81F9BA75C10@oracle.com

THP 를 활용해 read-only text 를 매핑함으로써 성능을 높이려는 시도를 해오고
있는데, 하나의 base page 를 먼저 읽고 이어서 추가적인 page 를 읽는게 진짜로
사용될지 모르는 readahead 때문에 의논을 해보고 싶다고 하네요.
또, 파일시스템에게 컨텐츠가 큰 청크를 필요로 할지 알려주는 인터페이스가 있으면
좋겠다는군요.


Linux v5.0-rc8
--------------

https://lkml.kernel.org/r/CAHk-=wgtNhecfn_nOi0Yuy7XQSswfozz0CvRMn0WsQhk0YZfyw@mail.gmail.com

rc8 이 나올지 바로 v5.0 이 나올지 궁금했는데, 결국 v5.0 릴리즈는 한주 더
미뤄지게 되었습니다.  rc7 때보다도 많은 패치가 이번 기간에 들어왔다는군요.

그렇다고 아주 특별한 변경이 있었던 건 아니지만 그렇다고 서두를 것도 없으므로
그냥 rc8 을 릴리즈하기로 결정했다고 하네요.

어쨌건 다음주에는 분명 v5.0 이 나오겠죠!
