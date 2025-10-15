+++
title = "LKML News after v4.17-rc3"
date = 2018-04-30T12:59:19+09:00
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

Linux 4.17-rc3
--------------

https://lkml.kernel.org/r/CA+55aFyu=y0SBesB+vx3JZFGcOhP+tuVG7sjfrkfBhXHTe0Skg@mail.gmail.com

세번째 rc 버전이 나왔습니다.  평소보다 좀 일찍 왔군요.  rc2 에 비해 커다란
릴리즈이긴 한데, 그렇다 해도 평범한 릴리즈라고 리누스는 이야기 합니다.
대부분의 변경 사항이 드라이버 쪽 수정이기 때문이라고 하는군요.


[PATCH v4 00/16] Rearrange struct page
--------------------------------------

https://lkml.kernel.org/r/20180430202247.25220-1-willy@infradead.org

이 블로그에서도 소개했던, Matthew Wilcox 의 'struct page' 정리 패치의 네번째
버전입니다.  지난주 LSFMM 에서도 소개한 모양인데, 이 변화의 전/후를 google
spread sheet 로 정리한 문서도 여기서 공개했나보군요:
https://docs.google.com/spreadsheets/d/1tvCszs_7FXrjei9_mtFiKV6nW1FLnYyvPvW-qNZhdog/edit?usp=sharing


[PATCH v2 0/4] Interface for higher order contiguous allocations
----------------------------------------------------------------

https://lkml.kernel.org/r/20180503232935.22539-1-mike.kravetz@oracle.com

`mmap(MAP_CONTIG)` 를 추가하자는 아이디어가 있었습니다.  현재 리눅스 커널에서
연속된 메모리 공간 할당에 사용되기 위해 만들어진 인터페이스는 CMA가 있는데, 그
목적이 좀 특수한 상황에 맞춰져 있다보니 좀 더 범용적 인터페이스가 있으면
어떻겠나 하는 이야기가 나와, 그런 인터페이스를 만들어 제시하는 패치입니다.
제안하는 인터페이스는 다음과 같습니다:

```
struct page *find_alloc_contig_pages(unsigned long nr_pages, gfp_t gfp,
                                        int nid, nodemask_t *nodemask)
```


[RFC] Distinguish vmalloc pages
-------------------------------

https://lkml.kernel.org/r/20180502152733.GB2737@bombadil.infradead.org

VMalloc 페이지는 유저스페이스에 매핑될 수도 있으므로 성능 분석과 memory leak
문제 분석의 편의를 위해  page->mapping 값에 이를 가리키는 표식과 해당 페이지를
가리키는 `vm_struct` 와 그 안에서의 `offset` 을 저장하는 RFC 패치입니다.


Introduce atomic_dec_and_lock_irqsave()
---------------------------------------

https://lkml.kernel.org/r/20180504154533.8833-1-bigeasy@linutronix.de

`local_irq_save()` + `atomic_dec_and_lock()` 조합을 써야 하던 코드를 위해 이를
감싸는 새로운 함수, `atomic_dec_and_lock_irqsave()` 를 만들고 기존의 코드가
이를 사용하도록 고친 패치입니다.
