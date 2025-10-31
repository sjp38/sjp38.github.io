+++
title = "LKML News v5.1-rc7"
date = 2019-04-26T11:02:24+09:00
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

Re: [LSF/MM] Preliminary agenda ? Anyone ... anyone ? Bueller ?
---------------------------------------------------------------

https://lkml.kernel.org/r/83fda245-849a-70cc-dde0-5c451938ee97@kernel.dk

올해의 LSFMM 스케쥴이 구글 문서로 공유되고 있었군요:
https://docs.google.com/spreadsheets/d/1Z1pDL-XeUT1ZwMWrBL8T8q3vtSqZpLPgF3Bzu_jejfk/edit#gid=0


[LSF/MM TOPIC] Proactive Memory Reclaim
----------------------------------------

``https://lkml.kernel.org/r/CALvZod4V+56pZbPkFDYO3+60Xr0_ZjiSgrfJKs_=Bd4AjdvFzA@mail.gmail.com``

이제 LSFMM 이 얼마 안남았습니다만, 또하나의 주제 제안이 올라왔습니다.

메모리 오버커밋으로 인해 direct reclaim 이 발생하고, 이는 latency sensitive
어플리케이션의 latency 를 크게 저하시키니, 시스템이 좀 더 적극적으로 memory
reclaim 을 해서 direct reclaim 을 최소화 시켜보자는 건데요.  잘 접근되지 않는
cold memory 를 추적해서 미리미리 reclaim 시키자는 겁니다.  챌린지는 물론 cold
memory 를 어떻게 잘 추적하냐는 거지요.  이와 함께 커널의 `idle_page_tracking`
의 비효율성도 이야기 했습니다.

이 주제로 올해 ASPLOS 에 논문도 냈군요: https://youtu.be/aKddds6jn1s
개인적으로 최근 연구하고 있는 주제와도 관계 있을 수 있어서 흥미롭습니다.


[PATCH] docs/vm: add documentation of memory models
---------------------------------------------------

https://lkml.kernel.org/r/1556101715-31966-1-git-send-email-rppt@linux.ibm.com

FLAT, DISCONTIG, SPARSE 등의 다양한 메모리 모델에 대한 문서화 추가 패치입니다.
처음 코드 들여다 볼 때 조금 헷갈리던 부분인데 잘 설명되었군요.


[LSF/MM TOPIC] Lightning round?
-------------------------------

https://lkml.kernel.org/r/20190425211906.GH4739@mit.edu

이번 LSFMM 에는 라이트닝 토크 세션이 있는데요, 거기서 block layer 에 암호화
레이어를 추가하는 방안에 대해 이야기 해보자는 Ted 의 의견입니다.  안드로이드
쪽에서 이걸 열심히 해보고 있나보군요.


[PATCH 0/4] tools/vm/slabinfo: Add fragmentation output
-------------------------------------------------------

https://lkml.kernel.org/r/20190426022622.4089-1-tobin@kernel.org

SLAB vs SLUB 토론 중 현재 slab allocator 의 fragmentation 정도를 알려주는
도구가 있으면 좋겠다는 이야기가 있었는데, 이를 위한 기능을 추가한 패치입니다.


Linux 5.1-rc7
-------------

https://lkml.kernel.org/r/CAHk-=whvWQbP20g77U4QRXQDS5w+kf=V-P2QjMkgA-OwJJjHtg@mail.gmail.com

지난번 rc6 가 거대했던 건 역시 풀 리퀘스트 타이밍 때문이었는지, 이번 rc7 은
다행히도 크기가 작은 편이라고 합니다.  네트워킹 쪽 변경이 좀 있고, 나머진
평소같이 아키텍쳐, 파일 시스템, 그외 드라이버 등의 변경이 내용을 차지했네요.
따라서 다음주엔 5.1이 예정대로 나올 것 같다고 합니다!
