+++
title = "LKML News after v4.16-rc7"
date = 2018-03-26T08:45:19+09:00
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

Linux 4.16-rc7
--------------

https://lkml.kernel.org/r/CA+55aFxpxHnWBeTXN+DKqwCMW_=T2cR8UxSBVk_6c8LL7Et5JQ@mail.gmail.com

4.16을 향한 일곱번째 rc 가 릴리즈 되었습니다.  평소대로라면 이게 마지막 rc 여야
할텐데, 평소와 다름없거나 변경사항이 적은 편이던 그동안의 rc와 달리 이번 rc 는
좀 변경사항이 많군요.  그렇다곤 해도 아마도 네트워킹 쪽 코드 머지가 늦었기
때문으로 보이며 rc8을 릴리즈할 생각은 아직은 없다고 토발즈는 이야기 하네요.

더불어, 토발즈가 rc 릴리즈 때마다 변경 사항들을 정리하기 위해 주로 사용하는 git
사용 스크립트를 공개했습니다.

다음주는 4.16이 릴리즈 될까요?  아니면, rc8이?


[PATCH] mm/list_lru: replace spinlock with RCU in `__list_lru_count_one`
------------------------------------------------------------------------

https://lkml.kernel.org/r/1522137544-27496-1-git-send-email-lirongqing@baidu.com

`list_lru_count_one()` 이 스핀락을 잡기 때문에 `shrink_slab()` 이 많은 시간을
소모하게 되는데, 이를 스핀락 대신 RCU 를 사용하게 해서 최적화 시킨 패치입니다.

`dd` 를 사용해 커다란 메모리를 사용한 후 파일을 제거하고서
`/cgroup/memory/test/memory.limit_in_bytes` 의 크기를 작게 잡아 인위적으로
reclaim 을 유발시키고 여기에 걸리는 시간을 측정했군요.  기존 0.415초에서 최적화
후 0.395초로 개선되었습니다.


[PATCH v10 00/62] Convert page cache to XArray
----------------------------------------------

https://lkml.kernel.org/r/20180330034245.10462-1-willy@infradead.org

XArray 패치 중 일부가 이미 Andrew Morton 의 -next 트리에 들어갔습니다.  Matthew
Wilcox 는 XArray 를 활용하는 패치를 이어서 계속 올리고 있군요.


[PATCH] mm: limit a process RSS
-------------------------------

https://lkml.kernel.org/r/1522386674-12047-1-git-send-email-lirongqing@baidu.com
 
`ulimit -m` 명령을 이용해 프로세스의 최대 RSS (Resident Set Size) 를 제어할 수
있는 인터페이스가 있지만 실제로 커널이 제한을 하고 있진 않습니다.  제한하도록
구현하는 패치입니다.
