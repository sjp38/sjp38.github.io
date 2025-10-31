+++
title = "LKML News v5.2-rc2"
date = 2019-05-21T01:27:47+09:00
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

[RFC PATCH v5 00/16] Slab Movable Objects (SMO)
-----------------------------------------------

https://lkml.kernel.org/r/20190520054017.32299-1-tobin@kernel.org

이 블로그에서도 소개한 Slab movable objects 패치셋의 다섯번째 버전입니다.  RFC
로는 아마도 마지막 버전이 될거라는군요.


[RFC PATCH 00/14] mmap_sem range locking
----------------------------------------

https://lkml.kernel.org/r/20190521045242.24378-1-dave@stgolabs.net

이번 LSFMM 에서 개인적으로 가장 기대했던 세션이 `mmap_sem` 해결에 대한
세션이었습니다.  해당 세션에서는 예전부터 이야기가 나온 range locking 에
대해서도 이야기가 있었는데요, 이 패치셋은 이 range locking 을 사용한 `mmap_sem`
문제 해결 시도를 다시 정리해 RFC 의 형태로 올린 것입니다.

RFC 라는 데서 알 수 있겠지만 이 패치 자체에도 문제가 많지만, 코드 자체보다는 이
range locking 이라는 아이디어가 갖는 한계와 그에 대한 대책 등을 논의해 보고자
올린 것이라고 합니다.


[RFC 0/7] introduce memory hinting API for external process
-----------------------------------------------------------

https://lkml.kernel.org/r/20190520035254.57579-1-minchan@kernel.org

앞서 여기서도 다룬 구글의 proactive swap 의 안드로이드 버전과 비슷한 일을 위한
패치셋입니다.  안쓰는 데이터 잔뜩 쥐고서는 스왑도 안당하고 있는 앱이 문제죠.
이런 데이터를 `madvise()` 에 `MADVISE_COLD` 와 `MADVISE_COOL` 이라는 추가
힌트를 줘서 어플리케이션 레벨에서 이런 스왑하는게 좋을 데이터를 알려주는
형태입니다.  기존의 `MADVISE_WONTNEED` 는 스왑을 하는게 아니라 걍 데이터를
버려버리기 때문에 이런 두개의 힌트를 추가한거죠.

인공적 벤치마크가 아니라 수백명의 진짜 사용자를 통해 성능 실험을 했다고
하는데요, 구글에서 고용한 테스트 집단일까요?


[PATCH v4 00/14] Provide generic top-down mmap layout functions
---------------------------------------------------------------

https://lkml.kernel.org/r/20190526134746.9315-1-alex@ghiti.fr

각 아키텍쳐별로 존재하는 중복 코드를 제거하기 위해 만들어진 범용 top-down mmap
을 위한 패치의 네번째 버전입니다.


[PATCH 0/3] remove tmem and code depending on it
------------------------------------------------

https://lkml.kernel.org/r/20190527103207.13287-1-jgross@suse.com

Xen 의 tmem 기능이 제거되었군요.  관련 코드를 리눅스 커널에서도 제거하는
패치셋입니다.  덕분에 cleancache 가 아예 사라질 모양입니다.  Cleancache 에
의존하는 GCMA 를 만들고 있는 제 입장에선 쇼킹한 일입니다.


Linux 5.2-rc2
-------------

https://lkml.kernel.org/r/CAHk-=wgob1t2g9iQZCuZ8My39CY26xGb6nqjVhCtb1nTirsR2Q@mail.gmail.com

일정대로 두번째 rc2 가 릴리즈 되었습니다.  이번엔 그야말로 특기할 만한 점이
없다는군요.  그나마 큰 변화는 SPDX 관련 변경들 뿐이었다고 합니다.
