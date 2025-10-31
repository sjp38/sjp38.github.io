+++
title = "LKML News v5.1-rc2"
date = 2019-03-19T12:11:11+09:00
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

[PATCH v5 00/19] Convert x86 & arm64 to use generic page walk
-------------------------------------------------------------

https://lkml.kernel.org/r/20190321141953.31960-1-steven.price@arm.com

커널이 `walk_page_range()` 함수를 제공하긴 하지만 이 함수는 커널에 의해
사용되는 페이지 테이블은 볼수가 없기 때문에 각 아키텍쳐별로 페이지 테이블
순회를 위한 기능을 별도로 만들어 사용하고 있습니다.

이 패치셋은 `walk_page_range()` 가 커널의 페이지 테이블을 만질 수 있도록
확장함으로써 그런 불필요한 아키텍쳐별 파편화를 줄이려 합니다.


[PATCH v6 0/7] psi: pressure stall monitors v6
----------------------------------------------

https://lkml.kernel.org/r/20190319235619.260832-1-surenb@google.com

시스템이 어떤 부분의 pressure 를 받는지 쉽게 확인하기 위한 pressure stall
monitor 구현 패치의 여섯 번째 버전입니다.  안드로이드는 이미 이 기능을 적용해서
모바일 기기의 메모리 부족 문제를 해결하고 있다는군요.

파일 기반의 기존 인터페이스는 자주 들여다보면 오버헤드가 있기 때문에 유저가
`poll()` 할 수 있는 형태로 인터페이스를 개선한 것 같습니다.

이 패치 기반으로 안드로이드의 low memory killer daemon 을 개선했고, 결과 false
positive memory pressure 를 vmpressure signal 대비 약 10배까지 줄일 수 있었다고
합니다.


[PATCH 0/2] Remove support for deprecated %pf and %pF in vsprintf
-----------------------------------------------------------------

https://lkml.kernel.org/r/20190322132108.25501-1-sakari.ailus@linux.intel.com

함수 포인터의 프린트를 위해 사용되는 프린트 포맷 지시어인 %pf 와 %pF 를 거의
같은 일을 하면서 ia64, ppc64, parisc64 아키텍쳐에선 좀 더 많은 일을 해주는 $ps
와 %pS 로 대체하는 패치입니다.


[RFC PATCH 0/10] Another Approach to Use PMEM as NUMA Node
----------------------------------------------------------

https://lkml.kernel.org/r/1553316275-21985-1-git-send-email-yang.shi@linux.alibaba.com

앞서 이 블로그에서도 소개한 바 있는 PMEM 을 매우 느린 NUMA node 로 쓰는 패치가
머지되었습니다.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c221c0b0308fd01d9fb33a16f64d2fd95f8830a4

그럼 이렇게 평범한 NUMA node 로 인식되는 PMEM 을 어떻게 잘 쓸 것인가? 하는
문제가 남아있는데, 이 패치셋은 이를 위한 패치입니다.

기본적으로 DRAM 을 먼저 쓰게 만들고, 사용자가 기존의 방식대로 명시적으로 NUMA
인터페이스를 사용해 PMEM 을 요청하면 할당해 줍니다.  그리고, 자주 접근되는
페이지는 vma 단위로 조사해서 DRAM 으로 migrate 시킵니다.


Linux 5.1-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wgg_PRWs3a6u2gnFLQjhxOJcrFkqqWVnLw60eQAwD-DNw@mail.gmail.com

두번째 rc 입니다.  아직 rc 라고 하기엔 고칠 문제도 찾지 못한 상태라고 할 수
있겠지만요.  따라서 토발즈는 열심히 테스트 해달라고 하네요.

어쨌건 이번 릴리즈도 크게 특이한 사항은 없다고 합니다, 다만 이번 수정사항 중
2/3 가량이 tools/ 쪽에 집중되었다고 하네요.  perf 쪽의 변경 때문이라고 합니다.
