+++
title = "LKML News after v4.16-rc1"
date = 2018-02-13T13:56:47+09:00

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
#[header]
#image = ""
#caption = ""
#preview = true

+++


Linux 4.16-rc1
--------------

https://lkml.kernel.org/r/CA+55aFzXVqgCMhPL9EaMW_D9E=HCQ9+JSQAbBPe3Oa_iQtky=g@mail.gmail.com

어느덧 2주일이 지났습니다.  머지 윈도우가 닫히고 4.16 첫번째 rc 버전이
나왔습니다.  4.15는 역시 토발즈에게 고통스러웠던 시간이었던지 이번 머지
윈도우는 4.15 보다 훨씬 나았다는 토발즈의 이야기입니다.

이번 릴리즈에서는 GPU 쪽 변경 사항이 많고 대부분은 드라이버라 아주 큰 변화는
거의 없지만, 여전히 arch 쪽에도, 네트워킹과 파일시스템 등에도 변경이 없지는
않다고 정리하고 있습니다.
스펙터 / 멜트다운 이슈에 대한 x86 외 아키텍쳐의 변경사항들도 들어왔군요.


[PATCH v8 00/24] Speculative page faults
----------------------------------------

https://lkml.kernel.org/r/1518794738-4186-1-git-send-email-ldufour@linux.vnet.ibm.com

4.15 릴리즈와 함께 4.15 위로 포팅된 Speculative page faults 패치가 계속
올라오고 있습니다.  이 패치셋은 예전부터 제가 관심을 두고 보고 있는 패치인데,
page fault handling 을 speculative 하게 함으로써 병렬성을 높이려는 패치입니다.
아이디어가 시작된 건 오래되었고 그 아이디어를 이어와 다시 제안되고 있는
패치이죠.  이번엔 업데이트 될런지 궁금하네요.


[PATCH -mm -v5 RESEND] mm, swap: Fix race between swapoff and some swap operations
----------------------------------------------------------------------------------

https://lkml.kernel.org/r/20180213014220.2464-1-ying.huang@intel.com

swapin 작업과 swapoff 작업 사이를 락으로 보호하지 않고 있기 때문에 segmentation
fault 문제가 있을 수 있습니다.  swapoff 가 자주 불리진 않다보니 이 문제가 크게
불거진 적 없는데, 어쨌건 race 는 race 라 고쳐야 한다는 Huang Ying 의
패치입니다.
