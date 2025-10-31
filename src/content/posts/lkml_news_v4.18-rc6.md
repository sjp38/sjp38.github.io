+++
title = "LKML News after v4.18-rc6"
date = 2018-07-24T06:19:53+09:00
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

Linux 4.18-rc6
--------------

https://lkml.kernel.org/r/CA+55aFzMheDA-2z=MdGgJrz-REcrknb+4OEvRKaJipm+x6xEhw@mail.gmail.com

이번 rc는 평소보다 조금 크게 되었는데, 네트워킹 쪽 메인테이너인 David 가 많은
수정사항을 아직 보내지 않았다가 이번에 모아서 보냈기 때문이라는군요.  그렇다
해도 그렇게 큰 양까진 아니라는 토발즈의 설명입니다.

지난 rc5 작업 주간을 귀찮게 했던 VM 버그에 대한 두줄의 수정이 rc5 에
들어갔었지만 32비트 환경에 대한 고려가 없었기에 이번에 그 수정이
들어갔다는군요.


[PATCH 0/7] memory management documentation updates
---------------------------------------------------

https://lkml.kernel.org/r/1532517970-16409-1-git-send-email-rppt@linux.vnet.ibm.com

메모리 관리 부분 문서화 업데이트입니다.  sphinx 기반 문서화 업데이트를 일부
메인테이너들은 반기지 않는 것도 사실이지만, 확실히 가독성이 좋아진 덕에 이런
문서화 노력이 더 활발해 지는 것 아닌가 하는 생각도 드는군요.
