+++
title = "LKML News v5.0-rc4"
date = 2019-01-28T09:21:25+09:00
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

`[PATCH 0/5] [v4] Allow persistent memory to be used like normal RAM`
---------------------------------------------------------------------

https://lkml.kernel.org/r/20190124231441.37A4A305@viggo.jf.intel.com

PMEM 을 평범한 RAM 처럼 접근할 수 있게 해주는 드라이버를 소개하는 패치셋의
네번째 버전입니다.  인터페이스적 측면에서 개선이 많이 됐고, 패치에 대한 소개도
많이 좋아졌네요.

이 패치셋이 의도하는 PMEM 은 Intel Optane DC persistent memory 와 같은 NVDIMM
입니다.  휘발성이 없고, flash 보다 빠르고, RAM 에 비해 가격 경쟁력이 좋죠.

RAM-based NVDIMM 은 의도한 대상이 아닙니다.  그것들은 RAM 대비 가격 경쟁력이
없기 때문이라는군요.


[LSF/MM TOPIC] NUMA remote THP vs NUMA local non-THP under MADV_HUGEPAGE
------------------------------------------------------------------------

https://lkml.kernel.org/r/20190129234058.GH31695@redhat.com

제목 그대로입니다.  NUMA remote THP 를 쓰는게 나을까요?  THP 를 포기하고 NUMA
local regular page 를 쓰는게 나을까요?  이에 대해서 LSF/MM 에서 이야기 하고
싶다는군요.


Linux 5.0-rc4
-------------

https://lkml.kernel.org/r/CAHk-=wgNph26eD1zhP91LQLrwB91QPy4=d82SPfvYmSexV7UpQ@mail.gmail.com

어느새 네번째 rc.  이제 5.0 이 그리 멀지 않았네요.  주말 쯤에 갑자기 많은
패치가 밀려왔다고 하지만 큰 문제는 없었다고 합니다.
