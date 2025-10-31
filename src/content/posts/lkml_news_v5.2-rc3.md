+++
title = "LKML News v5.2-rc3"
date = 2019-05-28T23:28:37+09:00
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

[PATCH tip/core/rcu 0/12]
-------------------------

https://lkml.kernel.org/r/20190530145204.GA28526@linux.ibm.com

Paul E. McKenney 로부터의 RCU flavor consolidation 관련 추가 작업과 코드 정리를
위한 패치셋입니다.


[PATCH tip/core/rcu 0/2] Documentation updates for v5.3
-------------------------------------------------------

https://lkml.kernel.org/r/20190530145504.GA29820@linux.ibm.com

RCU 문서 업데이트를 담고 있는 패치셋입니다.  `rcuref` 의 실제 예제와
`rcu_task_stall_timeout` 의 정의에 대한 내용이 추가되었군요!


[PATCH tip/core/rcu 0/21] Torture-test updates for v5.3
-------------------------------------------------------

https://lkml.kernel.org/r/20190530151650.GA422@linux.ibm.com

RCU 와 spinlock 등을 위해 사용되는 torture 테스트 업데이트를 담은 패치셋입니다.
무려 21개 패치네요!


[RFCv2 0/6] introduce memory hinting API for external process
-------------------------------------------------------------

https://lkml.kernel.org/r/20190531064313.193437-1-minchan@kernel.org

다른 어플리케이션의 virtual memory 에 대해 madvise() 를 할 수 있게 하고
`MADV_COLD` 등의 힌트를 추가한 패치셋의 두번째 RFC 버전입니다.  LWN 에서도
소개되었고 관련 반응이 매우 뜨겁네요.  저도 매우 흥미롭게 보고 있습니다.
두번째 버전에서는 `MADV_COOL` 은 빠졌습니다.  `MADV_COLD` 와 `MADV_PAGEOUT` 만
남았군요.


Linux 5.2-rc3
-------------

`https://lkml.kernel.org/r/CAHk-=wg1evGTxx-aSNHO+m5xSa1sc6fQe7Y8fH=_ruGcwMyfyA@mail.gmail.com`

상당히 고요한 한 주였고, 그로 인해 rc3 는 rc2 와 사이즈가 비슷했습니다.  이는
조금 이상한 일인데, 보통 rc2 이후로는 사람들이 드디어 문제를 파악하기 시작하고
rc3 주간에 수정을 하느라 조금은 떠들썩해 왔기 때문이랍니다.
