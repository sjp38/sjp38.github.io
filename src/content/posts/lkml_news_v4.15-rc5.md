+++
bigimg = ""
date = "2017-12-24T14:24:13+09:00"
subtitle = ""
title = "LKML News after v4.15-rc5"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc5
--------------

https://lkml.kernel.org/r/CA+55aFy1U+uBLEAoCWU3=BqEbROW6rsbaHUdYJArR6iYQQWo_A@mail.gmail.com

4.15 의 다섯번째 rc 버전이 평소 스케쥴보다 하루 일찍 릴리즈 되었습니다.
원래대로라면 내일일텐데, 미국 시간으로는 크리스마스 이브라서 그냥 오늘 릴리즈
한다는군요.

이번 rc5 의 변경 사항들도 지난 릴리즈의 rc5 와 비슷했다고 하는데, 다만 x86 의
커널 페이지 테이블 격리화 관련 작업이 진행 중인 게 좀 예외라고 하는군요.


Re: About the try to remove cross-release feature entirely by Ingo
------------------------------------------------------------------

https://lkml.kernel.org/r/20171229014736.GA10341@X58A-UD3R

Lockdep 의 cross release 기능은 너무 느렸고, false positive 가 많다는 이유로,
특히 false positive 가 너무 많다는 이유로 Ingo Molnar 에 의해 제거되려 하고
있습니다.  관련해서 이 블로그에서도 일단 default 로는 disable 되는 변경이 v4.14
에 있었음을 이야기 했죠.

Cross release 의 개발자인 박병철님께서 이에 대해 다른 의견을 내놓는 메일입니다.


Re: Hang with v4.15-rc trying to swap back in
---------------------------------------------

https://lkml.kernel.org/r/1514407817.4169.4.camel@HansenPartnership.com

스왑 레이어를 최적화하는 많은 변경이 최근에 있었는데, 그 중 하나가 시스템 행을
일으키는군요.  관련된 패치들을 발본색원해서 레포팅 한 메일입니다.  충분히 빠른
swap device 에 대해서는 swapcache 를 건너뛰게 한게 원인이 되었군요.
