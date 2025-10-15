+++
title = "Memory: the flat, the discontiguous, and the sparse (Korean)"
date = 2019-07-31T07:45:17+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["lwn", "linux", "kernel", "memory models", "translation", "lwn translations"]
categories = ["lwn translations"]

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

LWN 의 "Memory: the flat, the discontiguous, and the sparse" 라는 제목의 글의
한글 번역입니다.  원문은 LWN 에서 볼 수 있습니다:
https://lwn.net/Articles/789304/

---

May 27, 2019

이 기사는 Mike Rapoport 에 의해 기여되었습니다.

컴퓨터 시스템에서 물리 메모리는 소중한 자원이어서, 이를 효율적으로 관리하기
위한 많은 노력이 기울여져왔습니다.
이 일은 현대의 시스템에서의 메모리 구조가 복잡해짐에 따라 더 어려워졌습니다.
물리 메모리가 실제로 어떻게 위치해 있는가를 다루기 위한 여러 계층의 추상화가
존재합니다; 그런 추상화 중 하나는 "메모리 모델" 이라고 불립니다.
커널은 세개의 모델을 지원하고 있는데, 그 중 하나는 지원이 멈춰져 가고 있습니다.
이 변경을 이해하기 위한 방법으로, 이 기사는 커널의 메모리 모델들의 진화, 현재
상태, 그리고 있을 법한 미래에 대해 자세히 들여다 봅니다.


FLATMEM
-------

리눅스가 처음 나왔을 때, 메모리는 평평했습니다: 메모리는 0 부터 수 메가바이트의
물리 주소를 갖는 단순한 선형적 배열일 뿐이었습니다.
각 물리 페이지 프레임은 커널의 `mem_map` 배열에 하나의 원소와 연관되었으며, 이
당시에 이 배열은 해당 페이지가 가진 레퍼런스의 갯수를 세는 하나의 `unsigned
short` 원소로 이루어져 있었습니다.
하지만, 얼마 있지 않아서, 이 `mem_map` 의 원소들은 스왑 관리를 위한 `age` 와
`dirty counter` 를 포함하도록 커졌습니다.
Linux 1.3.50 에서 `mem_map` 의 원소들은 마침내 `struct page` 로
이름지어졌습니다.

이 평평한 메모리 매핑은 물리 페이지 프레임 번호 (page-frame number : PFN) 와
그에 대응되는 `struct page` 사이의 쉽고 빠른 변환을 제공했습니다; 이 변환
작업은 간단한 배열 인덱스 계산 문제였습니다.
이후 `struct page` 의 레이아웃 변경이 있었는데, 새로운 사용처 (예컨대, page
cache) 들과 `struct page` 의 캐시 성능 최적화를 위한 것이었습니다.
메모리 매핑은 깔끔하고 효율적인 평평한 배열로 유지되었습니다만, 이는 중요한
단점을 가지고 있었습니다: 물리 주소 공간 상의 큰 공백을 처리할 수 없었습니다.
이 메모리 매핑 가운데 공백에 연관된 부분은 낭비되어지거나, ARM 에서처럼, 메모리
매핑 자체가 공백을 가질 수 있었습니다.


DISCONTIGMEM
------------

상당히 비연속적인 물리 메모리를 효율적으로 처리하기 위한 지원이 리눅스를 NUMA
기계들 위에서 잘 동작하도록 하기 위한 노력의 일환으로 1999년에 메모리 관리
서브시스템으로 들어왔습니다.
이 코드는 `CONFIG_DISCONTIGMEM` 설정 옵션에 종속적이어서, 이 메모리 모델은
`DISCONTIGMEM` 이라 이름지어진 첫번째 모델이었습니다.

이 `DISCONTIGMEM` 모델은 메모리 노드 (memory node) 라는 개념을 소개했는데, 이
개념은 여전히 NUMA 메모리 관리의 기본으로 남아있습니다.
각 노드는 free-page lists, in-use page lists, least-recently-used (LRU) 정보,
사용 통계 등을 포함한, (대부분) 독립적인 메모리 관리 서브시스템을 갖습니다.
이런 것들 가운데, `struct pglist_data` (또는 짧게 `pg_data_t`) 로 표현되는 노드
데이터는 하나의 노드에 대한 메모리 매핑 정보를 가지고 있습니다.
각 노드가 연속적인 물리 메모리를 가지고 있다는 가정 하에, 노드당 하나의 `struct
page` 배열을 갖는 것은 평평한 메모리 매핑 안의 거대한 공백 문제를 해결했습니다.

하지만 이게 공짜로 된 건 아닙니다.
`DISCONTIGMEM` 에서는, 예를 들면 어떤 PFN 을 그에 연관된 `struct page` 로
변환하기 위해 특정 페이지를 어떤 노드가 가지고 있는지를 알 수 있어야 합니다.
비슷하게, 페이지를 가지고 PFN 을 구하기 위해 어떤 노드의 메모리 맵이 해당
`struct page` 를 가지고 있는지도 알 수 있어야 합니다.
긴 진화의 끝에, `KVADDR_TO_NID()`, `LOCAL_MAP_BASE()`, `ADDR_TO_MAPBASE()`,
그리고 `LOCAL_BASE_ADDR()` 매크로를 처음 정의한 `mips64` 부터 시작해서 PFN 의
`struct page` 로의 변환과 그 반대 작업은 `include/asm-generic/memory_model.h`
안에 정의된, 비교적 간단한 `pfn_to_page()` 와 `page_to_pfn()` 매크로로 수행되게
되었습니다.

