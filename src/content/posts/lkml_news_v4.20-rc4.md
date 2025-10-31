+++
title = "LKML News by v4.20-rc4"
date = 2018-11-26T08:06:40+09:00
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

[PATCH -V7 00/21] swap: Swapout/swapin THP in one piece
-------------------------------------------------------

https://lkml.kernel.org/r/20181120085449.5542-1-ying.huang@intel.com

Transparent Huge Page 를 쪼개지 않고 swap out / swap in 함으로써 스왑 성능을
최적화 하는 패치의 일곱번째 버전입니다.  이 블로그에서도 소개한 바 있죠.  크게
바뀐 부분은 없지만 최신 버전에 맞춰 리베이스 되었고, Daniel 에 의해 발견된 주소
정렬 관련 문제를 해결했군요.


[PATCH 0/5] Fragmentation avoidance improvements v5
---------------------------------------------------

https://lkml.kernel.org/r/20181123114528.28802-1-mgorman@techsingularity.net

시스템이 충분히 오래 운영되거나 특정한 패턴의 워크로드가 동작하게 되면 시스템의
메모리는 fragment 되게 마련이어서, 장기적으로 물리적 연속 페이지 할당이
실패하게 됩니다.  이 패치셋은 메모리 분절화를 야기하는 워크로드 (이벤트)를
정의하고 그런 이벤트의 발생을 줄이는 내용을 담고 있습니다.

최적화 방법은 다음과 같습니다.  먼저, lower id free list 가 사용 가능하면 high
order free list 를 쪼개기보다 그걸 먼저 사용합니다.  메모리 분절화 이벤트가
발생하면 임시적으로 워터마크를 높입니다.  kswapd 가 일어나서 적은양의 오래된
메모리를 리클레임하고, 이어서 kcompactd 가 일어나서 시스템 메모리 연속성을
복구시킵니다.  물론 이는 오버헤드를 추가합니다.  마지막으로, kswapd 가 진전을
일으킬 수 있도록 일부 movable 페이지 할당을 기다리게 합니다.  이 기다리는 시간
역시 오버헤드와 연관되므로 적절히 맞춰질 필요가 있겠죠.

이 패치셋을 적용한 결과 94% 이상 메모리 분절화를 줄일 수 있었다고 합니다.


[GIT PULL] XArray updates
-------------------------

https://lkml.kernel.org/r/20181124173209.GZ3065@bombadil.infradead.org

XArray 는 작년 OSSummit 에서 처음 발표를 들은 후 주의 깊게 보고 있었는데 이번에
머지되었고 커널 서밋에서도 발표를 들었는데 매우 인상적이었습니다.  DAX 가
XArray 를 사용하도록 수정한 후 DAX 의 버그가 발견되었고, 그에 대한 수정을
포함한 수정사항들을 담은 풀 리퀘스트입니다.


Linux 4.20-rc4
--------------

https://lkml.kernel.org/r/CAHk-=wgdsXyCaLsFEpyUpAeRqVS69u=xo4rzEN+cS=xwz2gajg@mail.gmail.com

4.x 의 마지막이 될 예정인 4.20을 향한 네번째 rc 버전 릴리즈입니다.  변경의 60
퍼센트가 드라이버고, 나머진 네트워킹, 파일시스템쪽 수정과 arch, 문서화
업데이트고 xarray 쪽 수정도 있었군요.  평소와 다를바 없어서 평이한 릴리즈라 할
수 있지만, STIBP 수정이라던지 mm 쪽 수정에 대한 논의가 안끝났다던지 하는 부분은
남아있다는군요.

한가지 지난 릴리즈 때 이야기 할 것을 빼먹은 것도 이야기 하는데, 풀 리퀘스트에
대한 응답 메일을 Konstantin 이 자동화 했기 때문에 더이상 토발즈 자신이 하나하나
답장을 보내지 않는다는 겁니다.  그리고 이 자동화의 구성상 LKML 의 `linux-*`
그룹을 cc 하지 않으면 ack 을 주지 않는데, 그걸로 인해 혼동이 있을 수 있었겠다고
하는군요.
