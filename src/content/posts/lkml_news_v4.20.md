+++
title = "LKML News for v4.20"
date = 2018-12-21T08:35:03+09:00
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

[PATCH V5 0/3] mm/kvm/vfio/ppc64: Migrate compound pages out of CMA
-------------------------------------------------------------------

https://lkml.kernel.org/r/20181219034047.16305-1-aneesh.kumar@linux.ibm.com

ppc64 에서는 guest os page table 을 CMA area 내에 할당하는데, VFIO 를 쓰는 경우
이게 pinning 되어 있다 보니 CMA area 밖으로 migrate 하는데 실패해, guest os
page table 할당에 실패하고, 이로 인해 guest 시작조차 불가능하게 되는 문제가
있었습니다.

이 패치는 compound page 에 대해서도 CMA area 밖으로의 migration 이 가능하게
합니다.


[RESEND PATCH V3 0/5] arm64/mm: Enable HugeTLB migration
--------------------------------------------------------

https://lkml.kernel.org/r/1545121450-1663-1-git-send-email-anshuman.khandual@arm.com

HugeTLB 를 통째로 migrate 할 수 있게 하는 패치입니다.


[PATCH v2 0/2] hugetlbfs: use i_mmap_rwsem for better synchronization
---------------------------------------------------------------------

https://lkml.kernel.org/r/20181218223557.5202-1-mike.kravetz@oracle.com

Hugetlbfs 와 truncation 사이에 race conditional bug 가 존재해 왔는데, 이 패치는
`i_mmap_rwsem` 을 사용해 동기화를 적용함으로써 이 race bug 를 제거합니다.


[RFC PATCH 1/2] mm: swap: check if swap backing device is congested
-------------------------------------------------------------------

https://lkml.kernel.org/r/1545115948-25467-1-git-send-email-yang.shi@linux.alibaba.com

Swap readahead 기능이 이미 다른 요청으로 바쁜 storage device 에 행해진다면 swap
자체 성능도 떨어지고 storage 를 더욱 바빠지게 해서 남들에게도 민폐가 됩니다.
`vma_cluster_radahead()` 에서 먼저 storage 의 congestion 을 체크해 보게 하는
패치입니다.


Linux 4.20 released..
---------------------

https://lkml.kernel.org/r/CAHk-=wg0zF4wa87Q5rAhFe2es0t0eExX2UjvKD7-Pghvcbt5Vw@mail.gmail.com

예정대로 4.20 이 정식 릴리즈 되었습니다.  원했던 것보단 조금 시끄러운
주간이었지만 어쨌건 연말 휴일을 방해하고 싶진 않고 정말 큰 문제가 있는 것 같아
보이진 않기에 릴리즈 했다고 합니다.

이번 정식 릴리즈에서 개인적으로 눈길 가는건 XArray 입니다.  앞으로도 많은
영역에 쓰이고자 하는 것 같던데, 향후 행보도 궁금합니다.
