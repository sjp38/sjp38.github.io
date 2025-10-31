+++
title = "LKML News v5.3-rc2"
date = 2019-07-26T08:41:19+09:00
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

[PATCH v6 0/5] Introduce MADV_COLD and MADV_PAGEOUT
---------------------------------------------------

https://lkml.kernel.org/r/20190723062539.198697-1-minchan@kernel.org

어플리케이션의 메모리를 좀 더 적극적으로 reclaim 시킴으로써 반응성을 높이기
위한 패치셋의 일부를 따로 떼어낸, `MADV_COLD` 와 `MADV_PAGEOUT` 힌트를
`madvise()` 에 추가하는 패치의 여섯번째 버전입니다.

일곱번째 버전도 빠르게 올라왔군요:
https://lkml.kernel.org/r/20190726023435.214162-1-minchan@kernel.org
단순히 mmotm 최신 버전 위로 리베이스 한 것 같네요.


[PATCH v9 00/21] Generic page walk and ptdump
---------------------------------------------

https://lkml.kernel.org/r/20190722154210.42799-1-steven.price@arm.com

x86 과 arm64 가 범용적 페이지 테이블 워킹을 하도록 했던 해치셋을 조금 더 확장한
버전입니다.  기존 대비 페이지 테이블 덤프 기능도 일반화 시킨게 차이군요.


[PATCH v1 1/2] mm/page_idle: Add support for per-pid page_idle using virtual indexing
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20190722213205.140845-1-joel@joelfernandes.org

리눅스 커널은 `page_idle` 이라는 인터페이스를 통해 특정 페이지의 액세스 여부를
파악할 수 있게 합니다.  저도 이걸 통해서 wss 를 재거나 하는데 쓸 수 있는
[도구](https://github.com/sjp38/idle_page_tracking)를 만들었었죠.

문제는 이 인터페이스는 쓰기가 조금 복잡합니다.  PFN 을 가지고 페이지를 지목할
수 있게 되어 있기 때문에 특정 프로세스의 데이터 액세스를 추적하려면 해당
프로세스가 사용하고 있는 가상 메모리가 어떤 PFN 으로 매핑되어 있는지 알아야
하기 때문이죠.  달리 말하면 `page_idle` 인터페이스가 글로벌하기 때문에 생기는
문제입니다.

이 패치셋은 `/proc/<pid>/page_idle` 파일을 생성하고 이를 통해 프로세스 단위로
virtual page frame number (VFN) 을 통해 페이지 트랙킹을 할 수 있게 합니다.
이로써 이 인터페이스를 사용하는 유저스페이스 도구의 코드가 간단해질 뿐더러 보안
이슈도 좀 더 편리해지죠.  구글에선 내부적으로 이를 통해 heap profiler
(heapprofd) 를 좀 더 쉽게 만들었나보군요.


[PATCH RFC] mm/page_idle: simple idle page tracking for virtual memory
----------------------------------------------------------------------

https://lkml.kernel.org/r/156388286599.2859.5353604441686895041.stgit@buzz

앞에서 소개한 패치와 비슷하게 `page_idle` 을 간편화 시키는 패치셋입니다.  특정
pid 의 모든 mapped page frame 의 access bit 을 한번에 clear 할 수 있게 합니다.
인터페이스는 `echo 6 > /proc/<pid>/clear_refs` 같은 형태군요.  이후,
`/proc/<pid>/smaps` 파일을 이용해 현재 idle 한 페이지들의 갯수를 알 수
있습니다.


Linux 5.3-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wiiKRJprQDJqJzdcjdaGs73UtVPTM2+jOHWdMgu5Sp2HQ@mail.gmail.com

두번째 rc 버전이 예정대로 나왔습니다.  변경사항이 많은 머지윈도우였던 만큼 rc2
도 꽤 수정사항이 많은 것 같습니다.  전체적으로 문서, arch 코드, 그리고 드라이버
쪽 수정사항이 대부분인 듯 하군요.

앞선 rc1 릴리즈부터 이번 릴리즈 사이의 변경 사항의 시각화 비디오를 아래
링크에서 볼 수 있습니다:
https://youtu.be/yxtq3-lhebQ
