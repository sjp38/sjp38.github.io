+++
title = "QEMU 를 사용한 리눅스 커널 디버깅"
date = 2018-05-07T18:21:01+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = [
	"linux",
	"kernel",
	"tip",
	"linux-kernel-hack",
	]
categories = ["linux-kernel-hack"]

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

토발즈는 좋아하지 않지만, 리눅스 커널 프로그래밍에도 디버거를 사용할 수
있습니다.  저도 디버거 사용을 좋아하지는 않는 편이지만, 경우에 따라선 디버거를
사용하는게 좋을 때도 있고 취향은 존중되어야죠. ;)

커널 디버깅 방법은 여러가지가 있는데, 그 중 하나는 QEMU 등을 이용한 리눅스 가상
머신을 띄워 두고, 호스트 머신에서 해당 가상 머신의 리눅스 커널을 디버깅 하는
방법입니다.  이 글에선 이렇게 디버깅 하는 방법을 간단히 정리해 봅니다.


테스트 환경
===========

글 작성 과정에서 테스트에 사용한 주요 소프트웨어들과 버전은 다음과 같습니다.

- Ubuntu 16.04.3 Server
- gdb 7.11.1
- QEMU v2.11.0-dirty
- Linux v4.16


커널 빌드
=========

디버깅할 커널을 빌드합니다.  이 때 `CONFIG_GDB_SCRIPTS` 는 켜고
`CONFIG_DEBUG_INFO_REDUCED` 는 끄고, 타겟 아키텍쳐가 `CONFIG_FRAME_POINTER` 를
지원한다면 켜야 합니다.


가상 머신 부팅
==============

빌드가 완료되면 해당 커널을 사용해 QEMU 가상 머신을 부팅시킵니다.  가상 머신
위에 커널을 설치하는 방법도 있겠고, QEMU 에 `-kernel` 과 `-append`, `-initrd`
등을 사용해서 호스트에서 빌드한 리눅스 커널로 부팅시키는 방법도 있을 겁니다.
이 때, __kaslr__ 을 꺼야 합니다.  커널 패러미터에 `nokaslr` 을 추가하는 걸로 끌
수 있습니다.  kaslr 이 켜진 채로 디버깅 해야 한다면 다른 방법이 있는데, 여기선
다루지 않겠습니다.

QEMU 가상 머신을 시작할 때 QEMU 에 `-s` 옵션을 주거나 QEMU monitor console 에서
`gdbserver` 라고 명령을 입력해 줍니다.  이 명령은 가상머신에서 gdbserver 를
시작시켜서 gdbserver 가 `tcp::1234` 에서 접속을 기다리게 함으로써 QEMU 의 gdb
기능을 활성화 시켜줍니다.  `-nographic` 옵션을 주거나 해서 QEMU 를 수행시켰다면
화면에 QEMU monitor console 이 아니라 가상머신의 console 로 연결되었을 텐데,
`Ctrl+a c` 키 조합으로 QEMU monitor console 로 이동할 수 있습니다.  여기서
가상머신 콘솔로 돌아가려면 `Ctrl+a c <enter>` 를 입력해 줍니다.


gdb 시작
========

호스트 머신에서 디버깅할 커널의 빌드 디렉토리로 이동해서 `gdb vmlinux` 명령어를
입력해 빌드된 리눅스 심볼과 디버깅 정보를 사용해 gdb 가 켜지도록 합니다.
우분투나 일부 배포본에서는 이 때 `vmlinux-gdb.py` 를 읽어들이는데 실패할 수
있을 겁니다.  gdb 에서도 에러메세지를 띄워 주겠지만, 홈디렉토리의 `.gdbinit`
파일에 다음 한줄을 추가해 주고 앞서 설명한 커맨드로 gdb 를 다시 시작합니다:
```
add-auto-load-state-path /path/to/linux-build
```

