+++
bigimg = ""
date = "2017-11-03T14:51:35+09:00"
subtitle = ""
title = "LKML News after v4.14-rc7"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.14-rc7
--------------

https://lkml.kernel.org/r/CA+55aFwhgxivTE3k88nshbrH9nd-4nhmhXGzw-MxRVGxf-R8Eg@mail.gmail.com

일곱번째 rc 버전의 릴리즈입니다.

OSSE 와 kernel summit 으로 프라하를 방문했던 토발즈인데, 집에 잘
돌아왔다는군요.  이번 rc 버전은 기존의 rc7 보다도 작은 편에 가깝다고 합니다만,
다음 한주간이 정말 조용하지 않는한은 rc8 릴리즈를 할 생각이라는군요.


Re: Page allocator bottleneck
-----------------------------

https://lkml.kernel.org/r/1c218381-067e-7757-ccc2-4e5befd2bfc3@mellanox.com

멜라녹스의 빠른 네트워크 카드를 사용하는 환경에서는 page allocator 의 속도가
bottleneck 이 된다는 이야기에 대한 업데이트입니다.  여전히 해당 부분이
bottleneck 이며, queued_spin_lock_slowpath() 가 85 % 가까이 CPU 를 차지하고
있군요.


[PATCH 0/2] swap readahead clean up
-----------------------------------

https://lkml.kernel.org/r/1509514103-17550-1-git-send-email-minchan@kernel.org

Swap layer 는 swap in 시에, 연속된 물리 주소의 페이지들을 한번에 읽어들이는
read-ahead 기법을 사용하고 있습니다.  후에 근접한 페이지도 접근될 확률이 높다는
거죠.  하지만 fragmentation 이 심한 환경에서는 꼭 그렇지 않을 수 있습니다.
때문에 virtual address space 에서 연속된 페이지들을 read ahead 하는 패치가
최근에 들어왔는데, 이에 대한 코드 정리 패치입니다.


[PATCH v2] ftrace/docs: Add documentation on how to use ftrace from within the kernel
-------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20171031100705.573531cd@gandalf.local.home

jprobe 가 사라지고 ftrace 가 대신 사용될 예정입니다.  이를 위한 문서의 추가
패치입니다.
