+++
title = "LKML News v5.1-rc4"
date = 2019-04-07T23:17:55+09:00
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

Linux v5.1-rc3 릴리즈 후 Linux v.5.1-rc4 릴리즈 사이 기간에 LKML 에 올라온
흥미로운 메일들을 소개합니다.


[PATCH v8 00/20] Convert x86 & arm64 to use generic page walk
-------------------------------------------------------------

https://lkml.kernel.org/r/20190403141627.11664-1-steven.price@arm.com

전에 이 블로그에도 공유했던, `walk_page_range()` 함수가 커널에서 사용하는
페이지 테이블은 지원하지 않아서 아키텍쳐별로 page table walk 기능을 구현한 걸
`walk_page_range()` 의 개선을 통해 가능하게 하고자 하는 패치의 여덟번째
버전입니다.


[PATCH] mm: add vm event for page cache miss
--------------------------------------------

https://lkml.kernel.org/r/1554185720-26404-1-git-send-email-laoar.shao@gmail.com

Page cache miss 로 인해 사용중인 데이터베이스에 레이턴시가 증가하는 문제가
있는데, 기존 커널에는 페이지 캐시 미스 카운트를 세는 기능이 없기 때문에 만들어
봤다고 합니다.  반응은... 별로 좋지 않군요.


[RFC PATCH 00/25] Accelerate page migration and use memcg for PMEM management
-----------------------------------------------------------------------------

https://lkml.kernel.org/r/20190404020046.32741-1-zi.yan@sent.com

앞서 이 블로그에서도 소개한대로 PMEM 을 좀 많이 느린 NUMA node 로 다룰 수 있게
되었습니다.  따라서 적절한 페이지 마이그레이션이 중요해지죠.  리눅스 자체 page
replacement policy 를 이용해 page migration 을 하는 방법이 제기되었지만 그
방법은 충분한 쓰루풋을 제공하지 않고 너무 가끔 replacement 가 일어나 hot / cold
를 제대로 구분하기 어려운 문제가 있다고 이 메일은 주장하고, 자신이 생각하는
해결책을 RFC 의 형태로 제시하고 있습니다.

실제 기존 방식의 마이그레이션 쓰루풋과 자신이 제안한 방식의 쓰루풋을 비교하면서
설명하는데, 재밌네요.


[PATCH RFC tip/core/rcu 0/4] Forbid static SRCU use in modules
--------------------------------------------------------------

https://lkml.kernel.org/r/20190402142816.GA13084@linux.ibm.com

로드될 수 있는 모듈 내에서의 `DEFINE_SRCU()` 와 `DEFINE_STATIC_SRCU()` 사용을
급지하는 패치셋입니다.  로드 되는 모듈에서 이걸 사용하면 메모리 회수가 안될
것이기 때문이죠.  대신 동적으로 메모리 할당받고 초기화 해서 쓰고, 모듈 exit 될
때 제대로 메모리 해제 시키라고 합니다.


Linux 5.1-rc4
-------------

https://lkml.kernel.org/r/CAHk-=widsb0vN7kqt8ATfNuNW6a54JpKjc6W0XPjt5=LW7UeGQ@mail.gmail.com

이번 릴리즈는 초반 rc 들이 좀 커서 걱정을 끼쳤었는데, rc4 는 다행히도
작아졌다고 합니다.  딱히 별다른 게 없다는군요.
