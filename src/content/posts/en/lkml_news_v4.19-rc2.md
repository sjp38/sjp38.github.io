+++
title = "LKML News after v4.19-rc2"
date = 2018-09-03T11:34:35+09:00
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

Linux 4.19-rc2
--------------

https://lkml.kernel.org/r/CA+55aFyG0GbDfoghEhAmKBPcZCiPu6CCpPRz9GwjCzLuP_Vv5Q@mail.gmail.com

리눅스 4.19 두번째 릴리즈 후보 버전의 릴리즈입니다.  첫번째 릴리즈 후보 버전
릴리즈 후엔 사람들이 좀 쉬게 마련이고 버그를 찾기엔 시간이 많지 않았기에 큰
변화는 없었습니다.  유럽사람들의 경우 아직 휴가기간인 사람도 많구요.  미국
OSSummit 이 지난주 진행된 것도 한 영향이겠네요.


[PATCH -V5 00/21] swap: Swapout/swapin THP in one piece
-------------------------------------------------------

https://lkml.kernel.org/r/20180903072214.24602-1-ying.huang@intel.com

관심있게 지켜보고 있는, THP swapout/in 패치입니다.  다음 머지 윈도우에선 들어갈 수 있을까요?


Plumbers 2018 - Performance and Scalability Microconference
-----------------------------------------------------------

https://lkml.kernel.org/r/1dc80ff6-f53f-ae89-be29-3408bf7d69cc@oracle.com

올해 Linux Plumbers Conference 에 'Performance and Scalability Microconference'
가 열립니다.  Huge page, mmap_sem, cpu 병렬화 등등 재밌는 주제가 많네요.
