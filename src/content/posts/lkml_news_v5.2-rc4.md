+++
title = "LKML News v5.2-rc4"
date = 2019-06-04T10:49:00+09:00
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

[PATCH 00/15] Slab Movable Objects (SMO)
----------------------------------------

https://lkml.kernel.org/r/20190603042637.2018-1-tobin@kernel.org

전에도 RFC 패치셋은 여기서도 소개했었죠.  Slab 할당자에 할당받은 객체들의
이동이 가능하게끔 하는 패치셋의 정식 패치 버전이 나왔습니다.  변경된
인터페이스는 XArray 와 dcache 에 적용되는군요.


[PATCH v1 0/4] Introduce MADV_COLD and MADV_PAGEOUT
---------------------------------------------------

https://lkml.kernel.org/r/20190603053655.127730-1-minchan@kernel.org

바로 지난주에도 소개한 external madvise 패치셋이 쪼개졌네요.  `MADV_COLD` 와
`MADV_PAGEOUT` 두개의 새로운 advice 기능 추가 버전만 담은 패치셋입니다.  이게
더 일찍 머지될 가능성이 생겼군요.


Linux 5.2-rc4
-------------

https://lkml.kernel.org/r/CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com

메일을 받고 깜짝 놀랐습니다, 평소보다 빨랐기 때문이죠.  아시아를 여행중인가?
싶기도 했는데요, 그건 아니고 비행기 여행이 예정되어 있기 때문에 평소보다 일찍
했다는군요.

지난 rc3 가 좀 작았던 탓인지 이번 rc4 는 덩치가 좀 큽니다.  하지만 그걸
감안하면 별 문제 없어 보인다고 하네요.

이번 릴리즈에도 SPDX 변경이 많습니다.  변경 자체야 문제가 없긴 한데 diff 를
보기 귀찮게 하는게 조금은 짜증도 나는 것 같네요.

어쨌든 이렇게 네번째 rc 가 릴리즈 되었습니다.  정식 버전도 많이 남지 않았네요!

이번 릴리즈의 개발 과정을 시각화 한 비디오를 아래 URL 에서 볼 수 있습니다:
https://youtu.be/OooOmr4Z8dw
