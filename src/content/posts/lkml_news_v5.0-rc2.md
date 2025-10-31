+++
title = "LKML News v5.0-rc2"
date = 2019-01-15T09:06:44+09:00
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

[PATCH v11 00/26] Speculative page faults
-----------------------------------------

https://lkml.kernel.org/r/8b0b2c05-89f8-8002-2dce-fa7004907e78@codeaurora.org

SPF 패치에서 발견된 버그 레포트입니다.  ARM 위에서 데드락 문제가 발견되었군요.
버그 발견자가 패치도 같이 내놓았는데, 이에 대한 토론은 아직도 계속되고 있네요.


[RFC PATCH v7 00/16] Add support for eXclusive Page Frame Ownership
-------------------------------------------------------------------

https://lkml.kernel.org/r/cover.1547153058.git.khalid.aziz@oracle.com

'ret2dir' 보안 공격[1]에 대비하기 위한 패치입니다.  하지만 이로 인해 tlb 를 좀
많이 flush 해야 하는 문제가 있었고, 이 패치셋은 그에 대한 해결책도 의논하고
있습니다.

[1] http://www.cs.columbia.edu/~vpk/papers/ret2dir.sec14.pdf


[PATCH 0/4] Allow persistent memory to be used like normal RAM
--------------------------------------------------------------

https://lkml.kernel.org/r/20190116181859.D1504459@viggo.jf.intel.com

PMEM 을 사용하기 위해선 현재로썬 어플리케이션 코드를 수정해야 합니다.  그냥
평범한, 조금 느린 RAM 처럼 어플리케이션이 기존에 RAM 접근하듯 접근할 수 있게
하면 안될까요?  이 패치셋은 그런 경우를 위한 드라이버를 소개합니다.


[PATCH v2 0/5] psi: pressure stall monitors v2
----------------------------------------------

https://lkml.kernel.org/r/20190110220718.261134-1-surenb@google.com

LWN 에서도 소개된 pressure stall monitor 의 두번째 버전입니다.


Linux 5.0-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wicCXd7nALwEz+022iNesJV3DUmejS+dzVRE0D3UGzs_g@mail.gmail.com

5.x 로 나아가는 두번째 릴리즈 후보가 나왔습니다.  이번 머지 윈도우가 휴일이
섞여 있었기 때문에 두번째 rc 를 위한 과정에 문제가 있지 않을까 싶었지만 별 문제
없었다는군요.  그리고 지금 토발즈는 여행중이라 현지시간으로는 항상 하는 일요일
릴리즈가 아니라 월요일 릴리즈라 합니다만, 뭐... 큰 이슈는 아니죠 ;)
