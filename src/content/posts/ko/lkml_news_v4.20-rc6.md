+++
title = "LKML News by v4.20-rc6"
date = 2018-12-05T08:20:36+09:00
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

[PATCH memory-model 0/3] Updates to the formal memory model
-----------------------------------------------------------

https://lkml.kernel.org/r/20181203230411.GA27476@linux.ibm.com

리눅스 커널 메모리 모델의 업데이트 입니다.

`smp_mb__after_unlock_lock()` 을 추가로 모델링했고, github 리트머스 테스트를
체크하기 위한 스크립트가 추가되었으며, `-j` 옵션을 서포트 하게 되었습니다.


[tip:core/rcu] tracing: Replace synchronize_sched() and call_rcu_sched()
------------------------------------------------------------------------

https://lkml.kernel.org/r/tip-7440172974e85b1828bdd84ac6b23b5bcad9c5eb@git.kernel.org

`synchronize_rcu()` 가 이제는 RCU read-side 크리티컬 섹션 만이 아니라
preempt-disable 코드 영역도 기다리므로, `synchronize_sched()` 를 대체할 수
있고, `call_rcu_sched()` 도 `call_rcu()` 로 대체될 수 있습니다.  이 패치는 이
대체를 진행하고 있습니다.


[PATCH -V8 00/21] swap: Swapout/swapin THP in one piece
-------------------------------------------------------

https://lkml.kernel.org/r/20181207054122.27822-1-ying.huang@intel.com

이 블로그를 통해 여러번 공유한 THP 를 통째로 스왑아웃 / 스왑인 하는 패치입니다.
Daniel 에 의해 레포트된 버그 하나를 고쳐서 여덟번째 버전이 올라왔습니다.


Linux 4.20-rc6
--------------

https://lkml.kernel.org/r/wgHSX8x6mOB0xZibbg-xc3veqsQEnHZ1+3H2DbO5MU5Rw@mail.gmail.com

지난 rc5 릴리즈는 평소와 달리 굉장히 규모가 컸기에 걱정이 있었죠.  이번
릴리즈에는 확연히 변경의 양이 줄어들었다고 합니다.  뭔가 다시 정상적으로 간다는
거죠.  토발즈는 어쨌건 4.20 릴리즈 전에 최소한 하나의 rc 릴리즈는 더 있을
거라고 하는군요.  하지만 여전히 크리스마스 휴일 시즌을 위해 크리스마스 전에
릴리즈를 마치고, 이후 일주일은 푹 쉴테니 그전에 풀리퀘스트도 준비해 두라고
하네요.
