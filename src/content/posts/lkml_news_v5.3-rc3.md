+++
title = "LKML News v5.3-rc3"
date = 2019-07-31T08:40:48+09:00
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

[PATCH v5 00/14] Provide generic top-down mmap layout functions
---------------------------------------------------------------

https://lkml.kernel.org/r/20190730055113.23635-1-alex@ghiti.fr

아키텍쳐별로 다르게 구현되어 있던 mmap 레이아웃 함수들을 범용화 시키는 패치셋,
다섯번째 버전입니다.


[PATCH v10 00/22] Generic page walk and ptdump
----------------------------------------------

https://lkml.kernel.org/r/20190731154603.41797-1-steven.price@arm.com

역시 아키텍쳐별로 다르게 구현되어 있던 page table walk 과 page table dump
기능을 범용화 시키는 패치입니다.  벌써 10번째 버전이군요.


[PATCH 0/3] address hugetlb page allocation stalls
--------------------------------------------------

https://lkml.kernel.org/r/20190802223930.30971-1-mike.kravetz@oracle.com

`sysctl` 이나 `procfs` 를 통한 hugetlb 페이지 할당은 수분이나 수시간까지도 오래
걸릴 수 있습니다.  이 패치셋은 이렇게 느린 할당시간 문제를 유발하는 reclaim 과
compaction 쪽 문제를 해결할 수 있는 수정사항들을 담고 있습니다.


Linux 5.3-rc3
-------------

https://lkml.kernel.org/r/CAHk-=wiW+q32YcUL62XWjAme8giZDo-=kmB9=f_JEgyEgV7eaA@mail.gmail.com

보통 머지 윈도우가 지난 후에는 사람들이 숨을 고르고 넘어가기 때문에 보통 rc2 가
작고 rc3 부터 변경이 많아집니다.  하지만 이번 릴리즈는 이상하게도 rc2 보다
작았다는군요.

커밋 기반으로 그린 rc3 개발 시각화 동영상을 다음 링크에서 볼 수 있습니다:
https://youtu.be/V1qUa2QXZes
