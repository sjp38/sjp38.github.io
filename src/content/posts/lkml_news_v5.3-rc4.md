+++
title = "LKML News v5.3-rc4"
date = 2019-08-12T01:40:13+09:00
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

[RFC PATCH v6 00/92] VM introspection
-------------------------------------

https://lkml.kernel.org/r/20190809160047.8319-1-alazar@bitdefender.com

호스트 또는 별도 VM 에서 돌아가는 어플리케이션이 다른 VM들을 제어하거나 상태를
알아보거나 shadow 페이지 테이블을 조정하거나 특정 이벤트 발생시 알림을 받거나
할 수 있게 해주는 KVM introspection 서브시스템을 제안하는 패치입니다.  무려
92개짜리의 거대한 패치군요.


[PATCH v4 1/5] `mm/page_idle`: Add per-pid idle page tracking using virtual indexing
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20190805170451.26009-1-joel@joelfernandes.org

페이지 액세스 여부를 알아볼 수 있는 `page_idle` 기능을 프로세스별로 트래킹 하기
편하게 만들어 주는 패치의 네번째 버전입니다.  저자는 구글 직원으로,
안드로이드의 heap profiler 가 이 기능을 쓰나봅니다.  이전 버전과의 차이는...
Swap pte 처리가 추가되었군요.

다섯번째 버전도 바로 올라왔습니다만, 큰 차이는 없어 보이는군요:
https://lkml.kernel.org/r/20190807171559.182301-1-joel@joelfernandes.org


Linux 5.3-rc4
-------------

https://lkml.kernel.org/r/CAHk-=whWJ7Dv9yZBZpxWd1zcAMwokjt7c8YOp-FOf1PXDKGrmQ@mail.gmail.com

세번째 rc 는 어째선지 작은 크기였다 말했었죠, 그냥 pull request 들이 천천히
왔기 때문이 맞는 것 같다고 합니다.  이번 rc 릴리즈는 평소 크기에 rc3 에
안들어간 내용이 들어간 만큼 크다고 합니다.
덕분에 최근 2년 사이의 rc4 중 가장 크다고 하네요.
rc3 에 안들어갔다가 rc4 에 뒤늦게 들어온 변경사항은 대부분 network 쪽
코드라는군요.

이번 변경 중 개인적으로 눈에 띄는건 `switch-case` 구문의 fall-through 코멘트
업데이트입니다.
LWN 에도 관련 글이 올라왔으니 한번 읽어보는 것도 좋을 겁니다:
https://lwn.net/Articles/794944/

이번 rc 릴리즈 개발 과정 시각화 동영상을 아래 링크에서 보실 수 있습니다:
https://youtu.be/EB3i8iBuuHM
