+++
title = "LKML News after v4.19-rc8"
date = 2018-10-15T15:59:17+09:00
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

Linux 4.19-rc8
--------------

https://lkml.kernel.org/r/20181015064915.GA10710@kroah.com

여덟번째 rc 버전입니다.  여전히 그렉이 릴리즈 하는군요.  여덟번째 rc 인만큼, 큰
변화는 없었고, 대부분 앞서 고친 것들에 대한 수정이었군요.  아마도 다음주에는
예상대로 4.19 버전이 나올 것 같다고 합니다.


[RFC v4 PATCH 0/5] Eliminate zone->lock contention for will-it-scale/page_fault1 and parallel free
--------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/20181017063330.15384-1-aaron.lu@intel.com

4 KB 크기 페이지를 위한 `will-it-scale/page_fault1` 워크로드를 2 소켓 112 코어
인텔 스카이레이크 서버에서 돌려보면 80% 의 CPU 시간이 `zone->lock` 을
기다리는데 소모된다고 합니다.  이는 `struct page` 의 캐시 미스 때문이라는군요.
이 패치셋은 이런 `zone->lock` 오버헤드를 없애기 위한 RFC 입니다.

일단 버디 얼로케이터에서 4 KB 크기 페이지의 머지를 건너뛰게 했는데,
이것만으로도 상기한 워크로드에서 `zone->lock` 소모시간이 35% 에서 1.1% 로
줄었다는군요.

다음으로 페이지 할당 과정에서 `free_list` 의 페이지들을 하나씩 만지지 않고
cluster 단위로 만지게 해서 `zone->lock` 오버헤드를 거의 없앴습니다.  하지만 이
cluster 단위 관리로 인한 오버헤드가 페이지 해제 과정에서의 `zone->lock` 경쟁을
0% 에서 25% 까지 증가시켰습니다.
하지만 이어지는 최적화로 이 증가된 오버헤드도 없앴군요.
