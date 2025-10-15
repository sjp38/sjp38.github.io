+++
title = "Lkml_news_v4.18"
date = 2018-08-13T10:50:27+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

Linux 4.18
----------

https://lkml.kernel.org/r/CA+55aFzos7tr=OLju10Oe-z7r=eB2dSaFa7vwz2ApGO13B=z_g@mail.gmail.com

자, 오랫만에 rc 버전을 8개나 내며 긴 안정화 기간을 거친 4.18 버전이 릴리즈
되었습니다.  따라서 지난주는 조용해야 했고 실제로 조용했지만 그럼에도 불구하고
vfs 레이스 컨디션 문제 수정 등의 변경도 있긴 했습니다.  이번 정식 릴리즈로
포함된 기능 중 개인적으로는 Restartable Sequence 가 눈에 띄고 흥미롭군요.  아마
2015년? 인가에 서울에서 커널 서밋 열려서 거기서 발표 들었을 때부터
관심있었거든요.  유저스페이스에서 이 기능을 잘 사용하면 멀티코어 성능확장성에
큰 개선이 가능할 것 같습니다.

어쨌건, 이로써 4.19 버전을 향한 머지 윈도우가 열렸습니다.  5.x 는 언제
시작되려나요?


[GIT PULL] XArray for 4.19
--------------------------

https://lkml.kernel.org/r/20180813161357.GB1199@bombadil.infradead.org

이 블로그에서도 몇번 소개한 XArray 의 개발자, Matthew 가 충분히 리뷰도 받고
수정도 했다고 생각하는 것 같습니다.  4.18 릴리즈와 함께 열린 4.19 머지윈도우에
XArray 풀리퀘스트를 리누스 토발즈에게 던졌군요!

이 풀리퀘스트는 XArray 의 구현과 `pagecache` 가 XArray 를 사용하도록 하는
변경을 담고 있습니다.

그러나, 리눅스는 이 패치셋을 받아들이지 않기로 결정했습니다.  XArray 자체에
문제가 있어서느 아니고, 이 패치셋이 `libnvdimm` 소스트리 위에서 만들어졌기
때문입니다.  `-next` 트리 관리자가 그렇게 하자고 조언한 것 같은데, 어쨌든
Mattew 에겐 안됐지만 다음 버전에서 머지되길 기대해야겠군요.


[PATCH v3 0/3] docs/core-api: add memory allocation guide
---------------------------------------------------------

https://lkml.kernel.org/r/1534517236-16762-1-git-send-email-rppt@linux.vnet.ibm.com

메모리 관리쪽 커널 문서가 지속적으로 업데이트 되고 있습니다.  개인적으로는
커널을 공부할 때 공식 문서를 선호하는 편이라 반가운 일이군요.
