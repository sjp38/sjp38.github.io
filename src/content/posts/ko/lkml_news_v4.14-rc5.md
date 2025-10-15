+++
bigimg = ""
date = "2017-10-17T20:54:24+09:00"
subtitle = ""
title = "LKML News after v4.14-rc5"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.14-rc5
--------------

https://lkml.kernel.org/r/CA+55aFyKgEL3dj7XGYsPQd8y_z0GWx91TLZPSQAxjrua1aWOLw@mail.gmail.com

다섯번째 rc 버전의 릴리즈입니다.

Lazy TLB flushing 변경은 지나치게 게으르게 TLB flushing 을 해서 AMD 칩 일부에서
문제를 일으키기도 했었다는군요.

일부 서브시스템에서 fuzzing 을 통한 문제 발견과 수정이 있었는데 좋은
현상이라고도 언급합니다.

전체적으로 x86, powerpc, mips 에의 arch 업데이트, gpu, networking, usb, sound,
misc 드라이버 업데이트, lockdep, networking, mm 쪽 코어 커널 업데이트, 그리고
perf 와 selftest 에의 업데이트가 있었다고 이번 릴리즈를 정리하는군요.


[PATCH 0/2] mm, thp: introduce dedicated transparent huge page
--------------------------------------------------------------

https://lkml.kernel.org/r/1508145557-9944-1-git-send-email-changbin.du@intel.com

THP 의 메모리 할당은 좀 복잡하게 여기저기 코드 복사로 구현되어 있습니다.
HugeTLB 는 별도 인터페이스가 있구요. THP 에도 HugeTLB 처럼 별도 인터페이스를
사용하도록 제안한 패치입니다.


[PATCH 1/2] lockdep: Introduce CROSSRELEASESTACKTRACE and make it
-----------------------------------------------------------------

https://lkml.kernel.org/r/1508318006-2090-1-git-send-email-byungchul.park@lge.com

지난번 Johan Hovold 가 이야기한 lockdep crossrelease 에 의한 성능 문제 (부팅
시간이 17초에서 35초까지 늘어났죠)에 대한 해결책입니다.

stack unwind 를 너무 자주 해서 생긴 문제이므로 이를 선택적으로 할 수 있게 하고
그 디폴트 값을 자주 하지 않도록 수정했네요.

작은 qemu 머신에서 부팅시간이 lockdep disabled 시 1.543 초, lockdep enabled 시
1.570 초, lockdep + crossrelease enabled 시 1.870 초를 보였는데, 이 패치를
적용한 후 마지막 환경에서 부팅시간이 1.574 초로 줄었습니다.

패치를 보낸 박병철 님은 커널 로그의 타임스탬프를 통해 부팅 시간을 측정했는데,
Ingo Molnar 는 부팅 시간 테스트에 qemu 시작 스크립트에 init=/bin/true 과 같은
kernel parameter 를 줘서 부팅 완료와 함께 종료되게 하고서 perf --null --repeat
옵션을 사용해서 부팅 시간을 측정할 것을 제안했습니다. 유용한 팁 같습니다!

Linux-kernel examples for LKMM recipes
https://lkml.kernel.org/r/20171011223229.GA31650@linux.vnet.ibm.com

리눅스 커널에서의 메모리 순서 규칙을 위한 리트머스 테스트들이 실제로 비슷한
패턴으로 사용된 예를 Linux Plumbers Conference 에서 요청받은 Paul E. Mckenney
가 이에 대한 내용을 문서로 만들어 업데이트 했습니다.

해당 문서는 다음 링크에서도 얻을 수 있습니다:
https://github.com/aparri/memory-model/blob/master/Documentation/recipes-LKcode.txt
