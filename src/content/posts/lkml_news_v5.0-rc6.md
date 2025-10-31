+++
title = "LKML News v5.0-rc6"
date = 2019-02-11T12:40:20+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

[PATCH v4 1/1] psi: introduce psi monitor
-----------------------------------------

https://lkml.kernel.org/r/20190206023446.177362-1-surenb@google.com

시스템의 메모리 부족 등의 현상이 어떻게 일어나고 있는지 쉽게 파악할 수 있는
장치를 추가하는 패치입니다.


[LSF/MM TOPIC] Address space isolation inside the kernel
--------------------------------------------------------

https://lkml.kernel.org/r/20190207072421.GA9120@rapoport-lnx

리눅스의 어드레스 스페이스 기능은 유저스페이스 프로그램들이 서로에게 영향을
끼치지 못하게 해줘서 컨테이너 등에 쓰이고 있죠.  하지만 커널은 공유하기 때문에
커널 버그는 여전히 영향을 끼칠 수 있습니다.  커널 코드도 어드레스 스페이스를
어느정도 인식하고 코드 분류를 시킴으로써 그 문제를 줄여보자는 LSF/MM 토론 주제
제안입니다.


LSF/MM 2019: Call for Proposals (UPDATED!)
------------------------------------------

https://lkml.kernel.org/r/4f5a15c1-4f9e-acae-5094-2f38c8eebd96@kernel.dk

올해 LSF/MM 에는 BPF 트랙이 있을 거라는군요.  이에 따른 공지 업데이트입니다.
BPF 의 상승세가 올해도 계속될 것 같군요!


[LSF/MM TOPIC] BPF for Block Devices
------------------------------------

https://lkml.kernel.org/r/40D2EB06-6BF2-4233-9196-7A26AC43C64E@raithlin.com

LSF/MM 에 BPF 라면 당연히 block device 와 BPF 의 결합을 이야기 해야하지
않겠냐는 LSF/MM 토론 제안입니다.  Computational Storage 개념을 이야기 하는데요,
I/O 레이어에서 간단한 연산을 처리해 줌으로써 성능을 높이자는 거죠.  그러기 위한
연산 요청에 BPF 를 쓰자는 것 같습니다.  말 되네요!


Linux 5.0-rc6
-------------

https://lkml.kernel.org/r/CAHk-=whuSY_-hAU8ugVR7a=xz3uZeRrAPdhsoMZHmZ_7Qc49YQ@mail.gmail.com

이제 리눅스 5.0 정식 릴리즈가 얼마 남지 않았네요, 여섯번째 rc 가 나왔습니다.
그런데 이번 rc 는 토발즈가 바랬던 것보다는 조금 변경사항이 많았군요.  대부분
네트워킹 쪽 변경이었다고 합니다만, 그래도 나머지는 큰 문제 없어 보인다는군요.
