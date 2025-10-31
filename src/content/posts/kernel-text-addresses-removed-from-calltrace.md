+++
date = "2017-06-16T16:46:09+09:00"
bigimg = ""
title = "Kernel text addresses removed from calltrace"
subtitle = ""
categories = [
	"linux-kernel-hack",
]
tags = [
	"linux",
	"kernel",
	"tip",
]

+++

최근 커널은 stakc dump 에서 콜 트레이스(Call Trace) 에 각 코드의 메모리
어드레스를 찍어주지 않습니다.  이에 대해 포스팅을 해봅니다.


Call Trace
==========

커널은 문제가 발생하거나 하면 문제의 원인을 찾을 수 있는 다양한 정보를 담고
있는 stack dump 를 로그로 뿌려 줍니다.  문제의 원인을 찾는데 매우 소중한
정보입니다.  그 정보 중에서도 중요한 것 중 하나가 콜 트레이스로, 이 문제의
순간에 오기까지 어느 함수의 어느 지점에서 어느 함수를 호출해서 여기까지
왔는가를 담는 정보입니다.

디버깅 정보를 담아 빌드된 커널이라면 다음과 같이 사람 눈으로 곧바로 어느정도 알
수 있는 수준의 콜 트레이스가 나옵니다:
```
Call Trace:
 [<c12ba080>] ? dump_stack+0x44/0x64
 [<c103ed6a>] ? __warn+0xfa/0x120
 [<c109e8a7>] ? module_put+0x57/0x70
 [<c109e8a7>] ? module_put+0x57/0x70
 [<c103ee33>] ? warn_slowpath_null+0x23/0x30
 [<c109e8a7>] ? module_put+0x57/0x70
 [<f80ca4d0>] ? gp8psk_fe_set_frontend+0x460/0x460 [dvb_usb_gp8psk]
 [<c109f617>] ? symbol_put_addr+0x27/0x50
 [<f80bc9ca>] ? dvb_usb_adapter_frontend_exit+0x3a/0x70 [dvb_usb]
```

콜 트레이스는 어떻게 이 순간에 이르게 되었는가를 역순으로 보여줍니다.  즉,
dvd_usb_adapter_frontend_exit() 에서 symbol_put_addr() 를 호출했고, 여기서
gp8psk_fe_set_frontend() 를 호출했고, ... 반복되어 dump_stack() 함수에 의해 이
메세지가 뜬 것이죠.  함수 이름 옆의 `0xaa/0xbb` 와 같은 숫자들은 각각 함수
내에서 해당 순간 코드까지의 오프셋, 그리고 해당 함수의 전체 크기를 나타냅니다.

이것만으로도 많은 정보를 알 수 있지만 해당 함수의 정확히 몇번째 라인에서 문제가
났는지는 이것만으로 알수가 없습니다.  코드를 한줄한줄 눈으로 보고 로그를
추가해보고 하면서 찾을 수도 있겠지만 복장이 터지겠죠.  가장 왼쪽 `[<` 와 `>]`
사이의 16진수는 메모리 상에서 해당 코드의 주소를 의미합니다.  따라서 디버깅
정보가 있다면 이 주소를 가지고 해당 코드가 어느 파일의 몇번째 라인인지 파악할
수 있습니다.

이 작업을 위한 도구가 여럿 있는데, `addr2line`[1] 도 많이 사용되는 도구 중
하나입니다.
```
$ addr2line -e ../linux.out/vmlinux 0xffffffff810e91f0
linux/arch/x86/include/asm/rwsem.h:83
```

`-e` 옵션을 통해 커널 디버깅 정보를 담고 있는 커널 이미지가 위치한 경로를
넘겨주고 마지막 인자로 앞의 콜 트레이스에서 얻어온 주소를 주면 어느 파일의
몇번째 라인을 가리키는지 쉽게 알 수 있습니다.


Text Address Removed from Stack Dump
====================================

그런데, 2016년 말 후에 릴리즈된 x86 용 커널은 콜 트레이스에서 위의 addr2line
에 넘겨줘야 할, 어드레스 정보가 더이상 콜 트레이스에 없습니다.  해당되는
커널에서는 다음과 같은 콜 트레이스가 나올 겁니다:
```
Call Trace:
 dump_stack+0x85/0xc2
 bad_page+0xc1/0x120
 free_pages_check_bad+0x7a/0x80
 __free_pages_ok+0x32a/0x3e0
 __free_pages+0x19/0x30
 shrink_huge_zero_page_scan+0x50/0x60
```

