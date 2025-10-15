+++
title = "Hooking Library Function Calls"
date = 2019-04-10T11:39:06+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["hooking", "programming", "binary"]
categories = ["programming"]

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

`LD_PRELOAD` 환경변수를 사용하면 로더가 프로그램을 로드할 때 동적 로드해야 할
바이너리 코드를 해당 변수의 값의 디렉토리에서부터 뒤지도록 합니다.
따라서 이를 이용해 `malloc()`, `free()` 등의 일반적으로 사용하는 라이브러리
함수를 우리의 구현으로 대체하거나 후킹할 수 있습니다.
이 글은 이런 방법으로 `malloc()` 을 후킹하는 방법을 예제를 통해 간단히
설명합니다.


Original Program
----------------

먼저 다음과 같은 프로그램이 있을 수 있을 겁니다:

```
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char *abc;

	abc = (char *)malloc(8);
	printf("malloced address: %p\n", abc);
	sprintf(abc, "hello\n");
	printf("%s\n", abc);
	free(abc);

	return 0;
}
```

단순히 `malloc()` 을 통해 8바이트 메모리를 할당받아 그 영역을 표시하고 종료하는
프로그램입니다.  위 코드를 `program.c` 라는 파일로 저장하고, 아래와 같이
컴파일하고 수행해 보면 우리가 익히 아는, 예상대로의 결과가 나옵니다.

```
$ gcc -o program program.c
$ ./program
malloced address: 0x1cc5010
hello
```


malloc Hooking Code
-------------------

이제 `malloc()` 함수를 후킹하는 코드를 만들어 봅시다:

```
#define _GNU_SOURCE

#include <dlfcn.h>
#include <stdio.h>

typedef void *(*malloc_t)(size_t size);

void *malloc(size_t size)
{
	malloc_t malloc_fn;

	fprintf(stderr, "malloc(%zu) hooked\n", size);
	malloc_fn = (malloc_t)dlsym(RTLD_NEXT, "malloc");
	return malloc_fn(size);
}
```

이 코드는 우리가 아는 `malloc()` 함수와 동일한 함수명, signature 의 함수를
구현하고 있습니다.
단순히 우리가 후킹했음을 알리고, 동적 라이브러리 구조를 통해 이 다음으로
검색되는 `malloc` 이름의 라이브러리 함수 (이게 우리가 익히 아는 그 `malloc()`
구현이겠죠) 를 찾아, 같은 인자로 수행하고 그 결과를 리턴합니다.
즉, 우리가 아는 `malloc()` 과 같은 일을 하긴 하지만 `malloc()` 이 호출되었음을
알리는 것이죠.

이 코드를 `mallochook.c` 라는 이름으로 저장 후, 다음과 같이 라이브러리로
빌드합니다:

```
$ gcc -shared -fPIC mallochook.c -o mallochook.so -ldl
```


Install The Hook
----------------

프로그램이 기존 `malloc()` 대신 우리가 구현한 `malloc()` 을 수행하게 하는 건
`LD_PRELOAD` 를 활용하면 간단합니다.

```
$ LD_PRELOAD=./mallochook.so ./program
malloc(8) hooked
malloc(1024) hooked
malloced address: 0x20a5010
hello
```

두번째, 세번째 줄을 보면 `malloc()` 이 후킹되어 우리의 메세지가 나오는 걸 볼 수
있습니다.  앞의 `program.c` 에서는 8 바이트 `malloc()` 호출만 있었는데 세번째
줄의 1024 바이트 malloc()` 은 어디서 나온 걸까요?  아마도 뒤의 `sprintf()` 등의
라이브러리 함수가 호출한 거 아닐까 싶은데 그걸 분석하는 건 여러분의 몫으로
두겠습니다.


Conclusion
----------

자세한 원리는 생략했습니다만, 간단히 주요 라이브러리 함수를 후킹하는 방법을
알아봤습니다.
여기서 사용된 예제 코드와 명령어는 제 [Github repo]
(https://github.com/sjp38/mallochook) 에 올려뒀으니 필요하면 참고 바랍니다.
