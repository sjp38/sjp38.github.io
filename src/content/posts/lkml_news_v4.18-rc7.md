+++
title = "LKML News after v4.18-rc7"
date = 2018-07-30T08:49:12+09:00
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

Linux 4.18-rc7
--------------

https://lkml.kernel.org/r/CA+55aFxpFefwVdTGVML99PSFUqwpJXPx5LVCA3D=g2t2_QLNsA@mail.gmail.com

일곱번째 rc 릴리즈입니다.  별다른 일 없으면 다음주에 4.18이 릴리즈 되겠다고
토발즈도 이야기 하는군요.


[PATCH v4 0/6] kmalloc-reclaimable caches
-----------------------------------------

https://lkml.kernel.org/r/20180731090649.16028-1-vbabka@suse.cz

내부적으로 SLAB 할당자를 사용하는 kmem cache 들은 `SLAB_RECLAIM_ACCOUNT`
플래그를 가지고 생성될 경우에 시스템 메모리가 부족한 경우 기존에 할당받은
오브젝트들을 회수해도 좋다고 알리게 됩니다.

일반적인 kmem cache 들은 이 플래그 없이 생성되서는 시스템의 메모리가 부족한
경우에 회수되어도 좋은 오브젝트의 할당에 사용되기도 하는데, 다양한 크기의
오브젝트들은 `SLAB_RECLAIM_ACCOUNT` 플래그를 가진 하나의 kmem cache 에서 처리될
수 없기 때문이죠.  `dcache` 의 `external name` 들이 그 예입니다.

이와 비슷한 경우들을 해결하기 위해 이 패치셋은 kmalloc cache 에
SLAB_RECLAIM_ACCOUNT  와 비슷한 특성을 갖는 변종을 kmalloc-rcl-x 라는 이름으로
만들었습니다.  kmalloc() 시에 `__GFP_RECLAIMABLE` 플래그를 넣으면 이 캐시에서
메모리가 할당됩니다.


`[PATCH] swap: Use __try_to_reclaim_swap() in free_swap_and_cache()`
--------------------------------------------------------------------

https://lkml.kernel.org/r/20180803123014.15431-1-ying.huang@intel.com

스왑 엔트리를 회수하는 코드 경로는 `free_swap_and_cache()` 가 있고
`__try_to_reclaim_swap()` 이 있는데, 코딩 스타일 빼고는 실제 하는 일이 거의
똑같습니다.  이 패치는 `free_swap_and_cache()` 에서 내부적으로
`__try_to_reclaim_cache()` 를 사용하게 함으로써 코드의 가독성을 높이고 잠재적
버그를 줄였습니다.
