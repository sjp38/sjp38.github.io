+++
title = "LKML News after v4.16-rc5"
date = 2018-03-12T10:08:11+09:00
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

Linux 4.16-rc5
--------------

https://lkml.kernel.org/r/CA+55aFxXAMHeD8zz1BLv9r_2rjWJ6xE=cNGVAoWOvQJog7oz9A@mail.gmail.com

여전히 특이사항 없는 한주를 거쳐 다섯번째 rc 버전이 나왔습니다.  이번 릴리즈가
기존의 rc5 단계보단 조금 크지만 특이할 정도는 아닌 모양이군요.  개인적으로 눈에
띈 부분은, overlayfs, xfs 등의 파일시스템의 변경, 그리고 perf 와 selftest 쪽
변경이 있군요.


[PATCH v9 00/24] Speculative page faults
----------------------------------------

https://lkml.kernel.org/r/1520963994-28477-1-git-send-email-ldufour@linux.vnet.ibm.com

Speculative page faults 의 9번째 패치셋입니다.  Michael Hocko 가 이거 너무 자주
올리는 거 아니냐고 한마디 했고, 패치 저자인 Laurent Dufour 도 오케이 했네요.


[PATCH 00/32] docs/vm: convert to ReST format
---------------------------------------------

https://lkml.kernel.org/r/1521660168-14372-1-git-send-email-rppt@linux.vnet.ibm.com

커널 문서의 ReST 화는 많은 사람들이 반기고 있는 변화지만 일부 메인테이너는 썩
반기지 않기도 합니다.  vm/ 쪽 문서를 모두 ReST 로 바꾸는 패치가 올라왔습니다.
