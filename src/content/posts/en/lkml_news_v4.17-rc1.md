+++
title = "LKML News after v4.17-rc1"
date = 2018-04-16T10:59:58+09:00
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

Linux v4.17-rc1
---------------

https://lkml.kernel.org/r/CA+55aFx62iBkj+hOmhLksUtvjwTcm_o1dwcyvaNnVpJ-AmvzVQ@mail.gmail.com

2주간의 머지 윈도우가 지나고, v4.17-rc1 이 릴리즈 되었습니다.  크게 특별할 것
없이 평범한 머지 윈도우였다고 토발즈는 평하는군요.  그리고 이번에 git objects
mark 가 4백만을 넘겼습니다.  따라서 다음 커널이 v5.0 이어도 될 것 같은데, 꼭
다음 버전에서 그렇게 할지는 모르겠다는군요.  리눅스 커널에서 버전은 그저 시간이
흘렀음을 의미할 뿐, 큰 변화가 있어서 메이저 버전 넘버가 바뀌는게 아니기
때문이죠.  참고로 v3.0 과 v4.0 은 각각 git objects mark 2백만과 4백만에서
이루어졌군요.

암튼 언젠가는 v5.0 을 릴리즈 하겠지만 너무 큰 의미를 부여하지 말아달라고 이야기 하고 있습니다.

토발즈는 또한 이번 머지 윈도우에서의 변화로 몇가지를 꼽는데요.
오래된 아키텍쳐인 backfin, cris, frv, m32r, metag, mn10300, score, tile
아키텍쳐의 지원을 끊기로 했고 nds32 라는 새로운 아키텍쳐를 지원하게 되었군요.
해당 아키텍쳐에 지원이 더 필요하다면 언제든 되살려도 좋지만 본인이 잘 관리할 수
있음을 증명해야 함을 한번 더 언급하고 있습니다.

또한, 이번 머지 윈도우에선 클린업이 꽤 있었습니다.  staging 드라이버들 몇개가
제거되었고, spdx 를 사용함으로써 카피라이트 문구도 많이 줄었습니다.
pre-shipped lexer / parser 파일들도 사라졌구요.

결국, 이번 릴리즈는 추가된 코드 라인보다 삭제된 코드 라인이 많았던 릴리즈군요.
프로젝트 관리자로써 토발즈가 속시원할 것 같습니다.  이런 경우는 커널 릴리즈
역사상 처음이라는군요.

```
 13538 files changed, 627723 insertions(+), 818855 deletions(-)
```


[PATCH v10 00/25] Speculative page faults
-----------------------------------------

https://lkml.kernel.org/r/1523975611-15978-1-git-send-email-ldufour@linux.vnet.ibm.com

어느새 열번째 버전의 speculative page faults 패치셋입니다.


[PATCH v2 00/12] Improve shrink_slab() scalability (old complexity was O(n^2), new is O(n))
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/152397794111.3456.1281420602140818725.stgit@localhost.localdomain

많은 memort shrinker 들 또는 메모리 cgroups 를 가진 시스템에서는 그 수의 제곱에
비례해 `shrink_slab()` 의 수행시간이 증가하는데, 이 문제를 해결하고자 하는
패치셋입니다.

`# echo 3 > /proc/sys/vm/drop_caches` 의 수행시간을 사용해 성능 차이를
측정했군요.


[PATCH 00/21] mm, THP, swap: Swapout/swapin THP as a whole
----------------------------------------------------------

https://lkml.kernel.org/r/20180417020230.26412-1-ying.huang@intel.com

THP (Transparent Huge Page) 는 swap out 되기 전에 regular page 로 쪼개져야
했습니다.  이 작업에 많은 시간이 걸렸기에 한번에 THP 를 swap out 하기 위한
작업을 Huang Ying 이 해왔고 일단 쪼개는 작업은 최후로 미뤄뒀는데 마침내 완전히
THP 단위로 swap out 을 행하는 패치셋을 올렸습니다.

RAM 으로 PMEM swap device 를 시뮬레이션 해서 vm-scalability 벤치마크의
swap-w-seq 테스트를 16개 프로세스로 실험한 결과, 약 10배의 성능 개선을
보았군요.


[PATCH tip/core/rcu 0/21] Contention reduction for v4.18
--------------------------------------------------------

https://lkml.kernel.org/r/20180423030258.GA23370@linux.vnet.ibm.com

RCU 의 루트 'rcu_node' 구조체로의 락 컨텐션을 줄이는 Paul McKenney 의
패치셋입니다.  별 문제 없으면 4.18 버전에 들어가겠군요.
