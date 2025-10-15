+++
title = "Lkml_news_v4.16 Rc3"
date = 2018-02-26T18:38:53+01:00

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

Linux 4.16-rc3
--------------

https://lkml.kernel.org/r/CA+55aFxk5KBxL9DvRtBivP3hKT-aOAzvSA_B47L1+y0P2GLe_A@mail.gmail.com

4.16 세번째 rc 버전이 릴리즈 되었습니다.  rc2 보단 변경사항이 많지만, rc2 때
이야기 했듯 rc2 때는 대부분의 경우 고칠 것들을 찾지도 못했기 때문이 크기
때문이죠.  즉, 스펙터와 멜트다운으로 끔찍했던 4.15 때와 달리, 모든게 정상적이고
예상대로라고 합니다.

대부분의 변경은 드라이버이고, 네트워킹 쪽 변경도 좀 크군요.


[PATCH tip/core/rcu 0/5] SRCU updates
-------------------------------------

https://lkml.kernel.org/r/20180226215614.GA31616@linux.vnet.ibm.com

RCU critical section 안에서 sleep 을 할 수 있는 SRCU 의 간단한 업데이트
패치셋입니다.


[PATCH tip/core/rcu 0/12] Torture-test updates
----------------------------------------------

https://lkml.kernel.org/r/20180226220225.GA32136@linux.vnet.ibm.com

RCU 등의 동기화 도구의 동시성 버그를 찾는데 사용되는 torture test 의 업데이트
패치셋입니다.
