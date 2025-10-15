+++
title = "Lkml_news_v4.18 Rc5"
date = 2018-07-16T06:07:33+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

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

Linux 4.18-rc5
--------------

https://lkml.kernel.org/r/CA+55aFwfMr2D2A_yesUyt_Lo3XMRk9epzgeBMt2HxMHiXMDYcg@mail.gmail.com

다섯번째 rc 릴리즈입니다.  토발즈 개인적으로는 조금 바쁘단 느낌이 있었지만
숫자로 보면 평범한 rc 릴리즈 주간이었다는 평입니다.

토발즈를 귀찮게 만들었던 건 VM 쪽 버그로, 단 두줄의 수정으로 고쳐졌다는데,
아무래도 아래 패치인 것 같군요:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bce73e4842390f7b7309c8e253e139db71288ac3

그리고 repeatable sequence 에 대한 cleanup 도 있었군요.


[GIT PULL rcu/next] RCU commits for 4.19
----------------------------------------

https://lkml.kernel.org/r/20180716175125.GA4287@linux.vnet.ibm.com

4.19 리눅스 릴리즈를 위한 RCU 쪽 변경사항들 pull request 입니다.
