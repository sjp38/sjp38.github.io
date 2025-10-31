+++
title = "LKML News after v4.19-rc3"
date = 2018-09-11T06:01:49+09:00
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

Linux 4.19-rc3
--------------

https://lkml.kernel.org/r/CA+55aFwSxCt0aKkTxcBstthYXqJ5LtxRbO-CDyqgNwU94Ldq+w@mail.gmail.com

세번째 rc 릴리즈입니다.  어느새 이번 안정화 기간도 중반을 향하는군요.  시간 참
빠릅니다.  전체적으로 평범한 릴리즈입니다.  딱히 언급할 거리가 없군요.


[RFC PATCH v2 0/8] lru_lock scalability and SMP list functions
--------------------------------------------------------------

https://lkml.kernel.org/r/20180911004240.4758-1-daniel.m.jordan@oracle.com

올해 LSF/MM 서밋에서도 이야기되었던, `lru_lock` 의 확장성을 개선하기 위한
노력의 정리입니다.  LRU 리스트에 여러 쓰레드가 실제 데이터를 겹쳐 쓰지 않는다면
동시에 접근할 수 있는 새로운 오퍼레이션 세개 (`smp_list_del()`,
`smp_list_splice()`, `smp_list_add()`)을 추가했구요.  두번째로, `lru_lock` 을
`spinlock` 에서 `rwlock` 으로 교체했군요.

`will-it-scale/page_fault1` 이라는 마이크로 벤치마크를 사용해서 성능을
비교했는데, 44 코어 시스템에서 최대 73.8% 더 초당 페이지 폴트 처리량을 늘릴 수
있었다고 합니다.


[RFC PATCH 0/9] Improve zone lock scalability using Daniel Jordan's list work
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20180911053616.6894-1-aaron.lu@intel.com

바로 앞에서 설명한, 여러 쓰레드가 동시에 리스트에 접근할 수 있도록 새로
만들어진 메커니즘은 `zone lock` 에도 도움이 될 수 있다고 LSF/MM 에서 여럿이
생각했다고 합니다.  이 패치셋은 실제로 이 기능들을 이용해 `zone lock` 의
확장성을 개선했습니다.


[PATCH -V5 RESEND 00/21] swap: Swapout/swapin THP in one piece
--------------------------------------------------------------

https://lkml.kernel.org/r/20180912004414.22583-1-ying.huang@intel.com

THP 를 덩어리째 스왑아웃 / 스왑인 하기 위한 패치, 다섯번째 버전입니다.
생각보다 쉽게 머지되지 못하고 있군요.  리뷰가 많지 않은 것도 한 이유 아닐까
싶습니다.
