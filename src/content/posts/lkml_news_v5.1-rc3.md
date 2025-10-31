+++
title = "LKML News v5.1-rc3"
date = 2019-03-26T08:53:41+09:00
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


[PATCH tip/core/rcu 0/4] Documentation updates for v5.2
-------------------------------------------------------

https://lkml.kernel.org/r/20190326230408.GA17069@linux.ibm.com

v5.2 에 머지될 목적의 RCU 문서화 업데이트 패치셋입니다.


[PATCH tip/core/rcu 0/18] Miscellaneous fixes for v5.2
------------------------------------------------------

https://lkml.kernel.org/r/20190326231253.GA18343@linux.ibm.com

v5.2 를 위한 RCU 의 다양한 업데이트 패치셋입니다.  rcu 를 위한 메일링 리스트도
추가되었군요.  rcu@vger.kernel.org 입니다.


[PATCH tip/core/rcu 0/9] Torture-test updates for v5.2
------------------------------------------------------

https://lkml.kernel.org/r/20190326233054.GA21523@linux.ibm.com

v5.2 를 위한 torture test 의 업데이트 패치셋입니다.  LKMM 이라던지 formal
verification 도 많은 발전이 있었지만, torture test 도 없어질 순 없겠죠.


Linux 5.1-rc3
-------------

https://lkml.kernel.org/r/CAHk-=wiHmEqxBvp3dfTqOut+NHzbNaip=BrnBO48SCTfnApLRg@mail.gmail.com

한국시간으로 만우절 아침, 5.1 을 위한 세번째 rc 버전이 릴리즈 되었습니다.  이번
릴리즈는 다른 rc3 들에 비해 조금 많은 변화가 있었기에 좋은 현상은 아니지만
그렇다 해도 아직 rc3 정도니까 큰 문제는 아닐 거라 하는군요.  전체적으로 코드가
추가된 것보다 제거된 게 많은 것 같습니다.
어쨌건 앞으로는 점점 변경양이 줄었으면 좋겠다는군요.
