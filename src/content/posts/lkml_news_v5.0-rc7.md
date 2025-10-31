+++
title = "LKML News v5.0-rc7"
date = 2019-02-18T12:30:24+09:00
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

[PATCH V15 00/18] block: support multi-page bvec
------------------------------------------------

https://lkml.kernel.org/r/20190215111324.30129-1-ming.lei@redhat.com

시스템의 RAM 이 커지고 huge page 가 널리 사용되면서 물리적으로 연속된
페이지들의 I/O 가 흔해지고 있습니다.  이를 위해 `struct bio_bvec` 이 물리적으로
연속된 여러 페이지를 다룰 수 있게 해주는 패치의 15번째 버전입니다.


Memory management facing a 400Gpbs network link
-----------------------------------------------

https://lkml.kernel.org/r/01000168e2f54113-485312aa-7e08-4963-af92-803f8c7d21e6-000000@email.amazonses.com

올해 내로 400Gbps 인피니밴드가 가능해질 거라고 합니다!  이건 프로세서-메모리
사이의 밴드위쓰를 넘길 수 있는 스피드죠!  단일 하드웨어 쓰레드는 20GB/s 이기
때문입니다.  이 재미있는 트렌드를 커널은 어떻게 대처해야 할 것인가 하는
메일입니다.


[LSF/MM TOPIC] Generating physically contiguous memory
------------------------------------------------------

https://lkml.kernel.org/r/CEDBC792-DE5A-42CB-AA31-40C039470BD0@nvidia.com

GPU, FPGA, NIC, RDMA 같은 고성능 디바이스들에게 있어 물리적 연속 메모리는 매우
중요합니다.  이 디바이스들은 내부적으로 고밀도의 computation 을 하는데 tlb miss
와 이어지는 page table walk 로 인한 성능 문제가 CPU 에 비해서도 매우 크기
때문이라는군요.

Boot time reservation 도, THP 도 유연성이 부족하기 때문에 새로운 패치도 만들고,
관련해서 LSF/MM 에서 논의해 보자는군요.


[RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit testing framework
------------------------------------------------------------------------------

https://lkml.kernel.org/r/20190214213729.21702-1-brendanhiggins@google.com

리눅스 커널은 다양한 테스트를 가지고 있지만 unit test framework 은 아직 없었죠.
그걸 만든 패치입니다!


Linux 5.0-rc7
-------------

https://lkml.kernel.org/r/CAHk-=wgvF18PqBch4=56DFwCamYpy+owngTZXGnjVbFgKq467g@mail.gmail.com

휴일을 끼고 시작된 머지 윈도우로 이래저래 걱정도 있던 5.0 릴리즈들이었습니다만
이번 rc 릴리즈는 정말 별다른 게 없네요.  매우 고요한 릴리즈였다고 합니다.
아마도 다음주에 5.0 정식 릴리즈가 될 걸로 보이네요!
