+++
title = "LKML News v5.0-rc3"
date = 2019-01-21T09:21:14+09:00
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

LSF/MM 2019: Call for Proposals
-------------------------------

https://lkml.kernel.org/r/51b4b263-a0f2-113d-7bdc-f7960b540929@kernel.dk

올해의 LSF/MM 을 위한 발표 모집입니다.  올해는 푸에르토리코에서 4월 30일부터
5월 2일까지 열리는군요.


[LSF/MM TOPIC] NUMA, memory hierarchy and device memory
-------------------------------------------------------

https://lkml.kernel.org/r/20190118174512.GA3060@redhat.com

LSF/MM 을 위한 발표 지원입니다.
NUMA API 가 다계층 메모리에 적용될 때의 단점에 대해서 이야기 해보겠다는군요.


[PATCH 00/22] Increase success rates and reduce latency of compaction v3
------------------------------------------------------------------------

https://lkml.kernel.org/r/20190118175136.31341-1-mgorman@techsingularity.net

Mel Gorman 의 compaction 개선 패치셋 세번째 버전입니다.


Linux 5.0-rc3
-------------

https://lkml.kernel.org/r/CAHk-=whS=6Z_UxzoMjLANupOk3u-8ycERLPnaZxShMTviW0jkQ@mail.gmail.com

5.0 세번째 릴리즈입니다.  지난 릴리즈에서 여행 중이지만 항상 그렇듯 일요일
릴리즈를 하려 한다고 했는데, 이번에도 성공적이군요.  더불어 어디 여행 중인지도
나왔습니다, LCA 2019 여행 중이었군요.  여담이지만 올해 LCA 도 재밌는 발표가
많은 것 같습니다.

지난 rc2 에서 머지하는 걸 빼먹은 네트워킹 쪽 풀리퀘스트를 이번에 머지했기
때문에 이번 rc3 는 조금 크다는군요.
