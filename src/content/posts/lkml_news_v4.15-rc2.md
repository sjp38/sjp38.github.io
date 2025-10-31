+++
bigimg = ""
date = "2017-12-04T13:38:11+09:00"
subtitle = ""
title = "LKML News after v4.15-rc2"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc2
--------------

https://lkml.kernel.org/r/CA+55aFxPBszFBt91KRNBrsQdJ10b+6fh9ySNzSKSX7JOq4WRPw@mail.gmail.com

4.15 의 두번째 rc 버전이 나왔습니다.

동부 지방을 여행 중인가 보군요.  평소보다 좀 이른 시간에 릴리즈가 됐습니다.
원하던 것보단 큰 릴리즈가 되어버렸지만 대부분 fixup 이기에 큰 문제는 없는 것
같다는군요.  Kernel ASLR leak 을 막기 위해 모든 "%P" 로 프린트되는 어드레스
주소를 해시해 버린다고 하네요.  이럼 디버깅할 때 좀 짜증날 수 있긴 하겠지만
다른 방법이 별로 없었다고...


[RFC PATCH v3 0/7] ktask: multithread CPU-intensive kernel work
---------------------------------------------------------------

https://lkml.kernel.org/r/20171205195220.28208-1-daniel.m.jordan@oracle.com

CPU-intensive 한 작업을 커널 내에서 병렬로 진행하도록 도와주는 새로운 프레임웍,
ktask 의 RFC 패치입니다.  예를 들어, 부팅 시에 `struct page` 들을 초기화 하는
작업은 현재 하나의 쓰레드가 처리하게 되어 booting 시간이 길어지는데, 멀티코어
시스템이라면 ktask 를 이용해 이 작업을 자동으로 병렬화 할 수 있다는 겁니다.
기존에도 workqueue, kthread_worker 와 같이 병렬 작어을 위한 커널 기능들이
존재하지만, workqueue 는 작업을 쓰레드별로 나누는 걸 대신 해주지는 않고,
kthread_worker 는 하나의 쓰레드만 지원하기 때문에 ktask 를 새로 만들었다고
하네요.


[PATCH v4 00/73] XArray version 4
---------------------------------

https://lkml.kernel.org/r/20171206004159.3755-1-willy@infradead.org

XArray 네번째 버전의 패치가 올라왔습니다.  LinuxCon Europe 에서도 관련 발표를
재밌게 들었었는데요.  XArray 는 Radix tree 의 API 를 대체할 목적으로 만들어진
새로운 자료구조 인터페이스입니다.  이번 버전의 패치를 통해 page cache 가 완전히
Radix tree 에서 XArray 로 갈아타게 했다는군요.  하지만 여전히 문제들도 많아서
바로 머지되진 않을 것 같다고 패치의 작성자도 이야기하네요.
