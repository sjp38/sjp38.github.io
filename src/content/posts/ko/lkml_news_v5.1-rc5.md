+++
title = "LKML News v5.1-rc5"
date = 2019-04-09T17:33:01+09:00
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

[v2 RFC PATCH 0/9] Another Approach to Use PMEM as NUMA Node
------------------------------------------------------------

https://lkml.kernel.org/r/1554955019-29472-1-git-send-email-yang.shi@linux.alibaba.com

본 블로그를 통해 지속적으로 소개하고 있는, PMEM as NUMA node 를 위한, 보다 나은
hotness 기반 page location 을 위한 패치셋입니다.
기존 코멘트에 기반해서 두번째 버전을 내놓았군요.


[RFC PATCH v3 00/15] Slab Movable Objects (SMO)
-----------------------------------------------

https://lkml.kernel.org/r/20190411013441.5415-1-tobin@kernel.org

최근 LWN 에서도 소개된 (https://lwn.net/Articles/784964/) 패치입니다.
Slab allocator 에서 할당된 object 가 free page 가운데에 박혀 있어 page 를
회수할 수 없는 fragmentation 이 발생합니다.
이 패치셋은 slab allocator 로 할당된 object 의 사용자에게 가능하면 해당 object
들을 움직여 달라고 callback 할 수 있게 함으로써 이 fragmentation 을 해결하려
합니다.

앞의 버전에 비해서 변경된 건 LWN 기사에 달린 코멘트를 기반으로 한 개선들이군요.


[LSF/MM TOPIC] guarantee natural alignment for kmalloc()?
---------------------------------------------------------

https://lkml.kernel.org/r/790b68b7-3689-0ff6-08ae-936728bc6458@suse.cz

LSFMM 을 위한 늦은 주제네요.
kmalloc() 이 2의 승수 크기 얼라인먼트를 지키도록 하는 패치에 대해서 논의하고
싶어합니다.


Linux 5.1-rc5
-------------

https://lkml.kernel.org/r/CAHk-=wjvcuyCQGnfOhooaL1H4H63qXO=xgo+9yncSOG=eK+kbA@mail.gmail.com

다섯번째 rc 커널입니다.  v5.1이 얼마 남지 않았군요.
이번 릴리즈에선 대부분 드라이버 쪽 변경이 있었으며, 딱히 이상하거나 수상한
움직임은 없다고 합니다.
