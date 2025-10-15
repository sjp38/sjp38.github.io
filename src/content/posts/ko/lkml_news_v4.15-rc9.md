+++
bigimg = ""
date = "2018-01-23T12:16:07+09:00"
subtitle = ""
title = "LKML News after v4.15-rc9"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

*Not* final 4.15 this weekend
-----------------------------

https://lkml.kernel.org/r/CA+55aFxzQBH5gnG92ah-PREfOqb5_rjWriLH3fWHMWS1=BSQFw@mail.gmail.com

원래대로라면 4.15 정식 버전의 릴리즈가 될 타이밍이었습니다만...
아직 충분히 안정화 되지 않은 것 같다는 토발즈의 판단 아래 이번주에도 rc 버전이
나왔습니다.  rc9 입니다.
2011년의 3.1-rc9 이후 처음 나온 rc9 이네요.

이번 릴리즈는 x86, arm powerpc, mips 쪽의 arch 업데이트, 드라이버, 그리고
네트워킹 핵심부 업데이트가 주된 변경이군요.

다음주에는 꼭 4.15를 릴리즈 하고 싶다고 하는데, 아마도 다음주에는 4.15 정식
버전이 릴리즈되길 빕니다.


[LSF/MM TOPIC] CMA and larger page sizes
----------------------------------------

https://lkml.kernel.org/r/3a3d724e-4d74-9bd8-60f3-f6896cffac7a@redhat.com

Contiguous Memory Allocator (CMA) 는 할당에 사용되는 메모리 영역을 비트맵으로
관리하는데, 페이지 하나에 비트 하나씩 주면 비트맵을 traverse 하는데 너무 많은
시간이 걸리므로, 하나의 비트가 여러개의 페이지를 담당하도록 되어있습니다.
이게 CMA 의 응답시간에는 큰 도움이 되지만, fragmentation 으로 인한 메모리
낭비가 심합니다.  Laura Abbott 은 이걸 LSFMM 에서 논의해보고 싶어하는군요.


[GIT PULL tools] Linux kernel memory model
------------------------------------------

https://lkml.kernel.org/r/20180125093440.GA875@linux.vnet.ibm.com

Paul McKenney 의 리눅스 커널 메모리 모델이 리눅스 커널 소스트리의 `tools/`
디렉토리로 머지될 것 같습니다!
이 모델은 `cat` 언어로 쓰여져서 `herd7` 시뮬레이터로 실행될 수 있어서, 동시성을
갖는 코드가 실제로 어떻게 동작할지 검사할 수 있게 해줍니다.
과장 좀 보태서 자동화된 memory-barriers.txt 라고도 할 수 있죠.

이미 Ingo Molnar 가 풀 했군요.  별다른 문제 없다면 정식 버전으로는 4.17
버전에서 볼 수 있겠습니다.
