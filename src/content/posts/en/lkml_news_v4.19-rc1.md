+++
title = "LKML News after v4.19-rc1"
date = 2018-08-27T17:11:28+09:00
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

Linux 4.19-rc1
--------------

`https://lkml.kernel.org/r/CA+55aFw9mxNPX6OtOp-aoUMdXSg=gBkQudGGamo__sh_ts_LdQ@mail.gmail.com`

이주일의 머지 윈도우가 끝나고 리눅스 4.19 버전을 향한 안정화 단계가
시작되었습니다.

토발즈에겐 결코 즐겁지 않은 머지 윈도우였습니다 (frustrating merge window
였다고 표현하는군요).  일단 머지 윈도우 초기부터 L1TF 취약점 이슈가 나왔죠.
하지만 이슈가 처음 발견된 건 아니고 공식 보고된 거다보니 그 전부터 수정은 하고
있었기에 머지만 하면 됐습니다.  토발즈는 `-next` 트리와 다양한 커널 테스트
시스템들이 잘 갖추어져 있다는 증거라고 이야기 합니다.

또, TLB 슛다운 버그에 대한 보고가 있었군요.  결국은 큰 문제는 아니었다고
결론났음에도 토발즈의 신경을 많이 긁었다고 합니다.  이 과정에서 관련 코드가
매우 복잡하고 디버깅 하기 어렵다고 이야기 되었기에 차후 정리가 필요할 것
같다는군요.

또한, 이번 릴리즈는 꽤 많은 변경이 있는 편이라고 합니다, 물론 커밋 수
기반으로요.


[RFC][PATCH 0/5] introduce /proc/PID/idle_bitmap
------------------------------------------------

https://lkml.kernel.org/r/20180901112818.126790961@intel.com

`/sys/kernel/mm/page_idle/bitmap` 을 사용하면 시스템의 실제 워킹셋 페이지가
무엇무엇인지 알 수 있는데요, 이걸 `/proc/PID/idle_bitmap` 으로 옮겨서 좀 더
finer-grained 하게 특정 프로세스의 워킹셋을 추적할 수 있게 하려는 RFC
패치입니다.  기존의 글로벌한 비트맵은 아무래도 사용하기에 오버헤드가 있기
때문이죠.  특히 NVIDMM 을 고려하면 수 테라바이트도 쉽게 보인다는 이야기를
하는군요.  저도 해당 bitmap 을 사용해 워킹셋 추적 프로그램을 만들었다가
오버헤드로 고민이 깊어져서 커널을 좀 고치긴 해야겠다 싶었는데, 잘 머지되면
좋겠습니다.

이와 함께 인텔의 Apache Pass NVDIMM 에 대한 이야기도 하는군요.  옵테인 기반의
NVDIMM 제품인 거 같은데, NVDIMM 도 현물이 나오기 시작하는군요.


[PATCH RFC LKMM 1/7] tools/memory-model: Add extra ordering for locks and remove it for ordinary release/acquire
----------------------------------------------------------------------------------------------------------------

이 락킹 앞뒤의 액세스 순서를 지켜주는게 LKMM 에는 반영되어 있지 않습니다.
이걸로 몇명의 커널 프로그래머들이 항의했나 보네요.  이런 부분들을 추가하는
패치입니다.


[PATCH tip/core/rcu 0/6] Documentation updates for v4.20/v5.0
-------------------------------------------------------------

https://lkml.kernel.org/r/20180829211637.GA20980@linux.vnet.ibm.com

다음 리눅스 머지 윈도우를 겨냥하는 RCU 쪽 문서 업데이트입니다.  다음 버전은
4.20이 될지 5.0이 될지 Paul 도 모르겠나보군요.


[PATCH tip/core/rcu 0/3] SRCU updates for v4.20/v5.0
----------------------------------------------------

https://lkml.kernel.org/r/20180829212036.GA22033@linux.vnet.ibm.com

다음 리눅스 머지 윈도우를 향한 SRCU 업데이트 입니다.  `call_srcu()` 를 부팅
초기부터 사용할 수 있도록 하는군요.  테스트도 작성했습니다.


[PATCH tip/core/rcu 0/24] Additional RCU-consolidation cleanups for v4.20/v5.0
------------------------------------------------------------------------------

RCU 는 여러 변종 (flavor) 들이 있는데, 이것들을 최대한 합치려 하고 있는 듯
하군요.
