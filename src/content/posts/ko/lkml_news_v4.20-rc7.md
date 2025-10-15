+++
title = "LKML News by v4.20-rc7"
date = 2018-12-17T09:16:11+09:00
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

[PATCH -V9 00/21] swap: Swapout/swapin THP in one piece
-------------------------------------------------------

https://lkml.kernel.org/r/20181214062754.13723-1-ying.huang@intel.com

아직 머지되지 못한 THP swap in 패치셋의 아홉번째 버전입니다.


[RFC 0/3] reduce THP fault thrashing
------------------------------------

https://lkml.kernel.org/r/20181211142941.20500-1-vbabka@suse.cz

THP fault 로 인한 로컬 노드 thrashing 을 해결하기 위한 패치의 RFC 입니다.  THP
fault 성공률을 낮추는 부작용도 있긴 하군요.  아직 테스트도 안된 첫번째 RFC
이니, 이대로 머지되진 않겠지 싶긴 합니다만 재밌네요.


Linux 4.20-rc76
---------------

https://lkml.kernel.org/r/CAHk-=whv9u9aTEPoCz8h83JJbVK4fmHELJF=GG01ht9=1_MaCQ@mail.gmail.com

일곱번째 rc 버전의 릴리즈입니다... 만, 이번엔 릴리즈 메일 제목에 오타가
있었군요.  전체적으로 일곱번째인만큼 변경사항이 적습니다.  릴리즈 하는 토발즈
입장에선 반가운 일이군요.  특히나 연휴가 다가오니까요.

릴리즈 계획은 기존과 같이, 크리스마스 전에 4.20 버전을 릴리즈하고, 이후에 머지
윈도우를 가질텐데, 가급적이면 연휴 전에 미리미리 풀리퀘스트를 보내달라고
하는군요.
