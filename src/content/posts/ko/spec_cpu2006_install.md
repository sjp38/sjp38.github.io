+++
title = "spec cpu2006 벤치마크 설치 / 실행하기"
subtitle = ""
date = "2017-03-29T05:10:55+09:00"
bigimg = ""
tags = ["spec", "benchmark", "spec_cpu", "spec_cpu2006"]
categories = ["tip"]

+++

SPEC 은 벤치마크를 위한 협력기구 [0] 로, 다양한 벤치마크 suite 들을 만들고
공유합니다.  SPEC CPU 2006 은 여기서 만든 벤치마크 도구집합 중 하나 [1] 로 계산
작업 집중적인 워크로드에 대한 성능을 측정을 목표로 만들어졌으며, 많은 곳에서
사용되고 있습니다.  2006년 1.0 버전이, 2008년에 1.1 버전이, 그리고 2011년에 1.2
버전이 나왔습니다.  본 글은 Ubuntu 16.04 서버 위에서의 SPEC CPU 2006 v1.1 의
설치와 실행 방법에 대해 간단히 설명합니다.


Automated Toolbox
=================

아래 내용들을 하나하나 읽고 따라하기엔 시간이 부족할 분들을 위해, 한방에 설치 /
수행이 가능하도록 스크립트를 짜서 Github 에 올려뒀습니다[1].  시간이 없는
분들은 이쪽을 사용 바랍니다.

[1] https://github.com/sjp38/spec_on_ubuntu_xenial


설치 환경
=========

본 글에서 설명하는 내용은 다음과 같은 환경의 머신 위에서 수행되었습니다:

- Intel Xeon E7-8870 v3
- Linux 4.10 kernel
- Ubuntu 16.04.1 Server version


소스 코드 구하기
================

먼저 소스 코드가 있어야겠죠.  SPEC CPU 2006 은 DVD 또는 `.iso` 파일의 형태로
구매 [2] 될 수 있습니다 (작성 시점에서 SPEC CPU 2006 v1.2 의 가격은 $800 군요).
이렇게 구매된 DVD 안에는 벤치마크 소스코드와 벤치마크의 컴파일과 수행, 검증을
위한 tool 프로그램들의 소스코드, 미리 컴파일된 tool 프로그램들, 벤치마크 실행을
위한 규칙 파일, 그리고 문서등이 들어있습니다.  이 글에선 SPEC CPU 2006 v1.1 을
바탕으로 설명합니다.  `.iso` 파일을 구했다면 다음과 같은 명령으로 mount 해서 그
안의 파일들을 보고 사용할 수 있습니다:

```
$ mkdir tmnt
$ sudo mount -o loop SPEC_CPU2006v1.1.iso ./tmnt
$ ls tmnt
```

마운트한 위치에서 곧바로 설치 / 실행을 수행해도 좋지만 파일을 복사해두고
사용하겠습니다.  `mount` 를 `sudo` 로 해야하는 관계로 이 파일들의 owner 는
`root` 이며 쓰기권한도 없습니다.  굳이 `root` 가 되지 않고도 벤치마크를
설치하고 돌릴 수 있으므로 파일의 owner 와 권한을 바꿔줍니다:

```
$ mkdir SPEC_CPU2006v1.1
$ cp -R ./tmnt/* SPEC_CPU2006v1.1/
$ sudo umount ./tmnt && rm -fr ./tmnt
$ sudo chown -R <username> SPEC_CPU2006v1.1
$ sudo chmod -R 755 SPEC_CPU2006v1.1
$ cd SPEC_CPU2006v1.1
```


툴 빌드
=======

SPEC 에서 사용되는 도구들은 앞서 가져온 `.iso` 파일 안에 redhat, suse 등 여러
플랫폼 용으로 미리 빌드되어 있습니다.  하지만 Ubuntu 를 위한 버전은 없습니다.
따라서 다음과 같이 소스코드로부터 직접 빌드를 해야 합니다:

```
$ cd tools/src
$ ./buildtools
```

`buildtools` 는 셸 스크립트로, `tools/src` 아래 있는 각 툴들을 빌드합니다.
곧바로 진행되면 좋겠지만, 다음과 같은 에러들이 발생합니다.


Conflicting types for 'getline'
-------------------------------

`md5sum` 빌드 중 다음과 같은 에러 메세지가 나옵니다:

