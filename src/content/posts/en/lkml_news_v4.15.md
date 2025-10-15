+++
title = "LKML News after v4.15"
date = 2018-01-29T09:20:38+09:00
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]
+++

Linux 4.15
----------

https://lkml.kernel.org/r/CA+55aFzARtx-nA=d1j7vLOLf4FHMJLyRiQ-PKkoexJuTUHogdw@mail.gmail.com

드디어 4.15 버전이 릴리즈 되었습니다.  지난 한주는 매우 조용하고 변경된 사항이
거의 없었다는군요.

이렇게 meltdown/spectre 로 시끄럽고 길었던, 평범하지 않았던 릴리즈 사이클이
끝났습니다.
하지만, meltdown/spectre 관련한 일이 아주 끝난 건 아니라고 이야기 하는군요.
특히, indirect bracnh mitigation 을 위한 가장 큰 수정사항을 반영받기 위해선
커널만 업데이트 해선 안되고 컴파일러의 "retpoline" 지원이 있어야 합니다.
```
cat /sys/devices/system/cpu/vulnerabilities/spectre_v2
```

로 컴파일러 지원이 있는지 알 수 있는데, 컴파일러 지원이 없다면
```
Vulnerable: Minimal generic ASM retpoline
```

이란 출력이 뜰겁니다.

한가지 더 이야기 해둬야 할건, 이번 릴리즈에 meltdown/spectre 가 많은 영향을
끼치긴 했지만 그래도 다른 부분들은 평범하게 업데이트가 진행되었다는 겁니다.
즉, 이번 릴리즈는 좀 평범하지 않기 했지만 그렇다고 아주 이상하기만 한 릴리즈도
아니었다는 거죠.

어쨌든 4.15 버전이 드디어 나왔습니다!


[LSF/MM TOPIC] Addressing mmap_sem contention
---------------------------------------------

https://lkml.kernel.org/r/4c20d397-1268-ca0f-4986-af59bb31022c@linux.vnet.ibm.com

리눅스 커널에서 메모리 매핑은 mmap_sem 이라는 reader-writer semaphor 를 이용해
race condition 으로부터 보호되고 있습니다.  당연하게도, 쓰레드가 많은 환경에선
여기 부하가 심하게 걸리고 성능 확장을 저해하게 됩니다.  Peter Zijlstra 의
Speculative Page Fault 패치는 페이지 폴트 시에 메모리 매핑을 할 때 mmap_sem 을
잡지 않고 매핑하려 시도해보고 중간에 동시에 같은 영역을 매핑하려 한 쓰레드가
존재하면 abort & retry 를 하는식으로 이 문제를 완화시킵니다.
해당 패치셋은 최근 Laurent 에 의해 다시 포팅되어 커뮤니티에 올라오기도 했죠.
실제로 ebizzy[1] 와 같이 쓰레드를 많이 쓰는 벤치마크에서는 두배가까이 성능
향상이 있었다고 하구요.

하지만 Speculative Page Fault 만으로는 모든 문제가 해결되지 않기에 mmap_sem
자체에 대한 논의를 LSFMM 에서 하고 싶다는 메일입니다.

병렬 프로그래밍에 관심있는 제게도 흥미로운 주제네요.


[1] http://ebizzy.sourceforge.net/


[LSF/MM TOPIC] lru_lock scalability
-----------------------------------

https://lkml.kernel.org/r/2a16be43-0757-d342-abfb-d4d043922da9@oracle.com

최근에 덜 사용된 (Least Recently Used) 페이지를 가려내기 위해 사용되는
`lru_lock` 은 메모리 집중적 벤치마크를 돌릴 때 커널에서 가장 뜨거워지는 락들
가운데 하나입니다.
당연히 확장성 문제가 있죠.

이걸 배칭 또는 페이지 개별적 락킹을 통해 해결해 보자는 안을 내놓고 이에 대해
LSFMM 에서 이야기 해보자는 메일입니다.

RFC 패치가 벌써 올라왔네요:
https://lkml.kernel.org/r/20180131230413.27653-1-daniel.m.jordan@oracle.com


[GIT PULL] RCU changes for v4.16
--------------------------------

https://lkml.kernel.org/r/20180129100051.ndq4osy45fz3g26a@gmail.com

From: Ingo Molnar <mingo@kernel.org>

4.16 머지 윈도우가 열렸으니 Ingo 가 4.16 을 위한 rcu 쪽 변경사항을 리누스에게
풀리퀘스트 보냈습니다.
사실 이건 별로 흥미로운 메일은 아닐 수 있지만, 4.16 에서 RCU 가 어떻게 변경될지
알 수 있겠죠.
그리고, 제가 작년 프라하와 상해에서 만들어 올렸던, 패치 9개가 있습니다 ;)


[RFC PATCH 00/64] mm: towards parallel address space operations
---------------------------------------------------------------

https://lkml.kernel.org/r/20180205012754.23615-1-dbueso@wotan.suse.de

'mmap_sem' 은 커널의 메모리 관리에서 자주 사용되는 락으로, 많은 scalability
문제의 중심에 있습니다.  이 패치셋은 mmap_sem 을 range locking 기법을 활용해서
바꿔냄으로써 병렬성을 확보하는 패치입니다.


[PATCH -mm -v2] mm, swap, frontswap: Fix THP swap if frontswap enabled
----------------------------------------------------------------------

https://lkml.kernel.org/r/20180207070035.30302-1-ying.huang@intel.com

zswap 은 THP 를 고려하지 않기 때문에 THP 가 켜진 상태에서 zswap 이 frontswap
으로 동작할 경우 일부 어플리케이션은 segfault 와 memory corruption 을 낼 수
있는 문제가 있었습니다.  커밋 bd4c82c22c367e068 ("mm, THP, swap: delay
splitting THP after swapped") 때문에 발생한 문제였구요.  이를 고치기 위한
패치입니다.
out")