하지만, DISCONTIGMEM 은 약점이 있었습니다: 메모리 핫플러그 (hotplug) 와
핫리무브 (hot remove) 입니다.
실제 NUMA 노드는 실제 핫플러그를 지원하기엔 너무 굵은 크기였고, 노드를 쪼개는
것은 불필요한게 많은 단편화와 오버헤드를 가져올 것이었습니다.
각 노드가 독립적인 메모리 관리 구조체들을 연관된 비용과 함께 가짐을 기억해
보세요; 노드를 쪼개는 것은 그런 비용을 상당히 증가시킬 겁니다.


SPARSEMEM
---------

이 한계는 SPARSEMEM 을 통해 해결되었습니다.  이 모델은 메모리 매핑을
아키텍쳐별로 정의된 임의의 크기의 섹션들의 집합으로 추상화 했습니다.
각 섹션은 `struct mem_section` 으로 표현되며, (코드에 설명된 바에 따르면):
"논리적으로, `struct page` 의 배열로의 포인터입니다.  하지만, 다른 마술을 통해
저장됩니다".
이 섹션들의 배열은 `SECTION_SIZE` 크기로 효율적으로 쪼개질 수 있는 메타 메모리
매핑입니다.
PFN 과 `struct page` 사이의 효율적인 변환을 위해, PFN 의 상위 비트 몇개는 이
섹션 배열로의 인덱스로 사용됩니다.
반대 방향 변환을 위해선, 이 섹션 넘버가 page 의 flag 로 인코딩 됩니다.

이 모델이 리눅스 커널에 소개되고 몇달 후, SPARSEMEM 은 `SPARSEMEM_EXTREME` 으로
확장되었는데, 이 모델은 산재하는 물리 주소 공간을 갖는 시스템에 적합합니다.
`SPARSEMEM_EXTREME` 에서는, 첫번째 레벨은 `mem_section` 구조체들로의 포인터가
되고, 실제 `mem_section` 객체는 실제로 꽂힌 물리 메모리에 기반해서 동적으로
할당됩니다.

2007년에 SPARSEMEM 의 또다른 개선이 이루어졌습니다; 이는 SPARSEMEM 의 일반적인
가상 메모리 매핑 지원 또는 `SPARSEMEM_VMEMMAP` 이라고 불렸습니다.
`SPARSEMEM_VMEMMAP` 의 아이디어는 전체 메모리 매핑이 가상 연속 공간에 매핑되어
있지만, 활성화된 섹션들만이 물리 페이지로 연결되어 있도록 하자는 것입니다.
이 모델은 32-bit 시스템에서는 물리 메모리의 크기가 가상 주소 공간을 넘을 수
있기 때문에 잘 동작하지 못할 수 있습니다.
하지만, 64-bit 시스템에서 `SPARSEMEM_VMEMMAP` 은 확실히 우수합니다.
추가적인 페이지 테이블 엔트리 사용이라는 비용 아래, `page_to_pfn()` 과
`pfn_to_page()` 는 평평한 모델만큼이나 간단해 졌습니다.

SPARSEMEM 메모리 모델의 마지막 확장은 꽤 최근 (2016) 이었습니다; 이는
persistent 메모리 디바이스의 사용 증가로 인해 이루어졌습니다.
메모리 매핑을 메인 메모리가 아니라 그런 디바이스들 내에 직접 저장하는 걸
지원하기 위해, 이 가상 메모리 매핑은 `struct vmem_altmap` 을 사용할 수 있게
되었는데, 이 구조체는 persistent 메모리 안의 페이지 구조체를 제공합니다.

2005년으로 돌아가보면, SPARSEMEM 은 "새로운, 그리고 실험적인 `discontiguous
memory` 의 대체재" 로 설명되었습니다.
`SPARSEMEM_VMEMMAP` 을 추가한 커밋은 그것을 "우리가 SPARSEMEM 을 대부분의
시스템에 기본 (그리고 유일한) 옵션이 되게 할 가능성이 있다" 고 했습니다.
그리고 실제로, 일부 아키텍쳐는 DISCONTIGMEM 에서 SPARSEMEM 으로 옮겨탔습니다.
2008년, `SPARSEMEM_VMEMMAP` 은 x86-64 를 위한 유일한 메모리 모델이 되었는데,
FLATMEM 보단 조금 비싸지만 DISCONTIGMEM 보다는 효율적이기 때문입니다.

메모리 핫플러그, persistent 메모리 지원, 다양한 성능 최적화와 같은 최근의
메모리 관리 분야 개발은 모두 SPARSEMEM 모델을 타겟으로 하고 있습니다.
하지만 과거의 모델들은 여전히 존재해서, 아키텍쳐와 메모리 관리 코드 상의 많은
`#ifdef` 블록의 존재와, 관련된 구성 옵션의 특별한 미로의 존재라는 추가비용을
유발하고 있습니다.
남아있는 `DISCONTIGMEM` 사용자들을 `SPARSEMEM` 으로 완전히 바꿔타게 하려는
노력들이 있습니다만, ia64 나 mips64 와 같은 아키텍쳐들을 그렇게 변화시키기는
쉬운 작업이 아닐 겁니다.
그리고 ARC 아키텍쳐의 DISCONTIGMEM 사용은 "normal" 메모리 아래 "high memory"
영역의 존재를 갖는데, 이는 분명 변경하기 어려울 겁니다.
