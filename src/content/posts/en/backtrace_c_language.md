+++
title = "Backtrace on C language program"
date = 2019-04-09T17:33:50+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["c language", "c", "backtrace"]
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

디버깅 과정에선 현재 어떤 코드가 어떤 함수를 거쳐 수행됐는지를 통한 컨텍스트
파악이 중요합니다.  Java, Python, Go 등 대부분의 언어가 이를 위해 콜스택을 뽑을
수 있는 기능을 제공하죠.  C 언어의 경우 gdb 등을 사용하면 쉽게 이를 볼 수
있지만 경우에 따라선 gdb 를 포기하고 `printf()` 등에만 의존해야 하기도 합니다.
이를 위한 기능이 c 라이브러리에도 있습니다, `backtrace()` 함수입니다.
[`man`](http://man7.org/linux/man-pages/man3/backtrace.3.html) 에도 이에 대한
설명이 있습니다만, 여기서도 간단히 소개해 봅니다.


Example Source Code
-------------------

예제로 설명하는게 가장 쉽죠.  간단한 사용법은 아래와 같습니다.

```
#include <stdio.h>
#include <execinfo.h>

void baz(void)
{
	void *callstack[128];
	int i, frames;
	char **strs;

	frames = backtrace(callstack, 128);
	strs = backtrace_symbols(callstack, frames);
	for (i = 0; i < frames; i++)
		printf("%s\n", strs[i]);
	free(strs);
}

void bar(void)
{
	baz();
}

void foo(void)
{
	bar();
}

int main(void)
{
	foo();
	return 0;
}
```


Compile
-------

아래와 같이 컴파일 합니다:

```
$ gcc -rdynamic -g -o hello ./hello.c
```

`-rdynamic` 과 `-g` 옵션을 잊지 맙시다.

이제 프로그램을 실행해 보면:

```
$ ./hello

./hello(baz+0x2e) [0x400964]
./hello(bar+0x9) [0x4009fd]
./hello(foo+0x9) [0x400a09]
./hello(main+0x9) [0x400a15]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf0) [0x7f87c51e6830]
./hello(_start+0x29) [0x400869]
```

`main()`, `foo()`, `bar()`, 를 거쳐 `baz()` 가 수행되었음을 보입니다.  더
나아가서 어떤 소스파일의 몇번 라인인지를 보고 싶다면 `addr2line` 커맨드를
사용할 수 있습니다.

```
$ addr2line -e hello 0x400964
./hello.c:10
$ addr2line -e hello 0x4009fd
./hello.c:20
$ addr2line -e hello 0x400a09
./hello.c:25
$ addr2line -e hello 0x400a15
./hello.c:30
```

쉽죠? ;)


Conclusion
----------

C 프로그램에서 backtrace 를 떠보는 방법을 알아보았습니다.
위의 내용을 여러분의 환경에서도 쉽게 테스트 해 볼 수 있게끔 제 [Github repo]
(https://github.com/sjp38/backtrace_example) 에도 정리해 두었습니다.
클론하고, `$ make run` 해주시면 예제가 자동으로 빌드되고 돌아갈 겁니다.
