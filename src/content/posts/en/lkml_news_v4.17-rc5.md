+++
title = "LKML News after v4.17-rc5"
date = 2018-05-14T10:23:45+09:00
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

Linux 4.17-rc5
--------------

https://lkml.kernel.org/r/CA+55aFxi-Q6hvdHn+JwYSQ9b3feNGoFM3eeAuKNhpkfxVNAGpA@mail.gmail.com

4.17을 향한 다섯번째 rc 릴리즈입니다.  이번 릴리즈도 여느 때와 다름없이
평범하군요.  대부분 드라이버 변경들이고, amd gpu 쪽 변경이 있지만 나머지
부분들은 그렇게 많지 않고 대부분 한두줄 짜리 변경들입니다.  이대로라면 이번
4.17 릴리즈는 꽤 무난무난하게 끝나겠군요.


[PATCH v11 00/26] Speculative page faults
-----------------------------------------

https://lkml.kernel.org/r/1526555193-7242-1-git-send-email-ldufour@linux.vnet.ibm.com

이 블로그에서도 몇차례 소개한, speculative page fault 의 11번째 버전입니다.
지난 LSFMM 에서도 관련해 논의를 한 것 같던데, 아주 긍정적 반응은 아니었던 것
같습니다만, 어쨌든 오랫만에 올라온 새로운 버전의 패치셋이군요.


[PATCH v6 00/17] Rearrange struct page
--------------------------------------

https://lkml.kernel.org/r/20180518194519.3820-1-willy@infradead.org

`struct page` 의 구조를 좀 더 사용하기 쉽게 개선하는 패치의 여섯번째
버전입니다.  LSFMM 에서는 그 구조를 구글 문서[1]를 사용해 그림으로 그려가며
설명했고, 꽤 괜찮은 반응을 얻었던 것 같더군요.


[1] https://docs.google.com/spreadsheets/d/1tvCszs_7FXrjei9_mtFiKV6nW1FLnYyvPvW-qNZhdog/edit?usp=sharing
