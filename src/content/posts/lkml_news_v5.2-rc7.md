+++
title = "LKML News v5.2-rc7"
date = 2019-06-27T15:35:12+09:00
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

[PATCH v7 0/4] THP aware uprobe
-------------------------------

https://lkml.kernel.org/r/20190625235325.2096441-1-songliubraving@fb.com

`uprobe` 가 THP 로 받쳐지고 있는 코드에 적용되면 이 THP 는 regular page 로
쪼개집니다.  이 패치셋은 이 문제를 해결합니다.


[PATCH v9 0/6] Enable THP for text section of non-shmem files
-------------------------------------------------------------

https://lkml.kernel.org/r/20190625001246.685563-1-songliubraving@fb.com

어플리케이션의 텍스트 섹션을 THP 로 지원해 줌으로써 iTLB 미스를 줄이고 성능을
높이고자 하는 패치셋입니다.


Linux 5.2-rc7
-------------

https://lkml.kernel.org/r/CAHk-=wgL5GyQ93o=VyiymFPfw=Z0TGHEPBJrCtGSqFSW2Mhx8g@mail.gmail.com

여전히 토발즈의 여행 탓에 릴리즈가 평소와 조금 다른 시간대에 이뤄졌습니다,
토발즈 자신의 시점으로는 평소와 같은 일요일 오후지만요.  아마도 아시아 쪽에
있는 것 같군요.  이번 릴리즈는 심지어 바다 위에서의 릴리즈라네요.  인터넷 안될
줄 알았는데 Dirk Hohndel 이 핸폰 핫스팟을 빌려줬다고 ;)

이번 릴리즈는 고요했고, 별 문제 없었다고 합니다.  다음주엔 정식 릴리즈일까요?
