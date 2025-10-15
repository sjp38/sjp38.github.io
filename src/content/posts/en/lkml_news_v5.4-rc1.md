+++
title = "LKML News v5.4-rc1"
date = 2019-09-21T10:00:48+02:00
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

[PATCH 0/2] introduce new perf-script page-reclaim
--------------------------------------------------

https://lkml.kernel.org/r/1568817522-8754-1-git-send-email-laoar.shao@gmail.com

Page reclaim 관련 성능 메트릭을 분석하기 위한 perf script 커맨드를 추가하는
패치입니다.  Direct reclaim 으로 인한 응답시간 폭증, page reclaim 이 왜
일어났는지, page reclaim 의 효과는 어땠는지 등을 알 수 있다는군요.

구체적으로는 direct reclaim 이 몇번 일어났는지, 그 latency 분포는 어땠는지,
file / anon page 별로 reclaim, scan, sync write, async write 이 몇번
일어났는지, kswapd 는 몇번 일어났는지, kswapd latency 는 어땠는지 등등을
보입니다.

```
    $ perf script report page-reclaim
    Direct reclaims: 4924
    Direct latency (ms)        total         max         avg         min
                          177823.211    6378.977      36.114       0.051
    Direct file reclaimed 22920
    Direct file scanned 28306
    Direct file sync write I/O 0
    Direct file async write I/O 0
    Direct anon reclaimed 212567
    Direct anon scanned 1446854
    Direct anon sync write I/O 0
    Direct anon async write I/O 278325
    Direct order      0     1     3
                   4870    23    31
    Wake kswapd requests 716
    Wake order      0     1
                  715     1

    Kswapd reclaims: 9
    Kswapd latency (ms)        total         max         avg         min
                           86353.046   42128.816    9594.783     120.736
    Kswapd file reclaimed 366461
    Kswapd file scanned 369554
    Kswapd file sync write I/O 0
    Kswapd file async write I/O 0
    Kswapd anon reclaimed 362594
    Kswapd anon scanned 693938
    Kswapd anon sync write I/O 0
    Kswapd anon async write I/O 330663
    Kswapd order      0     1     3
                      3     1     5
    Kswapd re-wakes 705

    Per process latency (ms):
         pid[comm]             total         max         avg         min
               timestamp  latency(ns)
           1[systemd]        276.764     248.933       21.29       0.293
           3406860552338: 16819800
           3406877381650: 5532855
           3407458799399: 929517
           3407459796042: 916682
           3407460763220: 418989
           3407461250236: 332355
           3407461637534: 401731
           3407462092234: 449219
           3407462605855: 292857
           3407462952343: 372700
           3407463364947: 414880
           3407463829547: 949162
           3407464813883: 248933444
         163[kswapd0]      86353.046   42128.816    9594.783     120.736
           3357637025977: 1026962745
           3358915619888: 41268642175
           3400239664127: 42128816204
           3443784780373: 679641989
           3444847948969: 120735792
           3445001978784: 342713657
           ...
```


[GIT PULL] Kselftest update for Linux 5.4-rc1
---------------------------------------------

https://lkml.kernel.org/r/be8059f4-8e8f-cd18-0978-a9c861f6396b@linuxfoundation.org

이블로그에서도 여러차례 소개했던 kunit 은 제가 오랫동안 메인라인에 머지되기를
기다려 왔던 기능입니다.
이번 kernel summit 에서 발표한 제 damon 이란 프로젝트도 kunit 을 이용해 test
driven development 기법을 적용했고, 그 효과를 톡톡히 봤죠.
이 패치셋이 4.9에 들어갈 예정이었고, Shuah Kahn 이 이번 머지 윈도우에
풀리퀘스트에 이 패치셋을 포함해 보냈는데요.
토발즈가 바로 퉤에엣 을 시전했습니다.

이유가 재미있습니다, kunit 패치는 리눅스 소스코드 루트 디렉토리에 ``kunit/``
디렉토리를 추가하는데, 이게 토발즈 마음에 들지 않았습니다.
토발즈의 tab 키를 활용한 자동완성 기능을 부셨기 때문이죠.
``kernel/`` 디렉토리로 이용하기 위해 `k` 만 타이핑 하고 탭키를 누르면 되었는데,
이제 ``kunit/`` 디렉토리 때문에 이게 안되는 거죠.

생각하기에 따라선 좀 억지 아니냐고 생각할 수 있고 저도 kunit 의 오랜 팬으로써
좀 아쉬운 마음이 있었는데요.
또 이제와서 생각해 보면 저도 ``kernel/`` 넘어가기 위해 한번 더 키보드에 손대야
하는게 좀 불쾌했던 거 같기도 하네요. ;)


[PATCH v4 00/11] Introduces new count-based method for monitoring lockless pagetable walks
------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20190927234008.11513-1-leonardo@linux.ibm.com

128개 vcpu 의 qemu 가 THP 로 매핑된 496 GiB 메모리 영역을 `munmap()` 완료하는데
무려 275초가 걸린다고 합니다.
그 원인은 `serialize_against_pte_lookup()` 함수였다고 하는군요.
이 함수는 `find_current_mm_pte()` 내에서의 `pmd_t` 에서 `pte_t` 로의 캐스팅
또는 lockless page table walk 이 THP promotion/demotion 과 동시에 이루어지지
않게끔 보호하는 용도로 사용됩니다.
그렇다면, 실제 lockless page table walk 이 없다면
`serialize_against_pte_lookup()` 은 호출될 필요가 없겠죠.

이를 위해 이 패치셋은 현재 수행되고 있는 `find_current_mm_pte()` 함수 갯수를
세고 그 갯수가 0이면 이 오버헤드가 되는 동시성 보호 코드를 생략하게 합니다.

이 패치를 적용한 후 앞의 문제시 되던 작업에 걸리는 시간이 275초에서 무려 418 ms
으로 줄었다는군요!


Linux 5.4-rc1
-------------

https://lkml.kernel.org/r/CAHk-=wgbGJ-SGeevEcgrThhPp+RwYOUUgWoZ3W27cbUpuB3VgA@mail.gmail.com

평소보다 하루 늦은 월요일에 5.4 머지윈도우가 닫히고 rc1 릴리즈가
이루어졌습니다.
좀 미뤄진 머지를 처리하느라 늦어져서 하루 늦은 릴리즈가 되긴 했지만 대수로운
일은 아니라는군요.

전체적인 릴리즈 내용도 평시와 크게 다른 내용은 없습니다.
AMD DRM 관련 변경이 많이 있지만 이는 하드웨어 구성에 따른 변화니까 무시하면
되고, 그걸 제외하고 보면 평소와 변경사항들의 분포도 비슷하다는군요.
