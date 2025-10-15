+++
bigimg = ""
date = "2017-12-24T14:24:13+09:00"
subtitle = ""
title = "LKML News after v4.15-rc5"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc5
--------------

https://lkml.kernel.org/r/CA+55aFy1U+uBLEAoCWU3=BqEbROW6rsbaHUdYJArR6iYQQWo_A@mail.gmail.com

4.15 의 다섯번째 rc 버전이 평소 스케쥴보다 하루 일찍 릴리즈 되었습니다.
원래대로라면 내일일텐데, 미국 시간으로는 크리스마스 이브라서 그냥 오늘 릴리즈
한다는군요.

이번 rc5 의 변경 사항들도 지난 릴리즈의 rc5 와 비슷했다고 하는데, 다만 x86 의
커널 페이지 테이블 격리화 관련 작업이 진행 중인 게 좀 예외라고 하는군요.


[RFC v3 PATCH 0/5] Eliminate zone->lock contention for will-it-scale/page_fault1 and parallel free
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20180509085450.3524-1-aaron.lu@intel.com

패치셋 저자는 112개 CPU를 갖는 Intel Skylake 서버에서 will-it-scale/page_fult1
워크로드를 돌려보았고 80% CPU 가 zone->lock 에서 스핀하며 시간을 보내고 있음을
파악했습니다.  이 문제를 해결하기 위한 RFC 패치의 세번째 버전입니다.


[PATCH v4 00/13] Improve shrink_slab() scalability (old complexity was O(n^2), new is O(n))
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/152586686544.3048.15776787801312398314.stgit@localhost.localdomain

`shrink_slab()` 의 복잡도가 O(n^2) 이기 때문에 많은 shrinker 와 메모리 cgroups
를 갖는 기계에서는 확장성의 병목이 될 수 있습니다.  이를 간단한 스크립트로
보이는데요.  먼저 다음과 같이 4000개의 memory cgroup 들을 만들고,
```
$echo 1 > /sys/fs/cgroup/memory/memory.use_hierarchy
$mkdir /sys/fs/cgroup/memory/ct
$echo 4000M > /sys/fs/cgroup/memory/ct/memory.kmem.limit_in_bytes
$for i in `seq 0 4000`;
        do mkdir /sys/fs/cgroup/memory/ct/$i;
        echo $$ > /sys/fs/cgroup/memory/ct/$i/cgroup.procs;
        mkdir -p s/$i; mount -t tmpfs $i s/$i; touch s/$i/file;
done
```

아래와 같이 drop cache 를 다섯번 수행하며 여기 걸리는 시간을 측정했습니다:
```
$time echo 3 > /proc/sys/vm/drop_caches

0.00user 13.78system 0:13.78elapsed 99%CPU
0.00user 5.59system 0:05.60elapsed 99%CPU
0.00user 5.48system 0:05.48elapsed 99%CPU
0.00user 8.35system 0:08.35elapsed 99%CPU
0.00user 8.34system 0:08.35elapsed 99%CPU
```

반복해서 drop cache 를 할 뿐이기 때문에 뒤따르는 drop cache 들은 실질적으로
cache 를 비우진 않고 그저 shrinker 와 memcg 를 둘러볼 뿐입니다.  그럼에도 최소
5.48초가 걸렸군요.  그만큼 병목이 심하단 이야기죠.

패치는 shrink_slab() 의 복잡도를 O(n)으로 고쳤고, 이후 다음과 같이 오버헤드가 거의 사라지는 결과를 내놓았습니다:
```
0.00user 1.10system 0:01.10elapsed 99%CPU
0.00user 0.00system 0:00.01elapsed 64%CPU
0.00user 0.01system 0:00.01elapsed 82%CPU
0.00user 0.00system 0:00.01elapsed 64%CPU
0.00user 0.01system 0:00.01elapsed 82%CPU
```

약 548배의 성능 향상이군요!


[PATCH -mm -V2 00/21] mm, THP, swap: Swapout/swapin THP as a whole
------------------------------------------------------------------

https://lkml.kernel.org/r/20180509083846.14823-1-ying.huang@intel.com

지난번에도 소개한, THP 를 2 MiB 그대로 한번에 swap out / swap in 하는
패치입니다.  기존에는 THP 를 regular page 로 쪼개서 swap out / swap in
했었거든요.


[PATCH -mm] mm, THP, doc: Add document for thp_swpout/thp_swpout_fallback
-------------------------------------------------------------------------

https:/lkml.kernel.org/r/20180509082341.13953-1-ying.huang@intel.com

앞에 설명한 THP swap 관련 최적화는 단계별로 적용되고 있는데, 그와 함께
`/proc/vmstat` 에는 `thp_swpout` 과 `thp_swpout_fallback` 필드가
추가되었습니다.  그에 대한 문서화가 아직 안들어와 있었는데, 이를 추가하는
패치입니다.
