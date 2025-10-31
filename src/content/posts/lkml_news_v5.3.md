+++
title = "LKML News v5.3"
date = 2019-09-12T17:59:25+02:00
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


[PATCH] x86/mm: Enable 5-level paging support by default
--------------------------------------------------------

https://lkml.kernel.org/r/20190913095452.40592-1-kirill.shutemov@linux.intel.com

5 레벨 페이지 테이블 기능이 들어간지도 어느덧 시간이 지났죠.
인텔 내부적 테스트 상으론 이 기능을 켰을 때 4 레벨 페이지 테이블 기계에서도
딱히 리그레션 등은 나타나지 않았고, 주요 배포판들은 5 레벨 페이지 테이블
서포트를 기본으로 켤것으로 보인다고 합니다.
따라서 이 기능을 아예 디폴트로 켜져있게 하는 패치입니다.

v5.4 에 들어가기엔 좀 늦은 관계로, v5.5 에 들어갈 것 같다는군요.


Linux 5.3
---------

https://lkml.kernel.org/r/CAHk-=wiP4K8DRJWsCo=20hn_6054xBamGKF2kPgUzpB5aMaofA@mail.gmail.com

LPC 와 커널 서밋 등으로 인해 한주 늦춰진 5.3 릴리즈가 이뤄졌습니다.
지난 일주일은 고요했을 뿐더러, 이 늦춰진 일정 덕에 몇가지 수정도 더 이뤄질 수
있었다고 토발즈는 평하는군요.
