+++
title = "LKML News v5.4"
date = 2019-11-19T23:13:19+01:00
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

[PATCH RFC v3 00/36] Add KernelMemorySanitizer infrastructure
-------------------------------------------------------------

https://lkml.kernel.org/r/20191122112621.204798-1-glider@google.com

초기화 되지 않은 메모리 영역에 접근함으로써 생기는 에러를 검출해내는 구글의
KMSAN 세번째 RFC 패치셋입니다.  다른 SAN 시리즈와 마찬가지로 구글 syzkaller 에
사용되어 지난 2년간 200개가 넘는 버그를 찾아냈다고 하네요.


LSF/MM/BPF: 2020: Call for Proposals
------------------------------------

https://lkml.kernel.org/r/20191122172502.vffyfxlqejthjib6@macbook-pro-91.dhcp.thefacebook.com

내년 LSF/MM 의 CFP 가 나왔습니다.  근데, 내년부턴 LSF/MM 에 BPF 세션이
추가되네요, 명칭도 LSF/MM/BPF 로 바뀌었습니다.  BPF 의 위상이 새삼 느껴지네요!


Linux 5.4
---------

https://lkml.kernel.org/r/CAHk-=wjmzaD=BZ1hjUYu+RTnSGDLfCRwCdg99GeQpCjEwo9uzw@mail.gmail.com

여덟번의 rc 릴리즈를 끝으로 드디어 5.4 정식 버전이 릴리즈 되었습니다.  다행히
지난 일주일 간은 정말 별일 없었다는군요.  Thanksgiving 을 대비해 일찍 들어온
5.5 를 위한 풀리퀘스트가 대부분이었고, 네트워킹과 GPU 쪽의 일부 업데이트가
대부분이었다고 합니다.

이렇게 5.5 머지 윈도우가 열렸는데, 머지윈도우 중에 Thanksgiving 이 있다는게
조금 걱정되긴 합니다만, 토발즈는 큰일은 없을 걸로 믿으며, 아이들 돌보느라 조금
처리가 늦어질 순 있겠다고 하네요.
