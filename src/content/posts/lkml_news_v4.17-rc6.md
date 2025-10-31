+++
title = "LKML News after v4.17-rc6"
date = 2018-05-21T10:19:16+09:00
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

Linux v4.17-rc6
---------------

`https://lkml.kernel.org/r/CA+55aFxxYQFL3mwsQcC+__R23ZmO8c3F0SThi6r44TdK0ePNDQ@mail.gmail.com`

여섯번째 release candidate 버전입니다.  이번 릴리즈에도 특기할 만한 일은
없었습니다.  이제 충분히 안정화 되었을 거라고 하는군요.


[PATCH -mm -V3 00/21] mm, THP, swap: Swapout/swapin THP in one piece
--------------------------------------------------------------------

https://lkml.kernel.org/r/20180523082625.6897-1-ying.huang@intel.com

이전에도 이 시리즈로 소개했던, THP 의 swap out 과 swap in 최적화 마지막 단계
패치의 세번째 버전입니다.  마지막 단계 이야기 하니 문득 인피니티워의 오역
논란이 떠오르는군요 ;)  두번째 버전 이후 특정 컨피규레이션에서의 빌드 버그를
수정했고, mmotm/master 브랜치의 5월 18일자 버전으로 rebase 한게 차이점의
전부군요.

RAM 으로 PMEM 을 시뮬레이션 하는 환경에서 vm-scalability 라는 벤치마크를 사용해
16개 프로세스가 anonymous page 를 상당량 할당받고 반복해서 접근하는 워크로드로
성능 차이를 비교했습니다.  이로 인해 패치 전 대비 워크로드 처리량 (throughput)
이 992.8% 향상되었습니다.


[PATCH v3 0/4] fixes, cleanups for rcu/dev
------------------------------------------

https://lkml.kernel.org/r/20180521044220.123933-1-joel@joelfernandes.org

RCU 코드의 주석, 변수 사용, 변수 이름 등의 개선 패치셋입니다.


[RESEND PATCH V5 00/33] block: support multipage bvec
-----------------------------------------------------

https://lkml.kernel.org/r/20180525034621.31147-1-ming.lei@redhat.com

하나의 `struct bio_bvec` 이 물리적으로 연속적인 복수개의 페이지를 가질 수 있게
하는 패치입니다.  시스템의 메모리가 거대해지고 THP 등이 널리 쓰임에 따라 이런
변화가 필요했다는군요.


[PATCH -V2 -mm 0/4] mm, huge page: Copy target sub-page last when copy huge page
--------------------------------------------------------------------------------

https://lkml.kernel.org/r/20180524005851.4079-1-ying.huang@intel.com

Huge page 의 복사 시에는 source 와 destination page 각각에 접근을 해야 하므로,
2 MiB huge page 를 사용한다 가정하면 총 4 MiB 데이터 액세스가 필요합니다.
예컨대 Xeon E5 v3 2699 CPU 는 18개의 코어, 36개 쓰레드, 그리고 45 MiB Last
Level Cache 를 가지므로 코어별로는 2.5 MiB, 쓰레드별로는 1.25 MiB 의 Last Level
Cache 밖에 갖지 못하므로, 여기서 huge page 복사가 일어나면 자신의 Last Level
Cache 를 모조리 접근해서 데이터가 flooding 나고 이후 데이터 접근은 cache miss
가 날 수 있게 됩니다.

이 패치셋은 target huge page 의 sub-page 를 마지막에 복사하도록 복사 시의
데이터 접근 순서를 약간 바꿔서 대부분의 경우에는 캐시 미스를 좀 더 줄일 수
있도록 했습니다.

vm-scalability 의 anon-cow-seq 테스트 케이스를 2 socket Xeon E5 v3 2699
시스템에서 돌려본 결과, 약 16.6% 까지의 성능 향상이 있었다고 합니다.
