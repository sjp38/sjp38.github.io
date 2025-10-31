+++
bigimg = ""
date = "2017-10-25T12:56:27+02:00"
subtitle = ""
title = "LKML News after v4.14-rc6"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.14-rc6
--------------

https://lkml.kernel.org/r/CA+55aFxSJGeN=2X-uX-on1Uq2Nb8+v1aiMDz5H1+tKW_N5Q+6g@mail.gmail.com

여섯번째 rc 버전의 릴리즈입니다.

토발즈 집 인터넷 문제로 평소보다 늦은 릴리즈였군요.
이번 rc 버전은 기대보다는 좀 많은 내용이 추가되었는데, 때문에 어쩌면 rc8 까지
나올지도 모르겠다고 하는군요.  물론 확정되거나 한건 아니라고 합니다.


Re: [GIT PULL rcu/next] RCU commits for 4.15
--------------------------------------------

https://lkml.kernel.org/r/20171023204502.GA2776@linux.vnet.ibm.com

4.15 에 들어가야 할 RCU 쪽 커밋들의 풀리퀘스트 입니다.

문서, RCU CPU Stall warning 업데이트, rcutorture 쪽 업데이트가 포함되었네요.


[GIT PULL de-alpha] Make core code not need to know about Alpha for v4.15
-------------------------------------------------------------------------

코어 커널 코드에서 Alpha 를 위한 예외 케이스를 제거하기 위한 작업의 첫번째
결과물이 v4.15 를 향합니다.

먼저 `ACCESS_ONCE()` 를 모두 `READ_ONCE()` 와 `WRITE_ONCE()` 로 변경하고,
`READ_ONCE()` 와 Alpha 의 값을 리턴하는 `_release` 와 `_relaxed` atomic RMW
오퍼레이션들에 `smp_read_barrier_depends()` 를 내장시키며, 따라서 필요없어진
`lockless_dereference()` 는 수정된 `READ_ONCE()` 로 대체되게 했습니다
(lockless_dereference() 는 사실 READ_ONCE() 플러스 smp_read_barrier_depends()
였는데 smp_read_barrier_depends() 는 Alpha 외의 아키텍쳐에서는 NOOP 이라 Alpha
만을 위해 괜히 복잡했거든요).
