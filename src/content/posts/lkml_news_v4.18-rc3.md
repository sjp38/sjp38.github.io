+++
title = "Lkml_news_v4.18 Rc3"
date = 2018-07-02T11:18:24+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

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

Linux 4.18-rc3
--------------

https://lkml.kernel.org/r/CA+55aFwGk-pWKKCtp+kQUN_hov9tW+vUo6Wgob91bewwBL17fA@mail.gmail.com

4.18 을 향하는 세번째 릴리즈입니다.  그간 일본에 중국을 방문하고 있던 토발즈가
집에 돌아와서 이번엔 평소처럼 한국시간으로는 월요일 아침 릴리즈가 되었군요.

큰 이상은 없고 드라이버, arch, 파일시스템 등에 변경이 있군요.

그리고, 오늘이 리누스 토발즈가 리눅스 파운데이션 소속으로 일하게 된지
15주년이라는군요.  리눅스 파운데이션도 리눅스도 오래오래 건강했으면 좋겠습니다.


[PATCH v2 0/2] x86/numa_emulation: Introduce uniform split capability
---------------------------------------------------------------------

https://lkml.kernel.org/r/153089327581.27680.11402583130804677094.stgit@dwillia2-desk3.amr.corp.intel.com

X86 에서는 커널 패러미터를 줘서 NUMA emulation 이 가능한데, 각 NUMA node 의
메모리 사이즈를 모두 똑같게 하기보다는 요청된 NUMA node 수를 맞추는걸 우선시
하고 있습니다.  이 패치는 해당 커널 패러미터에 'U' suffix 를 주면 사이즈를
동일하게 맞추는 걸 우선시하게 만들어주도록 합니다.
