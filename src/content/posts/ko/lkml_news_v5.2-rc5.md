+++
title = "LKML News v5.2-rc5"
date = 2019-06-10T10:17:29+09:00
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

[PATCH v3 0/5] THP aware uprobe
-------------------------------

https://lkml.kernel.org/r/20190612220320.2223898-1-songliubraving@fb.com

uprobe 는 THP 로 되어있는 페이지를 쪼갭니다.  이로 인해 성능 향상 효과가
사라지죠.  이 패치셋은 uprobe 가 THP 를 인식하게 해서 이런 문제를 제거합니다.


[PATCH v2 0/5] Introduce MADV_COLD and MADV_PAGEOUT
---------------------------------------------------

https://lkml.kernel.org/r/20190610111252.239156-1-minchan@kernel.org

기존에도 소개한 MADV_COLD 와 MADV_PAGEOUT 을 madvise() 에 추가하는 패치셋의
두번째 버전입니다.  이 패치셋을 ChromeOS 팀의 Brian Geffon 은 가져다가 탭이
백그라운드로 들어가고 45초 이상 그 상태를 유지하면 이 기능을 사용해서 페이지를
proactively swap out 시켰는데, 그 결과 tab 전환 속도가 25% 나 빨라졌다고
합니다.


[v3 RFC PATCH 0/9] Migrate mode for node reclaim with heterogeneous memory hierarchy
------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1560468577-101178-1-git-send-email-yang.shi@linux.alibaba.com

NUMA node 로 pmem 을 취급할 수 있게 된 이후, 노드간 migration 을 보다
효율적으로 하기 위한 패치셋의 세번째 버전입니다.  LSFMM 에서 이에 대해 토의가
있었는데, 이번 버전은 그에 기반해 수정되었다고 하네요.


Linux v5.2-rc5
--------------

https://lkml.kernel.org/r/CAHk-=whEQPvLpDbx+WR4Q4jf2FxXjf_zTX3uLy_6ZzHtgTV4LA@mail.gmail.com

지난주는 토발즈의 여행 때문에 릴리즈가 평소보다 조금 빨리 이루어졌는데요,
이번에도 마찬가지입니다.  앞으로도 2주동안 여행ㅇ을 더 한다네요.

어쨌든 5.2 가 가까워졌습니다.  어느덧 rc5군요.  rc4 대비 사이즈도 많이
줄어들었습니다.  SPDX 업데이트도 없는 덕에 diff 도 깔끔하게 되었구요.
