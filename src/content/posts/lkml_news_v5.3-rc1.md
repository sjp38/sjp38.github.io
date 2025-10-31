+++
title = "LKML News v5.3-rc1"
date = 2019-07-11T02:42:22+09:00
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


[PATCH v5 0/5] Introduce MADV_COLD and MADV_PAGEOUT
---------------------------------------------------

https://lkml.kernel.org/r/20190714233401.36909-1-minchan@kernel.org

`MADV_COLD` 와 `MADV_PAGEOUT` 을 구현하는 패치, 어느새 다섯번째 버전입니다.  큰
변경은 없는 것 같군요.


[PATCH v2 0/3] Make working with compound pages easier
------------------------------------------------------

https://lkml.kernel.org/r/20190721104612.19120-1-willy@infradead.org

Huge page 를 다루기 쉽게끔 `page_size()`, `page_shift()`, 그리고
`compound_nr()` 이라는 세개의 helper 함수를 추가하고 이 함수들을 사용하게끔
기존 코드를 다듬는 패치셋입니다.

`PAGE_SIZE << compound_order(page)` 는 `page_size(page)` 가,
`PAGE_SHIFT + compound_order(page)` 는 `page_shift(page)` 가, 그리고
`1 << compound_order(page)` 는 `compound_nr(page)` 가 되는 것이죠.


Linux 5.3-rc1
-------------

https://lkml.kernel.org/r/wiVjkTqzP6OppBuLQZ+t1mpRQC4T+Ho4Wg2sBAapKd--Q@mail.gmail.com

이번 릴리즈 사이의 변경 사항을 시각화 한 비디오를 아래 링크에서 볼 수 있습니다:
https://youtu.be/vx_BUvs00u8

2주일이 지나고 5.3 을 향한 첫번째 rc 릴리즈가 이루어졌습니다.

이번 rc 릴리즈는 커밋 갯수로 볼 때 꽤 큰 릴리즈입니다.  4.12, 4.15, 4.19 때의
머지 윈도우와 비슷한 정도라는군요.  참고로 가장 큰 머지윈도우는 아직 4.9 의
것이었습니다.

이번 머지 윈도우는 초기에 두개의 버그가 나와서 토발즈를 괴롭게 했다고 하는데요.
하나는 토발즈의 커널 컨피규레이션이 너무 간단하게 되어 있어 어떤 코드가 테스트
되지 않아 토발즈가 만들어낸 버그였고, 다른 하나는 패치 자체에 존재하는
버그였다고 합니다.  토발즈가 유발한 버그는 토발즈가 고쳤고, 두번째 버그를
일으킨 패치는 그냥 리버트 시켰다고 하는군요.

그렇다고는 해도 이번 머지 윈도우의 후반부는 충분히 스무스하게 이뤄졌다고
합니다.

그리고 이번 머지 윈도우에 이름을 올린 개발자는 총 1600명이었다는군요.
