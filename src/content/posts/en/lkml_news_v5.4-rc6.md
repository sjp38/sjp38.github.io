+++
title = "LKML News v5.4-rc6"
date = 2019-11-02T09:24:21+01:00
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

[PATCH V8] mm/debug: Add tests validating architecture page table helpers
-------------------------------------------------------------------------

https://lkml.kernel.org/r/1572240562-23630-1-git-send-email-anshuman.khandual@arm.com

아키텍쳐별 페이지 테이블 헬퍼 등을 테스트 하는 코드를 추가하는 패치입니다.
``CONFIG_DEBUG_VM_PGTABLE`` 컨피규레이션이 켜져 있으면 동작합니다.


[PATCH RFC v2 00/25] Add KernelMemorySanitizer infrastructure
-------------------------------------------------------------

https://lkml.kernel.org/r/20191030142237.249532-1-glider@google.com

초기화 되지 않은 메모리 영역에 액세스 하는 에러를 찾아주는 KMSAN 을 커널에
추가하는 패치입니다.
KCSAN 과 비슷하게 syzkaller 를 통해 돌아가게끔 되어 있군요.

False positive 문제가 존재할 수는 있는 모양입니다만, 구글 내부에서 syzbot 을
통해 테스트 한 환경에서는 중요한 false positive 는 나오지 않은 모양입니다.
구글 외부에서는 또 모른다는 거죠.

요즘 커널 개발 프로세스를 개선하자는 이야기가 있고, 그 중에는 패치의 히스토리를
알고 싶다는 이야기가 많죠.
그래서인지 이 메일은 구글 내부 리뷰 시스템인 Gerrit 으로의 링크를 포함시켰네요.


[RFC v2] mm: Proactive compaction
---------------------------------

https://lkml.kernel.org/r/20191031005127.8037-1-nigupta@nvidia.com

Huge page 할당을 위해선 연속된 메모리 할당이 필요합니다.
Fragmentation 이 심한 시스템에선 이 할당이 어렵죠.
리눅스는 그래서 compaction 기법을 사용하는데요, 이걸 좀 더 적극적으로 하자는
패치입니다.
이를 통해 latency 가 개선될 수 있죠.

단순히 hugepage 를 최대한, compaction 을 요청해가며 할당받는 드라이버를 통해 성능을 테스트 했군요.
80th percentile latency 까지는 몇십배 넘게 할당 응답시간을 줄였는데, 90th
percentile 부턴 별 차이 없군요.


[RFC 00/10] autonuma: Optimize memory placement in memory tiering system
------------------------------------------------------------------------

https://lkml.kernel.org/r/20191101075727.26683-1-ying.huang@intel.com

DRAM 과 PMEM 등으로 구성되어 PMEM 을 NUMA node 로 간주하는 multi-tiering memory
system 을 염두에 두고 hot page / cold page 를 구분할 수 있게 해주는
패치셋입니다.


Linux 5.4-rc6
-------------

https://lkml.kernel.org/r/CAHk-=wg+8=w=sEx9WBF0OJj0SumQ4p-LuP8waRH=TSdAYDeqGg@mail.gmail.com

OSSEU 가 종료되고 토발즈는 집에 잘 도착했고, 시차 적응도 큰 문제는 없었기에
평소대로의 타이밍에 릴리즈가 가능했다고 합니다.
지난 rc5 도 큰 크기였고, rc6 는 이제 슬슬 변경사항이 줄어들어야 할, 토발즈
말로는 그러길 바라는 시점인데, 그렇지 못했습니다.
네트워킹 쪽에서 시점을 맞추지 못한 뒤늦은 풀리퀘스트들이 있었기 때문인데, 딱히
급작스런 문제가 있는 건 아니라는군요.
그렇다곤 해도 토발즈는 조금 찜찜한 모양입니다.
다음주까지 동향을 지켜봐야겠지만 다음주까지도 충분히 변경사항이 줄어들지
않는다면 rc8 까지 가야할 수도 있겠다고 합니다.
