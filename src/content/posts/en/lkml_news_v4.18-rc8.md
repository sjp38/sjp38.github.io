+++
title = "LKML News after v4.18-rc8"
date = 2018-08-06T17:53:02+09:00
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

Linux 4.18-rc8
--------------

https://lkml.kernel.org/r/CA+55aFw49Bh9u3KvGsMbnSLfHvevpWPuqgrWQT0tC0XCajNwzA@mail.gmail.com

원래대로라면 오늘 4.18 정식 릴리즈가 있어야 했지만, 지난주 동안 여러 일이
있었고, 결국 여덟번째 rc 버전이 나오고 말았습니다.  VM 쪽 이슈가 큰 이유였고,
그것만 문제였으면 그냥 정식 릴리즈를 하려 했지만 네트워킹 쪽에서도 뒤늦은
문제가 터지고 VFS 쪽에도 이슈가 있었던 관계로 정식 릴리즈를 미루기로 결심했다고
합니다.

8월에 휴가를 많이 떠나는 유럽 개발자들을 고려해서 토발즈는 휴가가 예정되어
있다면 그냥 원래 예상된 스케쥴대로 이번주부터 머지 윈도우 열렸다고 생각하고
풀리퀘스트 보내고 휴가 가라고 대인배라면 대인배 같은 면모를 보이는군요.


[PATCH RFC 00/10] Introduce lockless shrink_slab()
--------------------------------------------------

https://lkml.kernel.org/r/153365347929.19074.12509495712735843805.stgit@localhost.localdomain

이 블로그에서도 이야기 했던 "Improve shrink_slab() scalability..." 패치의 머지
후, 성능 병목 지점이 `shrink_lab()` 에서 `down_read_trylock()` 으로
넘어갔습니다!

```
     > I created 255 memcgs, 255 ext4 mounts and made each memcg create a
     > file containing few KiBs on corresponding mount. Then in a separate
     > memcg of 200 MiB limit ran a fork-bomb.
     >
     > I ran the "perf record -ag -- sleep 60" and below are the results:
     > +  47.49%            fb.sh  [kernel.kallsyms]    [k] down_read_trylock
     > +  30.72%            fb.sh  [kernel.kallsyms]    [k] up_read
     > +   9.51%            fb.sh  [kernel.kallsyms]    [k] mem_cgroup_iter
     > +   1.69%            fb.sh  [kernel.kallsyms]    [k] shrink_node_memcg
     > +   1.35%            fb.sh  [kernel.kallsyms]    [k] mem_cgroup_protected
     > +   1.05%            fb.sh  [kernel.kallsyms]    [k] queued_spin_lock_slowpath
     > +   0.85%            fb.sh  [kernel.kallsyms]    [k] _raw_spin_lock
     > +   0.78%            fb.sh  [kernel.kallsyms]    [k] lruvec_lru_size
     > +   0.57%            fb.sh  [kernel.kallsyms]    [k] shrink_node
     > +   0.54%            fb.sh  [kernel.kallsyms]    [k] queue_work_on
     > +   0.46%            fb.sh  [kernel.kallsyms]    [k] shrink_slab_memcg
```

이 패치셋은 계속해서 `shrink_slab()` 의 멀티코어 성능 확장성을 위해 lock 을
사용하지 않게끔 경로를 최적화 하고 있습니다.

먼저 `shrink_slab()` 과 `unregister_shrinker()` 사이의 동기화에 SRCU 를
사용하고, 그럴 수 없는 경우에는 `percpu_rw_semaphore` 를 사용합니다.  그리고
`shrinker_rwsem` 을 뮤텍스로 교체합니다.  

SRCU 를 사용함으로 인해 커널 바이너리 사이즈가 커지는 문제가 있는데, 과거에도
비슷한 시도가 이런 이유로 취소된 적 있었군요.
