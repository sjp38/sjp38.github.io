+++
bigimg = ""
date = "2017-12-18T17:46:23+09:00"
subtitle = ""
title = "LKML News after v4.15-rc4"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc4
--------------

https://lkml.kernel.org/r/CA+55aFysmVGm_shBvK4kmaS+_PsMEt3Mz_b+Dm0SDrmVtUofbA@mail.gmail.com

4.15 의 네번째 rc 버전입니다.  지난 rc 버전들이 생각보다 커서 토발즈가 좀
걱정했는데, 이번 릴리즈에 들어서는 평범한 네번째 rc 만큼이나 변화가 많이 없어
충분히 안정화 되기 시작한 것 같다고 하는군요.

이번에 가장 눈에 띌만한 변화는 suspend/resume 처리를 정리하고 고친 것이라고
합니다.  크로스 락킹 디버깅 기능은 부팅 시간을 늘리는 문제 등도 있어선지 이번에
일단 제거되었네요.  나중에 다시 되살릴 계획은 있는 것 같습니다.


[PATCH v2 1/1] Move kfree_call_rcu() to slab_common.c
-----------------------------------------------------

https://lkml.kernel.org/r/1513895570-28640-1-git-send-email-rao.shoaib@oracle.com

RCU 의 modularity 를 개선하는 패치입니다.  몇가지 쟁점이 있긴 하지만 기본
아이디어는 받아들여지는 분위기군요.
