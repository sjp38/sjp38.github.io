+++
title = "LKML News by v4.20-rc1"
date = 2018-11-07T14:43:56+09:00
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

리눅스 4.19 버전 릴리즈 후부터 4.20-rc1 버전의 릴리즈까지 LKML 에 오간 메일 중
흥미로운 메일들을 소개합니다.


[RFC PATCH v4 00/13] ktask: multithread CPU-intensive kernel work
-----------------------------------------------------------------

https://lkml.kernel.org/r/20181105165558.11698-1-daniel.m.jordan@oracle.com

CPU intensive 한 커널의 일을 여러 work queue 를 이용해 병렬화 시키기 위한
새로운 프레임웍, ktask 구현 및 적용 패치입니다.  이 프레임웍을 이용해 병렬화
시킬 일은 여러가지가 있을텐데, 이 패치는 ktask 프레임웍의 구현과 함께 VFIO
페이지 pinning, 부팅 시점에서의 `struct page` 초기화, `gigantic page` 의
초기화, 그리고 `HugeTLB` 페이지의 할당에 ktask 를 적용하고 있습니다.

예전에도 올라온 패치인데 이번에 Linux Plumbers Conference 에서 발표할
예정이기에 기존 피드백을 반영한 버전을 올렸군요.


[PATCH 0/9] Allow persistent memory to be used like normal RAM
--------------------------------------------------------------

https://lkml.kernel.org/r/20181022201317.8558C1D8@viggo.jf.intel.com

기존의 메인 메모리로 쓰이는 DRAM 과 달리 파워가 꺼져도 내용이 날아가지 않는
메모리를 Non-volatile memory 또는 persistent memory 라 하죠.  최근 들어서는
정말 상용으로도 나오고 있는데, 현재로썬 이 pmem 을 쓰려면 어플리케이션을 고쳐야
합니다.

이 패치는 그러지 않고도 일반 RAM 처럼 pmem 을 사용할 수 있도록 하는 pmem 용
드라이버를 구현했습니다.


[GIT PULL] XArray for 4.20
--------------------------

https://lkml.kernel.org/r/20181023200825.GA25444@bombadil.infradead.org

이 블로그에서도 여러번 소개한, XArray 의 4.20 버전을 향한 pull request 입니다.
4.19 때도 시도했지만 들어가지 못했죠.

이번엔 일단 토발즈에 의해 pull 되었습니다.  그리고 토발즈도 XArray 의
인터페이스 덕에 코드가 한결 간결하고 깔끔해졌음을 이야기 하네요.  특히, dax 쪽
수정사항과 conflict 이 있었는데 이는 dax 쪽의 버그 수정에 의한 것으로, XArray
인터페이스를 쓰면 애초에 그 버그가 발생도 안한다고 합니다.


Linux 4.20-rc1
--------------

``https://lkml.kernel.org/r/CAHk-=whDiwASMgw8Q7TNA2MJhf3s=ouK4+_3ioqmobs-yagnkQ@mail.gmail.com``

오랫만에 토발즈가 하는 릴리즈입니다.  3.19 다음 4.0 버전이 릴리즈 되었으니 이번
버전은 5.0 이 될 것인지, 4.20 이 될 것인지 흥미진진한 릴리즈였는데요.
결론적으로 4.20 이 되었습니다.  이제 버전을 셀 손가락도 발가락도 남지
않았으므로 다음 버전은 5.0 이 될 거라고 하는군요.

꽤 많은 변경 사항이 있던 머지 윈도우였지만 그렇다고 기록적인 수준은 아닙니다.

한편 2주일로 예정되는 머지 윈도우에서 첫번째 주에는 일반적인 풀리퀘스트를 받고,
좀 시간을 두고 들여다봐야 하겠다 싶은 패치들은 두번째 주까지 미뤄뒀다 천천히
보면서 머지하는게 토발즈의 작업 습관이고 다른 메인테이너들도 이 습관을 알고
암묵적으로 지켜왔던 모양인데, 이번엔 두번째 주 수요일에 새로운 풀 리퀘스트가
들어와 토발즈가 조금 불편했던 모양입니다.

이걸 명시적인 규칙으로 만들어야 할지도 모르겠다 싶기 시작했는데, 빈번하게 있는
일도 아니므로 아직은 그래야 할 필요성이 있을지도 모르겠다 하는 수준의
이야기군요.

그리고 이번 머지 윈도우에서는 Greg 이 그랬던 것처럼 토발즈도 풀리퀘스트에 ack
메일을 보냈었죠.  이런 작업 방식에 대해서 고민을 하는 이야기도 있었구요.
하지만 아무래도 몇개는 빼먹은 것 같다고 하는군요.  이런 경우 결론은 자동화.
다음 머지 윈도우까지는 이 ack 메일을 자동화 되길 바란다고 하네요.  물론,
토발즈의 바람대로 자동화가 잘 마무리 되지 않으면 운좋게도 토발즈로부터의 ack
메일을 받을 수 있겠습니다.
