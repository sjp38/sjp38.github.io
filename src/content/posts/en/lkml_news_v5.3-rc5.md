+++
title = "LKML News v5.3-rc5"
date = 2019-08-19T14:19:58+09:00
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

[RFC PATCH 0/2] Add predictive memory reclamation and compaction
----------------------------------------------------------------

https://lkml.kernel.org/r/20190813014012.30232-1-khalid.aziz@oracle.com

커널의 page reclamation 과 compaction 등은 기본적으로 시스템 메모리 잔여량이
부족할 때 시작됩니다.  하지만 이땐 이미 때가 늦었습니다.  reclamation 과
compaction 을 열심히 하긴 하지만 어플리케이션은 이미 메모리 부족으로 인한
응답시간 폭증 등을 겪게 됩니다.

이 패치셋은 시스템의 메모리 부족을 미리 예측하고 reclamation 과 compaction 을
시작하기 위한 패치셋입니다.  시간축에 따라 메모리 사용량 변화 추세를 보면 이걸
예측할 수 있지 않겠냐는 것이죠.

이 패치셋은 이런 아이디어에 기반해 시스템의 메모리 부족을 예측하고 kswapd 를
깨울지 재울지를 결정합니다.  간단한 dd 기반의 테스트를 통해 그 성능을 측정한
결과도 있습니다.


[PATCH] kbuild: Change fallthrough comments to attributes
---------------------------------------------------------

https://lkml.kernel.org/r/20190812214711.83710-1-nhuck@google.com

C 언의 `switch` 구문의 fall-through 기능은 복잡한 기능을 구현하기 좋긴 한데
암묵적으로 이루어지는 fall-through 를 방지하기 위해 `break;` 를 추가하는 걸
깜박하곤 하는 경우가 많습니다.  GCC 는 주석으로 이 부분은 fall-through 가 맞다,
라는걸 지정할 수 있게 하고 이 주석이 없는 경우는 모두 fall-through 를
막아버림으로써 `switch` 의 명시적 fall-through 기능이 가능하게 합니다.

리눅스 커널 역시 이런 방식으로 암묵적 fall-through 에 의한 버그를 극복하려
노력하는데요, clang 은 이걸 주석 형태가 아니라 attribute 형태로 지원합니다.  이
패치는 이런 차이를 어드레스 하기 위한 패치입니다.


[RFC] mm: Proactive compaction
-------------------------------

https://lkml.kernel.org/r/20190816214413.15006-1-nigupta@nvidia.com

Huge page 등의 할당 시간은 fragmentation 이 심한 메모리에선 길어지거나 아예
실패할 수 있죠.  Huge page 에 성능이 의존적인 어플리케이션에겐 큰 문제입니다.

이 패치는 page order 별 fragmentation threshold 를 두고 이에 맞춰 page order
별로 다른 compaction 을 수행하자는 겁니다.


Linux 5.3-rc5
-------------

https://lkml.kernel.org/r/CAHk-=wiO5-puMa30fCwtgze57MH2JOzedVcEVotEviYmmQNihQ@mail.gmail.com

다섯번째 rc 릴리즈입니다.  노드 로컬 할당 대 huge page 할당 관련 커밋 일부가
리버트 시키지 않는 등의 몇가지 문제를 제외하면 조용한 릴리즈 주간이었다는군요.
잘 안정화 되어가고 있다는 증거겠지요.
