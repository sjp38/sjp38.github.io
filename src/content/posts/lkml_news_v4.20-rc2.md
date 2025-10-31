+++
title = "LKML News by v4.20-rc2"
date = 2018-11-12T08:30:21+09:00
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

[PATCH 0/5] Fragmentation avoidance improvements v2
---------------------------------------------------

https://lkml.kernel.org/r/20181107183822.15567-1-mgorman@techsingularity.net

장시간 운영되는 시스템은 결국 메모리가 단편화 (fragmentation) 되게 되어
있습니다.  페이징을 사용하면 단일 페이지 단위 할당은 문제가 없지만, 물리적으로
연속적인 페이지를 할당받기가 어려워지죠.  Mel Gorman 의 이 패치는 이런 메모리
분절화를 좀 더 잘 막을 수 있는 방법을 포함하고 있습니다.

첫번째 패치는 단일 페이지 또는 적은 물리적 연속 페이지들의 할당 시에 불필요하게
higher order free page zone 을 사용하지 않게 하고, 두번째와 세번째 패치는
kswapd 와 kcompactd 를 사용한 defragmentation 을 좀 더 적극적으로 하게 합니다.
네번째 패치는 movable allocation request 시에 kswapd 를 또 깨우고, kswapd 가
일을 마칠 때까지 멈춰서 기다려 줍니다.
마지막으로 다섯번째 패치는 분절화가 발생해야만 하는 경우, kcompactd 가 처리할
블록들로 해당 분절된 영역을 마크해 둡니다.

물론 분절화를 막는 대신 오버헤드를 가져올 수 있겠고, Mel 은 이 기능들을 tuning
하거나 꺼버릴 수 있게 했군요.


[PATCH 0/4] Fragmentation avoidance improvements v3
---------------------------------------------------

https://lkml.kernel.org/r/20181108091218.32715-1-mgorman@techsingularity.net

Mel 의 분절화 방지 패치셋은 오버헤드를 가질 수밖에 없었죠.  결국 얼마 되지 않아
세번째 버전의 패치셋[1]을 내놓았는데, 여기선 다섯번째 패치를 걍 없애버렸고,
네번째 패치도 그 오버헤드가 덜하게끔 만들었습니다.


[RFC PATCH] mm: thp: implement THP reservations for anonymous memory
--------------------------------------------------------------------

https://lkml.kernel.org/r/1541746138-6706-1-git-send-email-anthony.yznaga@oracle.com

Transparent huge page (THP) 가 켜져 있는 경우, promotion 이 꽤나 급하게
이루어지기 때문에 huge page 를 할당받고는 정작 그 영역을 모두 접근하지 않는
경우엔 메모리 소모가 큽니다.  기존에 이 문제를 해결하기 위한 패치가 있었는데,
그에 대해 Mel Gorman 의 피드백이 있었고, 이 패치는 그 피드백을 받아들여 새로
작성된 패치셋입니다.

Page fault 가 날 경우 huge page 를 할당할 수 있는 양의 페이지를 할당받되 페이지
한개만 map 해두고 나머지는 reserve 를 해두고, 이후 주변 영역에 fault 가 날
때마다 나머지 페이지들을 계속 map 해주다가 충분히 많은 영역이 fault 났을 경우에
huge page 로 promote 를 해주고, 그 전에 memory pressure 가 발생하면 reserve
해둔 페이지들을 reclaim 하는 형태입니다.


[PATCH tip/core/rcu 0/20] Documentation updates for v4.21/v5.0
--------------------------------------------------------------

https://lkml.kernel.org/r/20181111195619.GA6958@linux.ibm.com

RCU 문서 업데이트 패치셋입니다.  생각해 보면 리눅스 커널만큼 문서화 잘 된
프로젝트도 드물죠.


[PATCH tip/core/rcu 0/8] Automate initrd generation for v4.21/v5.0
------------------------------------------------------------------

https://lkml.kernel.org/r/20181111200127.GA9511@linux.ibm.com

RCU 테스트 프레임웍인 rcutorture 는 가상머신 환경을 사용하는데, 이를 위한
initrd 생성을 자동화 하는 패치셋입니다.


Linux v4.20-rc2
---------------

https://lkml.kernel.org/r/R7SW0SuwOMMMyRgTFGA@mail.gmail.com

토발즈가 여행 중이란 걸 제외하고는 별 특이사항 없는 두번째 rc 버전
릴리즈입니다.
