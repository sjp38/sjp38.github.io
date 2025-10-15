+++
title = "Lkml_news_v4.18 Rc4"
date = 2018-07-09T10:01:05+09:00
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

Linux 4.18-rc4
--------------

`https://lkml.kernel.org/r/CA+55aFwXGyZ1Yx+Z8a93gpvb596ZRJ5ppiQL_+-k7gjeQLtcsQ@mail.gmail.com`

어느덧 네번째 RC 버전 릴리즈입니다.  지루할 정도로 평범한 릴리즈라는군요.
대부분 드라이버쪽 업데이트이고, bpf, cifs, ext4, 스케쥴러, 그리고 일부 arch
업데이트가 대부분입니다.


[PATCH v9 00/17] Improve shrink_slab() scalability (old complexity was O(n^2), new is O(n))
-------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/153112469064.4097.2581798353485457328.stgit@localhost.localdomain

`shrink_slab()` 의 compexity 를 O(n^2) 에서 O(n) 으로 낮춰 확장성을 높인 패치의
아홉번째 버전입니다.


[PATCH 0/2] CMA: remove unsupported gfp mask parameter
------------------------------------------------------

https://lkml.kernel.org/r/20180709122018eucas1p277147b1e6385d552b5a8930d0a8ba91c~-sqSan6292733527335eucas1p2-@eucas1p2.samsung.com

`cma_alloc()` 과 `dma_alloc_from_contiguous()` 함수는 gfp mask 패러미터를
받지만 실질적으론 `__GFP_NORARN` 플래그만을 지원하고 있습니다.  이 패치는
따라서 해당 패러미터를 `no_warn` 이란 이름의 boolean 타입으로 교체합니다.


[RFC PATCH] mm, page_alloc: double zone's batchsize
---------------------------------------------------

https://lkml.kernel.org/r/20180711055855.29072-1-aaron.lu@intel.com

리눅스 커널 페이지 할당자는 잘 알려진 Buddy allocator 입니다만, 멀티 CPU
환경에서의 컨텐션을 줄이기 위해 per-CPU pageset 이란 걸 존별로 가지고 있어서
Buddy allocator 로부터는 한번에 듬뿍 페이지를 할당받아와 CPU 별 pageset 에
넣어두고서 여기서 한동안 할당받고, 이게 텅 비었을 때 buddy allocator 에게 다시
여러개 page 를 할당받습니다.  이런 형태를 batching 이라고 하죠.

이 batch 크기, 즉 한번에 buddy allocator 에서 할당받는 페이지의 갯수는 적정해야
합니다.  이 값이 10년전에 두배로 커져 31이 된 후 유지되고 있습니다.  따라서
오늘날에는 이 값이 너무 작다는 생각이 있어 다시 한번 두배로 늘리는 (31에서 63
으로) 패치입니다.

will-it-scale/page_fault1, ebizzy, oltp, kbuild, pigz, netperf, vm-scalability
등의 벤치마크를 사용했군요.

전체적으로 성능 향상이 있었지만 batch 크기가 커진만큼 실제 buddy allocator 에게
할당을 요청할 때 반응시간이 느려지는 문제가 있긴 합니다.


[PATCH v2] kvm/x86: Inform RCU of quiescent state when entering guest mode
--------------------------------------------------------------------------

https://lkml.kernel.org/r/20180711180101.3711464-1-dwmw2@infradead.org

RCU reader critical section 은 가능한 빨리 끝나야 합니다.  그렇지 않으면 grace
period 가 길어져 시스템 메모리 사용량이 늘어날 수 있죠.  RCU reader critical
section 내에서의 sleeping 을 하지 못하게 함으로써 리눅스 커널은 이를 가능하게
합니다만, VM 환경에서는 reader critical section 내에서 VM 자체가 CPU 를 놓을 수
있으므로 critical section 이 길어지는 문제가 가능합니다.  이 패치는 guest mode
에 들어갈 때 이에 관한 정보를 알림으로써 이 문제를 해결할 수 있게 합니다.
