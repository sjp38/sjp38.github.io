+++
title = "LKML News by 4.20-rc5"
date = 2018-11-29T08:14:01+09:00
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

[PATCH V12 00/20] block: support multi-page bvec
------------------------------------------------

https://lkml.kernel.org/r/20181126021720.19471-1-ming.lei@redhat.com

`struct bio_bvec` 하나가 물리적으로 연속적인 여러개의 페이지를 담을 수 있게
해서 block layer 의 효율성을 높이기 위한 시도입니다.


[PATCH] aio: Convert ioctx_table to XArray
------------------------------------------

https://lkml.kernel.org/r/20181128183531.5139-1-willy@infradead.org

aio 쪽의 `ioctx_table` 이라는 자료구조가 스펙터에 취약한 자료구조인데, 인덱스
오버플로 문제가 없는 XArray 로 교체하는 패치입니다.  정말 코드가
깔끔해지는군요.


`[PATCH 0/4][V4] drop the mmap_sem when doing IO in the fault path`
-------------------------------------------------------------------

https://lkml.kernel.org/r/20181130195812.19536-1-josef@toxicpanda.com

`ps` 등의 도구를 사용해 시스템 상황을 모니터링하는 커다란 어플리케이션을 사용
중인데, 이 과정에서 다른 `task` 의 `mmap_sem` 을 `down_read()` 해야 하는 경우가
종종 생긴다는군요.  문제는 이 `mmap_sem` 의 쓰기 권한을 얻어오는 과정이 사실상
mutex 와 동일하니 레이턴시가 크게 늘어날 때가 종종 생긴다고 합니다.  이 문제를
해결하기 위해 `retry` 메커니즘을 적용하는 패치셋입니다.


[PATCH v2 0/9] Use vm_insert_range
----------------------------------

https://lkml.kernel.org/r/20181202061707.GA3070@jordon-HP-15-Notebook-PC

드라이버가 자신의 커널 메모리를 사용자 vma 로 매핑하는 방법은
`vm_insert_page()` 를 사용하는 방식이었고, 여러 페이지를 매핑하려면 이 함수를
루프를 돌면서 수행해야 했는데요, 이게 좀 귀찮으므로 아예 `vm_insert_range()`
라는 함수를 추가한 패치입니다.


Linux 4.20-rc5
--------------

https://lkml.kernel.org/r/CAHk-=wizcNrsoyCM1EXQqoswMCYsJaby2iAkZb9wBAzDEhvxNg@mail.gmail.com

벌써 다섯번째 rc 릴리즈이므로 변경내용이 줄어들어야 할 타이밍이지만, 이상하게도
이번 릴리즈는 -rc1 을 제외하고는 가장 변경이 큰 릴리즈라는군요.  게다가 arch 쪽
변경사항이 꽤 많은데, 아마도 STIPB 쪽 성능 리그레션 때문인 것으로 보인다고
합니다.  아무튼 일반적인 모습은 아니다보니 릴리즈 일정이 변경될 가능성이
생겼는데요, 너무 미루면 연말연초 휴일에 머지 윈도우가 겹치게 되는데 토발즈는
휴일 동안 머지 윈도우 관리하기 싫고, 그렇다고 더 미루면 토발즈도 1월 후반에
여행 갈거고, 남들도 휴일에 머지 윈도우를 준비하기가 싫을 거라 고민이라
하는군요.

결국 일단은 크리스마스 직전 쯤 4.20 을 릴리즈 하고, 남들도 머지 윈도우 준비를
그 전까지 마치는 걸 제안하고 있습니다.  물론, rc6 에서도 변경사항이 충분히
줄어들지 않는다면 릴리즈 일정은 더 늦춰질 수 있겠죠.
