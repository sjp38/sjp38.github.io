+++
bigimg = ""
date = "2017-12-11T11:25:13+09:00"
subtitle = ""
title = "LKML News after v4.15-rc3"
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

+++

Linux 4.15-rc3
--------------

https://lkml.kernel.org/r/CA+55aFz9O9R8u3ori-QNPz4ALU+0B=Es0gd+oWmsce5qxugxXA@mail.gmail.com

4.15 의 세번째 rc 버전입니다.  지난주보단 조금 늦게 릴리즈 되었네요.

일반적으로 rc3 릴리즈는 좀 변경사항이 많지만 이번엔 그중에서도 변경사항이 많은
편이라 걱정된다고 하는군요.  대부분은 드라이버쪽 변경인데 perf 쪽 변경도 꽤
있고 core, networking, kvm, arch, 문서 업데이트도 물론 있습니다.  어쨌든
토발즈는 이제는 정말 안정화가 되어가길 바라는 마음이라는군요.


[PATCH v2] mm/slab: Do not hash pointers when debugging slab
------------------------------------------------------------

https://lkml.kernel.org/r/1513179267-2509-1-git-send-email-geert+renesas@glider.be

이번 버전에 들어와 포인터 값을 기반으로 한 예측을 통해 공격이 들어오는 걸
방지하기 위해 '%p' 가 포인터를 그냥 출력하는게 아니라 hash 한 다음에 출력하도록
바뀌었죠.  때문에 디버깅이 좀 까다로워졌구요.  디버깅을 위해 온전한 포인터가
필요한 곳에선 '%pX' 를 써야 합니다.  일단 slab 쪽에서도 그게 필요하기에 DEBUG
옵션이 켜졌을 때에는 '%pX' 를 사용하도록 하는 패치입니다.


[RFC PATCH] mm: unclutter THP migration
---------------------------------------

https://lkml.kernel.org/r/20171207124815.12075-1-mhocko@kernel.org

Transparent Huge Page 를 위한 Michal Hocko 의 패치입니다.

THP 마이그레이션을 위한 메모리 할당 콜백은 THP 가 한꺼번에 마이그레이션 될 수
있는지 보고, 마이그레이션 될 곳에 메모리가 부족해 불가능하거나 하다면 평범한
페이지를 할당받습니다.  이어서 unmap_and_mov() 가 THP 를 평범한 페이지로
쪼개고, 그사이 THP 의 head page 는 split_huge_page() 를 통해 LRU 리스트에
들어갑니다.  같은 일이 THP 할당에 실패할 때도 이러나는데, 이건 에러가 나기 쉬운
행위라고 Michal 은 봅니다.

LRU 리스트에 split_huge_page() 를 행하는 것도 잘못된 행위인데, 모든 tail page
들이 마이그레이션 되지 않았기 때문이죠.  이로 인해 발생하는 문제는 사용자가
각각 처리해야 했습니다.

Michal 은 이 패치를 통해 THP 처리를 위한 특수한 부분들을 migrate_pages() 단계로
올려서 이 상황을 정리하고자 합니다. 여기서 unmap_and_move() 가 ENOMEM 으로
실패하면 THP 페이지를 쪼개고 현재 존재하는 리스트로 옮깁니다.  이렇게 함으로써
우리는 모든 THP 서브페이지들을 항상 마이그레이션 하고 특정한 migrate_pages()
사용자들은 앞서 이야기한 경우를 별도로 처리할 필요가 없어지는 것이죠.


[PATCH] locking/lockdep: Make CONFIG_LOCKDEP_CROSSRELEASE and CONFIG_LOCKDEP_COMPLETIONS optional
-------------------------------------------------------------------------------------------------

https://lkml.kernel.org/r/1513062681-5995-1-git-send-email-byungchul.park@lge.com

아직 락들의 classification 이 잘 되어있지 않아 너무 많은 false positive 가
나오고 있어 lockdep 의 CROSSRELEASE 와 COMPLETIONS 를 기본 활성에서 옵셔널로
바꾸는 패치입니다.


[PATCH] mm: Reduce memory bloat with THP
----------------------------------------

https://lkml.kernel.org/r/1513301359-117568-1-git-send-email-nitin.m.gupta@oracle.com

THP 는 굉장히 aggressive 하게 huge page 를 선호하기 때문에 메모리 사용량을
증가시키는 문제가 있습니다.  Redis 등에서는 그런 이유로 THP 를 꺼버리라고
하기도 하죠.

이 패치는 어플리케이션이 특정 메모리 영역에 MADV_DONTNEED 를 보내면, 이 영역은
"space-efficient" 로 마크되어서 해당 영역은 항상 huge page 를 사용하는게 아니라
khugepaged 가 해당 영역이 정말로 매핑되어 있고 사용되고 있는지에 따라 huge page
로 승격을 시키도록 합니다.  어플리케이션이 다시 MADV_HUGEPAGE 를 해당 영역에
내면, 해당 영역은 다시 non-space-efficient 로 마크되어 원래대로 동작합니다.


[PATCH v2] rcutorture: Add basic ARM64 support to run scripts
-------------------------------------------------------------

https://lkml.kernel.org/r/1513070365-13436-1-git-send-email-lianglihao@huawei.com

RCU 를 테스트하는 rcutorture 드라이버의 드라이버 ;) 스크립트에 aarch64 지원을
추가하는 패치입니다.


[PATCH v5 00/78] XArray v5
---------------------------

https://lkml.kernel.org/r/20171215220450.7899-1-willy@infradead.org

Matthew Wilcox 의 XArray 다섯번째 버전 패치입니다.


[PATCH 0/8] Restructure struct page
-----------------------------------

https://lkml.kernel.org/r/20171216164425.8703-1-willy@infradead.org

`struct page` 는 매우 민감한 구조체죠.  요걸 구조를 살짝 바꾸려는 패치입니다.
