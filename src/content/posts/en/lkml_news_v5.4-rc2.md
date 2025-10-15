+++
title = "LKML News v5.4-rc2"
date = 2019-10-05T11:46:07+02:00
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

[PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit testing framework
---------------------------------------------------------------------------------

https://lkml.kernel.org/r/20190923090249.127984-1-brendanhiggins@google.com

어떻게 보면 별거 아닌 이유로 5.4 머지윈도우에서 튕겨나가고 만 kunit.
요청받은대로 파일 위치를 하위 디렉토리로 변경한 kunit 새 버전의 패치셋이
올라왔습니다.
'kunit/' 디렉토리와 kunit 을 위한 'Kconfig' 파일을 'lib/' 아래로 옮겼군요.

이후 벌어진 대화가 재미있는데요, 토발즈는 이걸 5.5에 넣을 예정인데, 가능하면
그동안 실제 테스트 코드도 추가되면 좋겠다고 했습니다.
근데 테스트 프레임웍이 머지안되었는데 테스트 코드를?  메인테이너 간에 일이
복잡해지고 컨플릭 날 확률이 높아지니 이걸로 꽤 많은 이야기가 있었습니다.


[PATCH v2] perf script python: integrate page reclaim analyze script
--------------------------------------------------------------------

https://lkml.kernel.org/r/1569899984-16272-1-git-send-email-laoar.shao@gmail.com

Page reclaim 을 좀더 잘 분석하기 위한 perf script 를 추가하는 패치셋의 두번째
버전입니다.
첫번째 버전은 이 블로그에서도 소개한 바 있죠.
첫번째 버전 이후로의 변화 중 눈에 띄는 건 파이썬 2.7 과 3.6 에서 모두
돌아가게끔 한 것이군요.


[PATCH v5 00/11] Introduces new count-based method for tracking lockless pagetable walks
----------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20191003013325.2614-1-leonardo@linux.ibm.com

THP promotion/demotion 과 동시에 page table 조작이 일어나는 걸 막기 위해
존재하는 `serialize_against_pte_lookup()` 함수로 인해 발생하는 `munmap()`
레이턴시 문제를 동시의 page table walk 존재 여부를 카운트 기반으로 추적해,
필요없을 땐 락을 잡지 않게 함으로써 레이턴시를 놀랍게 개선한 패치셋의 다섯번째
버전입니다.
이 블로그에서도 소개했죠.
지난 버전 이후로 인터럽트 처리 부분을 포함한 일부 부분이 조금 수정되었군요.


[PATCH] mm: export cma alloc and release
----------------------------------------

https://lkml.kernel.org/r/20191002212257.196849-1-salyzyn@android.com

`cma_alloc()` 과 `cma_release()` 함수를 드라이버에서도 쓸 수 있게 export 해주는
패치셋입니다.
안드로이드 ION 이라던지 RDMA, Camera 모듈들이 이에 의존적이어서 드라이버 레벨로
빌드가 안되기 때문에 이런 변경을 제안했다네요.


Linux 5.4-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wiNT4Yk+36OXMyPuesrU88cFyDG_XnjRiKwaac09PJpQw@mail.gmail.com

다시 일요일 오후 릴리즈로 돌아왔습니다.
큰 변화는 없고 그저 소소한 수정 사항들 뿐이었다는군요.
일반적으로 진짜 regression 에 대한 파악이 이루어지고 그에 대한 수정이
시작되는건 rc2 후라는 걸 감안하면 매우 평범한 릴리즈라고 합니다.
