+++
title = "LKML News v5.1-rc1"
date = 2019-03-04T13:07:30+09:00
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

Linux v5.0 릴리즈 (2019-03-03) 부터 v5.1-rc1 릴리즈 (2019-03-17) 사이의 머지
윈도우 기간 LKML 에 올라온 흥미로운 메일들을 소개합니다.


CMA allocation failure
----------------------

https://lkml.kernel.org/r/57e0bc63-0be9-498b-8ffc-3b073e01e299@email.android.com

제게도 GCMA 레이턴시 관련 문의를 보냈던 분인데, LKML 에도 관련 도움을 요청하는
메일을 보냈군요.

왜 CMA 가 할당에 실패하는지 이유를 묻는 메일인데요, 답은 없습니다.


[LSF/MM TOPIC] Using XArray to manage the VMA
---------------------------------------------

https://lkml.kernel.org/r/7da20892-f92a-68d8-4804-c72c1cb0d090@linux.ibm.com

MM 의 오랜 숙원 중 하나는 `mmap_sem` 으로 인한 확장성 문제 해결이죠.  기존의 RB
tree 대신 XArray 를 사용하는 것으로 새로운 시도를 시작해 보는건 어떨지 LSFMM
에서 토의해보자는, speculative page fault 의 최근 메인테이너인 Laurent 의
메일입니다.
곧바로 XArray 메인테이너인 Matthew 의 답장이 오는군요.
꼭 해보려는 의지가 강력해 보입니다.


mm/cma.c: High latency for cma allocation
-----------------------------------------

https://lkml.kernel.org/r/SG2PR02MB3098E44824F5AA69BC04F935E8470@SG2PR02MB3098.apcprd02.prod.outlook.com

이어지는 CMA 레이턴시에 대한 문의입니다.  제게 GCMA 레이턴시에 대해 온 문의에
대해서는 제 실험 환경을 보내주고 그쪽 환경에서 돌려본 후 결과를 알려달라
했는데, 아직 답이 없군요.
좀 더 자세한 분석 결과를 달라는 Michal 의 답변이 있습니다.


Linux 5.1-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wj1c_Tb-wwM6qaPLdggXtW3rOh1JzYUOs+O7PsHt-=+jg@mail.gmail.com

v5.1 머지 윈도우가 종료되고 v5.1-rc1 이 릴리즈 되었습니다.  이번 릴리즈도 크게
다른 건 없고 매우 평범했다고 합니다.  좋은 징조인데요, 변경사항의 60%를 차지한
드라이버 가운데 habanalab 의 AI 가속기 칩 드라이버를 조금 특별한 변경사항으로
토발즈는 꼽네요. 
