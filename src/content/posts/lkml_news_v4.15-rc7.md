+++
bigimg = ""
date = "2018-01-13T10:30:13+09:00"
subtitle = ""
title = "LKML News after v4.15-rc7"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc7
--------------

https://lkml.kernel.org/r/CA+55aFwbmKznuQZe_VemxXJPSmB-9yy8uyWsMZcrkA4T=m8xkw@mail.gmail.com

Meltdown 과 Spectre 로 떠들썩했던 시간을 지나 4.15 의 일곱번째 rc 버전이 릴리즈
되었습니다.  지난 여섯번째 릴리즈 때도 상당히 안정화에 신경써야 할 시점임에도
x86 pti (page table isolation) 업데이트 패치가 많이 머지되어 의아했는데, 이게
Meltdown 과 Spectre 버그 때문이었음도 밝혀졌죠.
그렇다곤 해도 그 외의 부분은 예상대로 상당히 안정화 되어가고 있다고 합니다.

더불어, Thomas Geixner 등의 인텔쪽 커널 개발자들의 노력 덕에 pti 등 Meltdown 과
Spectre 버그를 위한 패치가 잘 관리되어 비교적 쉽게 머지될 수 있었음에 리누스가
감사를 표하네요.  욕할땐 욕하고 칭찬할 땐 칭찬하고. ;)

아무튼, 이때문에 4.15 는 rc8 까지 릴리즈 할 계획이라고 합니다.  4.15 는 2주일
후에나 릴리즈 되겠군요.


LSF/MM 2018: Call for Proposals
-------------------------------

https://lkml.kernel.org/r/20180115163952.GB26120@cmpxchg.org

리눅스 스토리지, 파일 시스템, 메모리 관리 쪽 개발자들의 모임인 LSFMM 서밋 2018
을 위한 CFP 가 공개되었습니다.  올해도 4월에 하네요.  장소는 유타입니다.  1월
31일까지 토론하고 싶은 주제를 메일로 보내면 흥미로운 주제를 바탕으로 주제를
꾸미고, 그 외에도 그냥 참가하고 싶은 사람도 메일 보내면 내부적으로 심사 후
초대를 해주는 것 같네요.
