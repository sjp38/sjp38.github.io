+++
title = "Lkml_news_v4.18 Rc1"
date = 2018-06-17T11:59:59+09:00
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

Linux 4.18-rc1
--------------

https://lkml.kernel.org/r/CA+55aFw34Dh6p0qAZ_Ja=fjuJ89ojZZTWtmrRPKmB1QuP3C7hw@mail.gmail.com

평소보다 많이 빠르게 4.18 머지윈도우가 닫혔습니다.  토발즈가 지금 일본에 있기 때문에 자기는 이미 일요일이고, 오후엔 뱃놀이 하러 갈거라서 일찍 릴리즈 한다네요.

전체적으로 크기에서도 한 일에 있어서도 평범한 릴리즈입니다.  4.17 에서 더이상 사용되지 않는 과거 코드 삭제를 많이 했던 것처럼 이번에도 미사용 코드 제거가 좀 있군요, 하지만 4.17 때만큼 큰 변화는 아닙니다.

제거된 컴포넌트들 가운데 특이할만한 점은 Lustre 의 제거군요.  Staging 트리에서 머물던 Lustre 는 계속 out of tree 로 개발이 진행되어왔고, Staging 딱지를 떼지 못한채 커널 소스트리에서 제거되게 되었습니다.


[PATCH v7 REBASED 00/17] Improve shrink_slab() scalability (old complexity was O(n^2), new is O(n))
---------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/152931465724.27697.12828290733260370115.stgit@localhost.localdomain

지난번에도 소개한 패치의 v7 입니다.  시스템에 여러 shrinker 들과 memcg cgroup
이 등록되어 있는 경우 이 shrinker 의 갯수를 n 이라 할 때 O(n^2) 의 time
complexity 로 `shrink_slab()` 수행시간이 늘어나게 되어있는데 이 문제를 해결한
패치입니다.  이 문제를 보기 위해 다음과 같은 테스트를 사용했습니다.

```
$echo 1 > /sys/fs/cgroup/memory/memory.use_hierarchy
$mkdir /sys/fs/cgroup/memory/ct
$echo 4000M > /sys/fs/cgroup/memory/ct/memory.kmem.limit_in_bytes
$for i in `seq 0 4000`;
        do mkdir /sys/fs/cgroup/memory/ct/$i;
        echo $$ > /sys/fs/cgroup/memory/ct/$i/cgroup.procs;
        mkdir -p s/$i; mount -t tmpfs $i s/$i; touch s/$i/file;
done
$time echo 3 > /proc/sys/vm/drop_caches
```

ct/0 부터 ct/4000 까지 4001개의 메모리 cgroup 들을 만들어 놓고 tmpfs 를 만든 후
거기 파일을 만들어 메모리를 소모하게 한 후 `drop_caches` 를 통해
`shrink_slab()` 이 발동되게 했군요.  패치 저자의 환경에서의 테스트 결과는
다음과 같습니다:
```
0.00user 13.78system 0:13.78elapsed 99%CPU
0.00user 5.59system 0:05.60elapsed 99%CPU
0.00user 5.48system 0:05.48elapsed 99%CPU
0.00user 8.35system 0:08.35elapsed 99%CPU
0.00user 8.34system 0:08.35elapsed 99%CPU
```

이 패치셋은 time complexity 가 O(n) 이 되도록 합니다.  패치셋이 적용된 후의
테스트 결과는 다음과 같이 548배 이상 개선되었습니다!
```
0.00user 1.10system 0:01.10elapsed 99%CPU
0.00user 0.00system 0:00.01elapsed 64%CPU
0.00user 0.01system 0:00.01elapsed 82%CPU
0.00user 0.00system 0:00.01elapsed 64%CPU
0.00user 0.01system 0:00.01elapsed 82%CPU
```


[PATCH 00/11] docs/mm: add boot time memory management docs
-----------------------------------------------------------

https://lkml.kernel.org/r/1529341199-17682-1-git-send-email-rppt@linux.vnet.ibm.com

초기 부팅 시점에서의 메모리 관리에 대한 문서화를 개선하고 이에 대한 문서를
추가하는 패치입니다.  추가된 문서는 Documentation/core-api/boot-time-mm.rst 에
있습니다.
