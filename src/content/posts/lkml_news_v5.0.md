+++
title = "LKML News v5.0"
date = 2019-02-25T13:16:39+09:00
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

Linux v5.0-rc8 릴리즈 (2019-02-24) 부터 Linux v5.0 릴리즈 (2019-03-03) 사이
기간에 LKML 에 올라온 흥미로운 메일들을 소개합니다.


``[PATCH 0/5] [v5] Allow persistent memory to be used like normal RAM``
-----------------------------------------------------------------------

https://lkml.kernel.org/r/20190225185727.BCBD768C@viggo.jf.intel.com

앞서 몇번 소개했던, persistent memory 를 좀 많이 느린 numa node 인 것처럼 해서
시스템이 사용할 수 있게 하는 접근법의 패치 다섯번째 버전입니다.
이제 개선은 어느정도 된 것 같으니 슬슬 머지되야하지 않겠냐고 주장하는군요.


Linux v5.0
----------

https://lkml.kernel.org/r/CAHk-=wjuG6HiGbD7DCGfvDvhr_1WZUR-eYF2qWGbYyn9k6unvg@mail.gmail.com

마침내 5.0 릴리즈입니다!  제 랩톱에도 바로 받아다가 설치했습니다! ;)  물론 5.0
릴리즈에 특별한 기능 추가라던지 하는건 없고 그저 시간이 꽤 지나서 이렇게
된거라곤 하지만 어쨌든 느낌은 새롭군요.

rc8 릴리즈 후에도 양은 크게 줄었지만 패치가 좀 있었습니다.  그렇게 고쳐진 버그
중 하나로는 uninitialized variable 문제가 있었는데, gcc 가 알아서 초기화를
시켜주다보니 워닝이 안떴었군요.  물론 다른 컴파일러를 사용하면 문제가 생기게
되니 무쓸모한 변경은 아니었다 자평합니다.

어쨌든, 이렇게 v5.0 커널이 정식으로 나왔고, v5.1 을 향한 여정이 시작되었습니다!
