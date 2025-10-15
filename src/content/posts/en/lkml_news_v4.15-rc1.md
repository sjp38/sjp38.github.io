+++
bigimg = ""
date = "2017-11-27T11:09:15+09:00"
subtitle = ""
title = "LKML News after v4.15-rc1"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc1
--------------

https://lkml.kernel.org/r/CA+55aFzcudOPSwbD9XfVxBgFsQOhBjyncyYnGDYwZUEHOGUwcw@mail.gmail.com

예정대로 2주만에 4.15 의 첫번째 rc 버전이 나왔습니다.

지난주는 추수감사절이라 다들 휴가인 사람이 많았기에 첫번째 주에 최대한 많이
풀리퀘스트를 받았고 지난주는 좀 더 까다롭게 풀리퀘스트를 검사했군요.  토발즈는
두번째 주 동안 랩톱 들고 여행중이었고, 랩톱에서는 전체 모듈 빌드를 하지 않기
때문이라 합니다.  메인테이너들도 가능한 첫번째 주에 중요 플리퀘스트를 보내는
식으로 협조를 해줬다고 합니다.  그네들도 두번째주는 휴가가고 싶었을테니... ;)

4.14 가 LTS 였기에 이번 머지윈도우에는 변화가 크지 않을 것으로 예상했는데
생각보다 많은 풀리퀘스트가 있었다고 합니다.  4.9 때와는 다른 경향인데, 4.9 에
비해 4.14 가 변화가 크지 않았기 때문 아니겠냐고 토발즈는 생각하는군요.


[PATCH v3 0/4] introduce get_user_pages_longterm()
--------------------------------------------------

https://lkml.kernel.org/r/151197872943.26211.6551382719053304996.stgit@dwillia2-desk3.amr.corp.intel.com

커널스페이스에서 꽤 오랜시간 페이지를 잡아둬야 하는 경우를 위한, 예를 들어
dma-to-dax vs truncate 문제를 위한, get_user_pages() 의 변종의 추가입니다.
실제 이를 사용하는 패치는 나중에 올라올 것 같군요.  


[PATCH 00/18] introduce a new tool, valid access checker
--------------------------------------------------------

https://lkml.kernel.org/r/1511855333-3570-1-git-send-email-iamjoonsoo.kim@lge.com

Valid access checker (Vchecker) 라는 이름의 새로운 메모리 에러 탐색 도구의
소개입니다.  Out of bound access, use after free 같은, 의도되지 않은 메모리
접근을 잡아낼 수 있게 해준다고 하는군요.  Kernel Address SANitizer (KASAN) 의
기능에 많이 의존하고 있기 때문에 KASAN 메인테이너 중 하나인 Dmitry 는 이게
별도의 도구로 머지되어야 할지 의문스럽다며 머지될 예정이면 한번 더 이야기
해달라고 하네요.


[PATCH v2 0/3] mm/cma: manage the memory of the CMA area by using the ZONE_MOVABLE
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/1512114786-5085-1-git-send-email-iamjoonsoo.kim@lge.com

CMA 를 위한 영역은 하나의 zone 내에 위치하게 되는데, 이 zone 내에 다양한 특성의
페이지들이 혼재되어있다보니 이런저런 문제가 생깁니다.  CMA 영역을 MOVABLE zone
만 쓰도록 함으로써 이 문제를 해결하는 패치입니다.


[PATCH tip/core/rcu 0/21] De-emphasize {smp_,}read_barrier_depends
------------------------------------------------------------------

https://lkml.kernel.org/r/20171201195053.GA23494@linux.vnet.ibm.com

RCU 패치는 일단 Paul 의 트리에 머지된 후, tip 트리로 머지되고 나서야 토발즈의
트리에 들어갑니다.  이번에도 tip 트리로 머지되기 위한 패치들이 올라왔습니다.
그중에서도 이 시리즈는 READ_ONCE() 에 들어간 smp_read_barrier_depends() 의
architecture independent 한 코드로부터의 제거를 담고 있습니다.