```
gcc -DHAVE_CONFIG_H    -I/home/sjpark/SPEC_CPU2006v1.1/tools/output/include   -I. -Ilib  -c -o md5sum.o md5sum.c
In file included from md5sum.c:38:0:
lib/getline.h:31:1: error: conflicting types for 'getline'
 getline PARAMS ((char **_lineptr, size_t *_n, FILE *_stream));
 ^
```

`md5sum` 빌드 중 `getline()`, `getdelim()` 함수가 `stdio.h` 에서 선언되어
있는데도 `getline.h` 파일에 또 선언되어서 conflicting type 으로 나는
문제입니다.  역시 툴 중 하나인 `tar` 의 경우엔 GLIBC 버전을 체크해 2 이상일
경우엔 해당 declaration 을 제거해 두었는데, `md5sum` 아래의 `getline.h` 엔 이
체크가 없기 때문에 문제가 됩니다.  다음과 같이 GLIBC 버전 체크를 추가해
중복선언이 없도록 수정해 줍니다:

```
--- a/tools/src/specmd5sum/lib/getline.h
+++ b/tools/src/specmd5sum/lib/getline.h
@@ -27,10 +27,14 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
 #  endif
 # endif

+# if __GLIBC__ < 2
+
 int
 getline PARAMS ((char **_lineptr, size_t *_n, FILE *_stream));

 int
 getdelim PARAMS ((char **_lineptr, size_t *_n, int _delimiter, FILE *_stream));

+#endif
+
 #endif /* not GETLINE_H_ */
```


Undefined reference to `pow`
----------------------------

이 문제와 아래의 두개의 문제는 인터넷 상의 SPEC CPU 2000 에 대한 비슷한 문제의
해결책[3] 을 참고했습니다.

이제 `perl` 빌드 중 다음과 같은 에러 메세지가 발생합니다:

```
cc -L/home/sjpark/SPEC_CPU2006v1.1/tools/output/lib -L/usr/local/lib -o miniperl \
            miniperlmain.o opmini.o libperl.a
libperl.a(pp.o): In function `Perl_pp_pow':
pp.c:(.text+0x2a76): undefined reference to `pow'
```

`pow` 함수를 찾지 못하는 문제로, `libm` 라이브러리를 링크 시점에 링크하도록
알려줘야 합니다.  다음과 같이 `PERLFLAGS` 환경변수를 설정하고 `buildtools` 를
실행하는 것으로 해결할 수 있습니다:

`$ PERLFLAGS="-A libs=-lm -A libs=-ldl" ./buildtools`


You haven't done a "make depend" yet!
-------------------------------------

이어서 다음 에러 메세지가 나옵니다.

```
You haven't done a "make depend" yet!
make[1]: *** [hash.o] Error 1
```

`perl` 빌드 중 사용되는 `/bin/sh` 은 `/bin/dash` 를 가리키고 있는데, `dash`
에서 생기는 문제입니다.  다음과 같이 심볼릭 링크를 수정해 `bin/sh` 이 `bash` 를
가리키도록 하면 문제는 해결됩니다.

```
$ sudo rm /bin/sh
$ sudo ln -s /bin/bash /bin/sh
```

시스템을 원래대로 돌리고 싶다면 빌드 끝나고 나중에 심볼릭 링크를 되돌리면
됩니다.


`asm/page.h` file not found
---------------------------

커널 헤더파일인 `asm/page.h` 파일을 `tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs`
파일에서 `include` 하고 있어 발생하는 문제가 다음과 같이 발생합니다:

```
cc -c   -I/home/sjpark/SPEC_CPU2006v1.1/tools/output/include -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.04\" -DXS_VERSION=\"1.04\" -fpic "-I../../.."   SysV.c
SysV.xs:7:25: fatal error: asm/page.h: No such file or directory
```

`SysV.xs` 파일의 해당 `include` 문을 다음과 같이 막고 `PAGE_SIZE` 를 정의해
줍니다.

```
--- a/tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs
+++ b/tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs
@@ -4,7 +4,7 @@

 #include <sys/types.h>
 #ifdef __linux__
-#   include <asm/page.h>
+#define PAGE_SIZE      4096
 #endif
```


`perl` test fail
----------------

위의 해결책을 모두 적용하고 `$ PERLFLAGS="-A libs=-lm -A libs=-ldl"
./buildtools` 를 수행하면 perl 쪽의 테스트 약 900개 가운데 9개 정도 fail 나는
문제가 있긴 하지만 이건 무시하겠다고 하면 무시가 되고 빌드 진행이 됩니다.
테스트 9개가 fail 났는데 무시하겠냐는 질문이 아래와 같이 뜨는데, 무시하겠다고
답해줍시다 (해당 프롬프트에서 설명하는대로, `y` 를 입력하면 됩니다).

