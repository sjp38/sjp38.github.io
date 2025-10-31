+++
title = "LKML News v5.2-rc1"
date = 2019-05-08T10:22:05+09:00
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

[PATCH] mm: Introduce page_size()
---------------------------------

https://lkml.kernel.org/r/20190510181242.24580-1-willy@infradead.org

Huge page 등의 경우를 위해 페이지의 실제 크기를 구하려면 `PAGE_SIZE <<
compound_order(page)` 를 해야 하는게 짜증난 Matthew Wilcox 가 별도의 함수를
만들고 기존 코드들을 이 함수를 사용하도록 변경한 패치입니다.


[PATCH v2 00/15] Remove 'order' argument from many mm functions
---------------------------------------------------------------

https://lkml.kernel.org/r/20190510135038.17129-1-willy@infradead.org

mm 쪽 함수들은 order 를 인자로 많이 받죠.  어차피 gfp_t 는 무조건 받으니까 이
타입의 상위 bit 을 order 목적으로 사용하자는 패치입니다.  이 패치의 장점은?
커널 텍스트 사이즈를 줄인다는 것입니다 :)


Maintainer's / Kernel Summit 2019 planning kick-off
---------------------------------------------------

https://lkml.kernel.org/r/20190513230643.GA4347@mit.edu

올해의 커널 서밋 / 메인테이너 서밋을 위한 안내 메일입니다.  작년엔 커널 서밋은
LPC 와, 메인테이너 서밋은 OSSEU 와 함께 열렸었죠.  올해는 둘 다 LPC 와 함께
합니다.

메인테이너 서밋은 올해는 아예 30명으로 더욱 작게 모이는군요.

커널 서밋 발표 주제는 5월 31일까지 받습니다.  발표주제 선정되면 LPC 티켓도
준다는군요!


Linux 5.2-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wgxi6fnxZ+p5Zdqr-i4s=xhOCBJL6s_RauYkjxM2CpXeA@mail.gmail.com

5.2 릴리즈를 위한 머지윈도우가 끝나고 rc1 버전이 릴리즈 되었습니다.  이번 머지
윈도우 중간에 토발즈의 개인적 여행이 있다고 했지만 다행히 잘 정리되었나보군요.
별다른 건은 없었다고 합니다.
