+++
bigimg = ""
date = "2017-11-08T04:19:47+09:00"
subtitle = ""
title = "LKML News after v4.14-rc8"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.14-rc8
--------------

https://lwn.net/Articles/738207/

v4.14 를 향한 (아마도) 마지막 rc 버전의 릴리즈입니다.

정말로 별다른 일 없었다면 그냥 이번에 v4.14 릴리즈를 할 계획이었지만 그정도는
아니었다고 하는군요.
어쨌든 rc8 덕분에 v4.15 merge window 는 thanksgiving week 를 포함하게 되었는데
토발즈는 이때 가족과 휴가를 갈 계획이라 랩톱 가지고 휴가다니는 동안에도 머지를
잘 할 수 있길 바라지만 문제가 생기면 merge window 를 연장할 수도 있겠다고
하네요.  일단 어떻게 될지 두고보자는군요.

이번 릴리즈에 포함된 변경은 대부분 드라이버 쪽 변경이고, SPDK 관련 소스코드에
라이센스 추가 등을 한 사소하지만 커다란 양의 변경이 있습니다.  또 하나, 4.13
버전에서 /proc/cpuinfo 가 CPU frequency 를 부정확하게 표시하게 하는 중대한
버그가 있었는데, 다행히 이번에 고쳐졌군요.


Page allocator bottleneck
-------------------------

https://lkml.kernel.org/r/cef85936-10b2-5d76-9f97-cb03b418fd94@mellanox.com

차세대 고속 NIC 에 의해 두각이 드러나는 소프트웨어쪽 bottleneck 을 찾다보니
page allocator 쪽에 오버헤드가 있다는 이야기로 시작된 쓰레드로, 9월부터 시작된
쓰레드인데 요즘 다시 답변이 활기차게 붙고 있습니다.

ConnectX-5 100 Gbps NIC, Xeon CPU E5-2680 v3 @ 2.50GHz CPU 의 시스템에서
super_netperf 를 사용, 128개 TCP 스트림을 RX queue 갯수 바꿔가며 돌려가며 BW 를
측정했습니다.  mlx5 드라이버를 다음과 같이 수정, 사용했습니다.
```
1) RX page cache disabled, 2 packets per page.
2) RX page cache disabled, one packet per page.
3) Huge RX page cache, one packet per page.
```

두번째 드라이버는 200Gbps NIC 을 시뮬레이션 하기 위한 변경입니다.
첫번째, 세번째 드라이버는 RX queue
갯수에 따라 BW 가 증가, line rate 까지 도달하는데 두번째 드라이버는 그렇지
못하고 8개 RX queue 부터는 오히려 BW 가 줄어들었습니다.
이때 perf top 은
`85.58% [kernel] [k] queued_spin_lock_slowpath` 를 보여, 페이지 할당 메커니즘의
자체적 성능도 문제고, 확장성도 문제라고 이슈를 최초 제기했습니다.

PCP (per-CPU) allocator 를 사용해 성능이 좋아지는 걸 확인하고 쓰레드가 닫히는
것 같았는데, 11월 2일자로 다시 새로운 실험 결과를 가지고 왔습니다.
PCP allocator 내의 페이지가 남아있을 동안은 문제가 없지만, 이후부터는 페이지가
할당된 코어와 해제되는 코어가 달라서 buddy allocator 에 부담을 주더란
이야기입니다.


[PATCH] x86/selftests: Add test for mapping placement for 5-level paging
------------------------------------------------------------------------

https://lkml.kernel.org/r/20171108102250.38609-1-kirill.shutemov@linux.intel.com

x86 의 5-level paging 을 위한 selftest 가 추가되었네요.