```
Failed 9 test scripts out of 907, 99.01% okay.
### Since not all tests were successful, you may want to run some of
### them individually and examine any diagnostic messages they produce.
### See the INSTALL document's section on "make test".
### You have a good chance to get more information by running
###   ./perl harness
### in the 't' directory since most (>=80%) of the tests succeeded.
### You may have to set your dynamic library search path,
### LD_LIBRARY_PATH, to point to the build directory:
###   setenv LD_LIBRARY_PATH `pwd`:$LD_LIBRARY_PATH; cd t; ./perl harness
###   LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd t; ./perl harness
###   export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH; cd t; ./perl harness
### for csh-style shells, like tcsh; or for traditional/modern
### Bourne-style shells, like bash, ksh, and zsh, respectively.
u=0.92  s=0.69  cu=89.23  cs=5.47  scripts=907  tests=112394
make[2]: *** [_test_tty] Error 1
make[2]: Leaving directory `/home/sjpark/SPEC_CPU2006v1.1/tools/src/perl-5.8.8'
make[1]: *** [_test] Error 2
make[1]: Leaving directory `/home/sjpark/SPEC_CPU2006v1.1/tools/src/perl-5.8.8'
make: *** [test] Error 2
+ '[' 2 -ne 0 ']'
+ set +x


Hey!  Some of the Perl tests failed!  If you think this is okay, enter y now:
```


Build success
-------------

여기까지 오면 이제 빌드가 완료됩니다.

```
Tools built successfully.  Go to the top of the tree and
source the shrc file.  Then you should be ready.
$
```


실행
====


Configuration File
------------------

빌드가 완료되었다면 이제 실행을 해야겠죠.  벤치마크의 실행 환경을 구성해야
하는데, config/ 디렉토리 밑에 예제 구성 파일들이 있습니다.  이 가운데,
`Example-linux64-amd64-gcc43.cfg` 정도가 이 글을 작성하며 사용한 시스템에는
적당할 겁니다.  해당 파일을 바탕으로 자신만의 구성 파일을 만들어 `config/`
디렉토리 아래 저장합니다.  이 글에서는 `config/config.cfg` 라는 이름의 파일로
`Example-linux64-amd64-gcc43.cfg` 파일을 단순히 복사했습니다.


Environment Setup
-----------------

SPEC CPU 벤치마크를 수행하기 위한 환경변수 등을 설정해야 합니다.  다음 명령으로
간단히 이를 수행할 수 있습니다.
```
$ source ./shrc
```


Running Workload
----------------

최종적인 워크로드의 수행은 `runspec` 이라는 프로그램을 사용해 이루어집니다.  이
프로그램은 SPEC CPU 소스코드의 `bin/` 디렉토리 아래 위치해 있지만 앞서 행한
환경변수 설정으로 인해 커맨드라인에 경로를 직접 입력하지 않고도 수행할 수
있습니다.  예컨대 mcf 워크로드를 수행하고자 한다면 다음과 같은 커맨드를 사용할
수 있습니다:
```
$ runspec --iterations 1 --size ref --action onlyrun --config config.cfg --noreportable mcf
```

위 커맨드를 수행하면 mcf 워크로드가 수행되며, 수행 결과를 요약한 로그 파일의
경로를 다음과 같이 화면에 뿌려줍니다.
```
...

Run Complete

The log for this run is in /home/username/spec/spec_src/result/CPU2006.003.log

runspec finished at Sun Sep 24 13:55:14 2017; 290 total seconds elapsed
```

더 자신의 목적에 맞는 실험을 위해선 `runspec` 의 사용법을 파악해야 합니다.  이
글에서의 범위는 벗어나므로, 이에 대해서는 다른 문서들을 참고하시기 바랍니다.


Conclusion
==========

SPEC CPU 2006 을 Ubuntu 16.04 에 설치하는 과정을 알아봤습니다.  다음 글에서는
SPEC CPU 벤치마크를 실행해 보는 방법을 설명합니다.


References
----------

[0] http://spec.org/  
[1] http://spec.org/benchmarks.html#cpu  
[2] http://spec.org/order.html  
[3] https://wiki.linaro.org/MichaelHope/Sandbox/BuildingSPECTools
