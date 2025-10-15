+++
title = "LKML News v5.0-rc1"
date = 2019-01-07T11:18:50+09:00
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

[RFC v3 0/3] test driver to analyse vmalloc allocator
----------------------------------------------------

https://lkml.kernel.org/r/20190102085924.14145-1-urezki@gmail.com

vmalloc 의 성능과 스트레스 테스트를 위한 모듈을 구현한 패치입니다.  Selftests
에도 테스트 스크립트를 추가했군요.


[RFC PATCH 0/1] mm: add a warning about high order allocations
--------------------------------------------------------------

https://lkml.kernel.org/r/20181225153927.2873-1-khorenko@virtuozzo.com

특정 노드의 메모리에 접근이 많이 되고 있는 상황에서 해당 메모리가 fragment 되어
있고 이 시점에서 high order allocation 이 요청되면 이걸 위해 compaction 등이
작동하니까 다른 태스크의 latency 가 떨어질 수 있습니다.  이런 상황을 모니터링
할 수 있게끔, 이 패치는 `vm.war_high_order` 라는 값을 sysctl 통해 설정하면 이
값을 넘는 order 의 allocation 이 요청되었을 때 워닝을 뱉어 줍니다.


[PATCH] mm: Introduce page_size()
---------------------------------

https://lkml.kernel.org/r/20181231134223.20765-1-willy@infradead.org

Huge page 의 존재로 인해 페이지의 실제 크기는 모두 똑같지가 않기 때문에 이를
판별할 방법이 필요하죠.  이 패치는 단순히 기존에 좀 복잡하게 직접 페이지 크기를
구하던 것을 별도의 wrapper function 으로 대체하기 위한 준비 작업입니다.


Linux 5.0-rc1
-------------

https://lkml.kernel.org/r/wgKYnrL3LjhVkH2Fp+ecmWhLqezT9zmR6CzfcpwcJX0qA@mail.gmail.com

리눅스 커널 버전의 숫자가 큰 의미 없게 된지도 오래이긴 합니다만 그래도 메이저
버전 변경은 항상 뭔가 들뜨게 마련이죠.
드디어 5.x 커널의 시대가 시작되었습니다.

연말/연처 휴일이 섞여 있는 덕에 꽤 오랫만의 릴리즈가 되었고, 그덕에 좀 늦게
풀리퀘스트가 온 것들도 있었지만 큰 문제는 없었다고 하네요.

메이저 버전이 4.x 에서 5.x 로 바뀌긴 했지만 손가락 발가락 다 써도 4.21 의
버전은 셀수가 없기 때문에 5.x 로 바뀌었을 뿐 특별한 변경이나 새로운 기능은
없다는 점도 한번 더 공지합니다.
하지만 많은 기능들이 추가된 것도 사실이니 원하면 하나 꼽아들고 이거 때문에 5.x
로 업데이트 되었다고 생각해도 좋다고 하는군요.

이번 릴리즈는 총 11000여개의 커밋을 받아들인 긴 머지 윈도우를 거쳤지만,
그렇다고 유별날 건 없다는군요.  절반 가량이 드라이버, 20%는 아키텍쳐, 10% 툴링,
나머진 여기저기.