이는 2016년 10월 25일자로 Josh Poimboeuf 에 의해 만들어진 커밋[2] 에 의한
겁니다.  코드의 메모리상 어드레스가 추측 가능할 경우엔 해당 영역에 코드를
바꾼다거나 하는 여러 공격이 들어올 수 있어 보안상 좋지 않습니다.  때문에 최근
시스템은 동일한 프로그램이라 하더라도 메모리에 적재될 때마다 코드의 위치가
바뀌거나 하도록 하는 기능을 갖추고 있습니다.  Address randomization[3] 이 한
예입니다.  따라서 Address randomization 이 가줘져 있다고는 하지만 해당
어드레스를 누구나 볼 수 있는 커널 로그에 뿌리는 것도 좋은 행위는 아닐 뿐더러,
이렇게 나온 정보는 시스템에 따라 무효할 것이기 때문에 적어도 커밋 메세지에는
존재할 필요가 없는데 버그 레포팅 할때 사람들이 뿌려대서 귀찮기만 하다는 것이죠.


How to find out the Line, now?
------------------------------

문제는, 이렇게 되니 기존의 addr2line 을 이용해 한방에 해결되던 위치 찾기가 좀
복잡해진다는 겁니다.  먼저 해당 함수의 메모리 상 위치를 찾아내고, 그 다음
오프셋을 더해서 해당 코드의 메모리 상 주소를 찾아내어서 다시 addr2line 등을
사용해야 하는 것이죠.

이게 귀찮다면 만능 도구 `gdb` 를 사용할 수 있습니다:
```
$ gdb ../linux.out/vmlinux

...

(gdb) list *(free_pages_check_bad+0x7a)
0xffffffff811daf1a is in free_pages_check_bad (/home/sjpark/linux/mm/page_alloc.c:941).
936     #ifdef CONFIG_MEMCG
937             if (unlikely(page->mem_cgroup))
938                     bad_reason = "page still charged to cgroup";
939     #endif
940             bad_page(page, bad_reason, bad_flags);
941     }
942
943     static inline int free_pages_check(struct page *page)
944     {
945             if (likely(page_expected_state(page, PAGE_FLAGS_CHECK_AT_FREE)))
```

하지만 이 방법은 동일한 이름의 심볼이 두개 존재하는 경우 첫번째 심볼에 대해서만
보여줍니다.  따라서 사려 깊은 Josh Poimboeuf 는 저처럼 addr2line 을 좋아하는
사람들을 위해 대체할 도구를 만들었습니다.  그 이름은 faddr2line 으로, 커널
소스의 `scripts/` 디렉토리 아래에 있습니다.  다음과 같이 사용할 수 있습니다:
```
$ ./scripts/faddr2line ../linux.out/vmlinux free_pages_check_bad+0x7a
free_pages_check_bad+0x7a/0x80:
free_pages_check_bad at mm/page_alloc.c:941
```

두번째 인자로 디버깅 정보 담긴 이미지파일 경로, 그 뒤로 찾고자 하는 코드의
함수와 함수로부터 해당 코드까지의 오프셋을 주면 됩니다.


Conclusion
==========

보안적 이유와 쓸모없음으로 인해 2016년 말 후의 커널은 콜 트레이스에서 각 코드의
메모리 어드레스를 제거하고 `func_name+0x123/0x456` 포맷으로만 코드 위치를
제공하게 되었습니다.  이로 인해 해당 코드의 파일 내에서의 위치를 찾는데에
예전처럼 `addr2line` 을 더 사용할 수는 없게 되었지만 커널 모드의
`scripts/faddr2line` 도구를 사용해 예전처럼 쉽게 콜 트레이스의 각 위치의 파일
내에서의 위치를 파악할 수 있습니다.


References
==========

[1] http://www.skrenta.com/rt/man/addr2line.1.html  
[2] http://lkml.kernel.org/r/69329cb29b8f324bb5fcea14d61d224807fb6488.1477405374.git.jpoimboe@redhat.com  
[3] https://en.wikipedia.org/wiki/Address_space_layout_randomization
