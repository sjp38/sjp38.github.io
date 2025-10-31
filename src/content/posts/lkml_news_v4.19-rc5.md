+++
title = "LKML News after v4.19-rc5"
date = 2018-09-24T10:10:40+09:00
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

Linux 4.19-rc5
--------------

https://lkml.kernel.org/r/20180923175547.GA4462@kroah.com

지난주 토발즈가 휴식을 선언한 이유로 한동안 릴리즈는 Greg 이 맡게 되었죠.  이번
릴리즈는 그래서 Greg 이 합니다.

사회적으로야 이런저런 일이 많았지만 (토발즈의 휴가, Code of Conduct 머지에
관련해 갑론을박이 많군요.) 기술적으로는 별 일 없었던 한주라 평가되는군요.

사소하지만 재밌는 건 Greg 의 자기 서명.
`greg "keeping the seat warm for a few weeks" k-h` 라고 하는군요.
토발즈가 휴가 가있는 동안 의자를 뎁혀 두는 역할이라는 겸손함이 눈에 띄네요.


[PATCH -V5 RESEND 00/21] swap: Swapout/swapin THP in one piece
--------------------------------------------------------------

https://lkml.kernel.org/r/20180925071348.31458-1-ying.huang@intel.com

THP 의 Swap in/out 을 regular page 로 쪼개지 않고 한방에 하는 패치의 최신
버전입니다... 만, 기존 대비 버전업이 되진 않았고 리뷰를 요청하기 위해 다시 한번
보냈군요.  그런데 아직 별다른 리뷰가 없네요...
