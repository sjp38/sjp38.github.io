+++
bigimg = ""
date = "2017-11-13T17:07:44+09:00"
subtitle = ""
title = "LKML News after v4.14"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.14
----------

htpps://lkml.kernel.org/r/CA+55aFwqXh4rgJJ3T98k8wa-JYF7t8mWuwUjdxkbZyOyDEcGzQ@mail.gmail.com

드디어 v4.14 의 릴리즈입니다.  이번 버전은 또하나의 LTS 커널이 될 예정이군요.

동시에, v4.15 를 위한 머지 윈도우가 열렸습니다.  이번 머지 윈도우는 thanks
giving 이랑 겹치게 되었는데, 이때문에 머지 윈도우를 연장할지 아니면 아예 1주일
줄일지 토발즈는 고민중인 것 같네요.


[RFC PATCH v11 for 4.15 01/24] Restartable sequences system call
----------------------------------------------------------------

https://lkml.kernel.org/r/20171114200414.2188-2-mathieu.desnoyers@efficios.com

몇년전부터 올라오고 있으나 아직 머지되지 못한, restartable sequence 패치의 최신
버전이 또 올라왔습니다.  유저스페이스의 크리티컬 섹션을 커널에게 제어할 수
있도록 도와주는 기능입니다.  이번엔 머지될런지?


[PATCH V2] selftest/vm: Add test case for mmap across 128TB boundary.
---------------------------------------------------------------------

https://lkml.kernel.org/r/20171123030313.6418-1-aneesh.kumar@linux.vnet.ibm.com

128TB mmap() 에 대한 테스트 케이스가 kselftest 에 추가되었습니다.  x86_64 와
powerpc64 를 지원하는군요.

이후 몇가지 코멘트를 받고 v3 도 올라왔습니다:
https://lkml.kernel.org/r/20171123165226.32582-1-aneesh.kumar@linux.vnet.ibm.com


XArray documentation
--------------------

https://lkml.kernel.org/r/20171124011607.GB3722@bombadil.infradead.org

지난 ossummit europe 에서 흥미롭게 발표를 들었던 XArray 의 문서입니다.  radix
tree 를 대체할 만한 인터페이스를 목표로 하고있다고 하더군요.


[PATCH] mm: Do not stall register_shrinker
------------------------------------------

https://lkml.kernel.org/r/1511481899-20335-1-git-send-email-minchan@kernel.org

메모리가 부족할 때 깨어나 일을 하게 되는 shrinker 의 등록 시 메모리가 부족해서
다른 것들에 의해 shink_slab() 에서 시간을 보내느라 register_shrinker() 에서
수십초씩이나 시스템을 멈춰있게 만드는 문제가 있었는데, shrink_slab() 에서
shrinker 등록 여부를 rwsem 에 대한 contention 확인으로 파악하고 slab shrinking
을 멈춰주도록 수정했습니다.
