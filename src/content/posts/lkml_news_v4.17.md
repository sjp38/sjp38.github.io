+++
title = "LKML News after v4.17"
date = 2018-06-04T11:29:16+09:00
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

Linux 4.17
----------

https://lkml.kernel.org/r/CA+55aFxhx_tKGm02UySguvbyfB_7oTF31QfgOHCK0YkBvmfV0g@mail.gmail.com

4.17 버전 리눅스 릴리즈입니다.  지난주에 토발즈가 이야기한 것처럼 별다른 지연
없이 릴리즈 되었군요.

`git object` 의 갯수라던지 릴리즈를 위한 스크립트 등이 리눅스 5.x 버전으로의
메이저 버전 업데이트가 될 준비가 되었다고 하지만 토발즈는 딱히 5.x 로 아직은
넘어갈 생각이 없군요.  너무 멀지 않은 미래에 넘어가겠지만, 적어도 지금은
아니라고 합니다.

항상 그렇듯 이 릴리즈는 4.18을 위한 머지 윈도우의 시작이기도 한데, 토발즈는
두번째 주에 여행을 갈거라 가능하면 첫째주에 중요한 머지를 마무리 했으면 한다고
하네요.


[PATCH v13 00/72] Convert page cache to XArray
----------------------------------------------

https://lkml.kernel.org/r/20180611140639.17215-1-willy@infradead.org

Radix tree 를 대체하기위한 목적으로 Matthew Wilcox 가 개발중인 XArray 의 구현과
Page cache 가 이 자료구조를 사용하도록 변경하는 패치의 13번째 버전입니다.  작년
OSSummit Europe 에서 처음 XArray 에 대한 발표를 들었는데 계속 발전중인 것
같군요.


Re: [4.17 regression] Performance drop on kernel-4.17 visible on
----------------------------------------------------------------

https://lkml.kernel.org/r/20180607110713.GJ32433@dhcp22.suse.cz

4.16 대비 4.17 의 NUMA 시스템에서 Stream, Linpack, NAS 벤치마크 성능이 크게
떨어졌다는 레포트입니다.  최대 50% 까지의 성능 하락이 있었군요.
