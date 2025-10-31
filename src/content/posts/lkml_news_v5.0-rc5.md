+++
title = "LKML News v5.0-rc5"
date = 2019-02-04T09:18:08+09:00
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

[LSF/MM TOPIC] Page flags, can we free up space ?
-------------------------------------------------

https://lkml.kernel.org/r/20190122201744.GA3939@redhat.com

리눅스 커널의 page 정보는 `PG_` 로 시작하는 플래그를 사용해 현재 상태를
알리는데요, 이걸 저장하는데 사용되는 공간을 더 줄일 수 있을지에 대한 논의를
해보고 싶다는 LSF/MM 제안입니다.


[LSF/MM TOPIC] Use NVDIMM as NUMA node and NUMA API
---------------------------------------------------

https://lkml.kernel.org/r/f0d66b0c-c9b6-a040-c485-1606041a70a2@linux.alibaba.com

알리바바에서는 NVDIMM 을 클라우드 고객들에게 싼 비용의 메모리로 제공하려
한다는군요.  이를 위해 여러 필요성이 있고, 현재 NUMA API 로는 모든 경우를
커퍼하기가 어렵다고 합니다.  때문에, LSFMM 에서 어떤 use-case 와 needs 가
있는지 공유하고 더 나은 NUMA API 에 대해 논의하고자 하는군요.


[LSF/MM TOPIC] memory reclaim with NUMA rebalancing
---------------------------------------------------

https://lkml.kernel.org/r/20190130174847.GD18811@dhcp22.suse.cz

NVDIMM 을 싸고 무척 느린 NUMA 노드로 인식되고 사용되게끔 하고자 하는 노력들이
있습니다.  이게 완벽하게 동작하려면 hot page 는 가깝고 빠른 NUMA node 에, cold
page 는 멀고 느린 NUMA node 에 위치되도록 커널이 조정해줄 필요가 있겠죠.  NUMA
balancing 기능이 있긴 하지만 cold page 를 멀고 느린 NUMA node 로 보내는 기능은
현재까지는 없습니다.  이에 대한 논의를 LSF/MM 에서 시작해 보자고 하네요.


Linux 5.0-rc5
-------------

https://lkml.kernel.org/r/CAHk-=wjoGOgYFCbpazT2Fyv=zHaiagU5PhmiAfrZ5DOmE-y0rg@mail.gmail.com

아무래도 이번 릴리즈들은 머지 윈도우가 길고 연휴와 함께 있었던 탓인지
전체적으로 뭔가 변경사항이 줄지 않는듯 보였는데, 드디어 변경사항이 줄어들고
있다고 합니다.  좋은 신호죠.
