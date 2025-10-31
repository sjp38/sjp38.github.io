+++
date = 2018-04-02T07:13:40+09:00
draft = false
title = "LKML News after v4.16"
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


Linux 4.16
----------

https://lkml.kernel.org/r/CA+55aFyxn0bu5jOAJvO_63GHaGMkJ0uA=bVBm2T3HVX9SimZzw@mail.gmail.com

릴리즈 마지막 주 치고는 네트워킹 쪽에 조금 변경사항이 있었습니다만, 큰 문제가
될 정도는 아니었습니다.  결과, 4.16이 드디어 릴리즈 되었습니다!  동시에 4.17
머지 윈도우가 시작되는군요.


[PATCH 0/2] Move kfree_rcu out of rcu code and use kfree_bulk
-------------------------------------------------------------

https://lkml.kernel.org/r/1522647064-27167-1-git-send-email-rao.shoaib@oracle.com

kfree_rcu() 대신 kfree_bulk() 라는 새로 만들어진, 더 효율적인 기능을 사용하도록
하는 패치입니다.


[RFC PATCH 0/1] mm: Support multiple kswapd threads per node
------------------------------------------------------------

https://lkml.kernel.org/r/1522661062-39745-1-git-send-email-buddy.lumpkin@oracle.com

NUMA 아키텍쳐에서 리눅스 커널은 NUMA 노드당 하나의 kswapd 쓰레드를 띄웁니다.
노드당 kswapd 쓰레드 수를 늘려 성능을 높이려는 쓰레드입니다.  결국은 이런
움직임이 있어야 할거라고 봅니다만, 당장 이 패치에 대해서는 수정 요청 의견도 꽤
있군요.


[RFC] Group struct page elements
--------------------------------

https://lkml.kernel.org/r/20180408142334.GA29357@bombadil.infradead.org

커널에서 페이지를 관리하는 구조체인 `struct page` 는 매우 복잡한 구조로
되어있고, 페이지가 어떤 목적으로 쓰이느냐에 따라 같은 필드가 다른 목적으로
쓰이기도 합니다.
이 RFC 패치는 이 혼란스러운 구조를 좀 개선해 보려는 시도를 담고 있습니다.


[PATCH 1/2] slab: `__GFP_ZERO` is incompatible with a constructor
-----------------------------------------------------------------

https://lkml.kernel.org/r/20180410125351.15837-1-willy@infradead.org

시작은 김민찬 님의 null pointer dereference 문제에 대한 수정을 담은
패치셋이었습니다
(https://lkml.kernel.org/r/20180409015815.235943-1-minchan@kernel.org).
이걸 Matthew 는 근본적인 실수가 있었던 것 같다고 보고 이 패치셋을 내놓았습니다.
메모리 할당 요청에 `__GFP_ZERO` 플래그를 넣으면 메모리 영역을 0으로 초기화 해서
할당을 해줍니다.  그런데 constructor 가 있다면 초기화 작업을 constructor 에서
해야 하기에 `__GFP_ZERO` 플래그를 여기에 넣는건 뭔가 이상하죠.
이 패치셋은 그런 경우는 모두 실수에 의한 것이라 보고 경고를 표시해 주도록
합니다.


[RFC tip/locking/lockdep v6 20/20] lockdep/selftest: Add a test case for SRCU
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20180411135721.22723-1-boqun.feng@gmail.com

리눅스 커널의 락킹 관련 문제 추적 기능인 `lockdep` 이 SRCU 를 지원하게 하는
패치와 함께 올라온 패치입니다.
`lockdep` 을 위한 selftest 에 SRCU 기능 역시 테스트하도록 테스트를
추가했습니다.