이후, gdb 세션에서 다음과 같은 명령어를 입력해 QEMU 가상머신에 연결합니다:
```
(gdb) target remote :1234
Remote debugging using :1234
0xffffffff818cce92 in native_safe_halt () at /home/sjpark/linux/arch/x86/include/asm/irqflags.h:54
54              asm volatile("sti; hlt": : :"memory");
```

이와 함께 QEMU 가상 머신은 동작이 멈출 겁니다.  여기서부터 gdb 를 평소에
사용하듯이 사용해 리눅스 커널의 변수를 보거나 중단점 (breakpoint) 를 설정하거나
한단계씩 코드를 수행시키거나 할 수 있습니다.  예를 들어 다음과 같이 특정 함수에
breakpoint 를 설정할 수 있습니다:
```
(gdb) b cma_alloc
Breakpoint 1 at 0xffffffff81240f10: file /home/sjpark/linux/mm/cma.c, line 399.
```

예를 들어 수행이 멈춰 있는 가상머신의 수행을 다시 가능하게 하려면 다음과 같이 c
를 입력해 줍니다.  가상머신의 커널 수행이 재개되며, Breakpoint 가 설정되어 있고
해당 위치 코드가 수행되면 다시 수행이 멈출 겁니다.
```
(gdb) c
Continuing.
```

다시 멈추려면 gdb 에서 Ctrl+C 를 누릅시다:
```
^C
Thread 1 received signal SIGINT, Interrupt.
0xffffffff818cce92 in native_safe_halt () at /home/sjpark/linux/arch/x86/include/asm/irqflags.h:54
54              asm volatile("sti; hlt": : :"memory");
(gdb)
```


리눅스 gdb helper 사용하기
==========================

사실은 앞 단계에서 `.gdbinit` 를 굳이 수정하지 않아서 gdb가 `vmlinux-gdb.py` 를
읽어들이는데 실패하더라도 gdb 를 평범하게 사용할 수 있습니다.  `vmlinux-gdb.py`
는 사실 gdb 위에서 리눅스 커널을 디버깅하는걸 편리하게 해줄 수 있는 일부
스크립트, 즉 gdb helper 를 담고 있습니다.  이걸 사용하면 보다 쉽게 커널
디버깅을 할 수 있습니다.


helper 스크립트 리스트업
------------------------

사용 가능한 helper 스크립트는 lx로 시작하는 규칙을 갖고 있습니다.  다음
명령으로 사용 가능한 스크립트 목록과 간단한 설명을 볼 수 있습니다:
```
(gdb) apropos lx
function lx_current -- Return current task
function lx_module -- Find module by name and return the module variable
function lx_per_cpu -- Return per-cpu variable
function lx_task_by_pid -- Find Linux task by PID and return the task_struct variable
function lx_thread_info -- Calculate Linux thread_info from task variable
function lx_thread_info_by_pid -- Calculate Linux thread_info from task variable found by pid
lx-cmdline --  Report the Linux Commandline used in the current kernel
lx-cpus -- List CPU status arrays
lx-dmesg -- Print Linux kernel log buffer
lx-fdtdump -- Output Flattened Device Tree header and dump FDT blob to the filename
lx-iomem -- Identify the IO memory resource locations defined by the kernel
lx-ioports -- Identify the IO port resource locations defined by the kernel
lx-list-check -- Verify a list consistency
lx-lsmod -- List currently loaded modules
lx-mounts -- Report the VFS mounts of the current process namespace
lx-ps -- Dump Linux tasks
lx-symbols -- (Re-)load symbols of Linux kernel and currently loaded modules
lx-version --  Report the Linux Version of the current kernel
```


참 쉽죠? ;)


참고 자료
=========

1. [커널 디버깅 공식 문서](https://www.kernel.org/doc/html/v4.11/dev-tools/gdb-kernel-debugging.html)
2. [참고할만한 영문 블로그 글](http://www.alexlambert.com/2017/12/18/kernel-debugging-for-newbies.html)
3. [gdbserver 공식 문서](https://sourceware.org/gdb/onlinedocs/gdb/Server.html)
