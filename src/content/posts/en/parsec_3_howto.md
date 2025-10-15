+++
title = "Parsec 3.0 설치 / 사용법"
subtitle = ""
date = "2017-05-19T06:23:15+09:00"
bigimg = ""
tags = ["parsec", "benchmark", "parsec3.0"]
categories = ["tip"]

+++

PARSEC 은 멀티쓰레드 프로그램들로 구성된 benchmark suite 입니다.  멀티쓰레드로
구성되어 있기 때문에 멀티코어 시스템에서의 multi core scalability 를 테스트
하기에도 적합합니다.  이 글에선 현재 최신 버전인 3.0 버전의 PARSEC 을 Ubuntu
16.04 server 에 설치하면서 겪는 문제의 해결법과 간단한 사용법을 정리해 봅니다.


Toolbox for PARSEC 3.0 on Ubuntu Xenial
=======================================

아래의 내용을 하나하나 읽어가면서 따라하는 것도 귀찮은 일입니다.  그래서
아래에서 설명하는, Ubuntu Xenial 에서 PARSEC 3.0 을 돌리기 위해 필요한 작업을
대부분 자동으로 해주는 도구들을 만들어 두었습니다.  오픈소스로 공개되어
있으니[1], 아래의 머리 아픈 내용을 읽기 귀찮다면 해당 도구들을 사용하시기
바랍니다.  해당 도구들의 사용법은 README 에 간략히 설명되어 있습니다.

[1] https://github.com/sjp38/parsec_on_ubuntu_xenial


PARSEC 3.0 Download
====================

공식 홈페이지[1] 에 들어가면 PARSEC 3.0 다운로드 링크가 첫페이지부터 있습니다.
해당 링크를 사용하면 `tar.gz` 포맷의 tarball 로 정리된 PARSEC 3.0 을 다운받을
수 있습니다.  웹브라우저로 들어가서 다운로드를 받는 방법도 있겠고, `curl` 이나
`wget` 등의 command line tool 을 사용해 다운받을 수도 있겠습니다.  다음
커맨드는 PARSEC 3.0 을 다운받아 `parsec-3.0/` 디렉토리 아래 압축을 풀고 압축을
푼 디렉토리로 이동합니다.

```
$ wget http://parsec.cs.princeton.edu/download/3.0/parsec-3.0.tar.gz
$ tar zxvf parsec-3.0.tar.gz
$ cd parsec-3.0
```


Build
=====

이제 PARSEC 3.0 을 빌드해야 합니다.  PARSEC 은 여러 벤치마크를 포함하고
있으므로 개별적 벤치마크를 하나하나 직접적으로 다루기보다는 suite 내의 각
벤치마크를 통합적으로 관리할 수 있는 `parsecmgmt` 라는 관리 프로그램을
사용하도록 되어 있습니다.  빌드 역시 마찬가지입니다.  참고로, `parsecmgmt` 는
bash script 입니다.

기본적인 PARSEC 3.0 빌드 방법은 다음과 같이 간단합니다:

```
$ source ./env.sh
$ parsecmgmt -a build
```

첫번째 커맨드는 parsecmgmt 의 경로를 PATH 에 추가하는 등, 환경 변수 설정 등의
일을 처리해 주며, 두번째의 간단한 커맨드가 전체 PARSEC 3.0 빌드 프로세스를
수행하게 됩니다.


Perl Version Problem
--------------------

하지만 Ubuntu 16.04 server 에서는 다음과 같은 에러 메세지를 내뱉으며 빌드에
실패합니다:

```
smime.pod around line 272: Expected text after =item, not a number
smime.pod around line 276: Expected text after =item, not a number
smime.pod around line 280: Expected text after =item, not a number
smime.pod around line 285: Expected text after =item, not a number
smime.pod around line 289: Expected text after =item, not a number
POD document had syntax errors at /usr/bin/pod2man line 68.
make: *** [install_docs] Error 1
Makefile:680: recipe for target 'install_docs' failed
[PARSEC] Error: 'env PATH=/usr/local/sbin:...' failed.
```

에러 메세지에서 유추할 수 있듯 PARSEC 3.0 의 소스 코드 중 smime.pod 파일이
문법에 맞지 않아 생긴 문제입니다.  참고로 pod 는 perl 프로그램 문서화에
사용되는 간단한 markup language 입니다[2].  Ubuntu 16.04 는 perl 5.22.1 버전을
기본으로 사용하고 있는데, PARSEC 3.0 에 있는 코드는 perl 5.14.2 버전에 맞춰져
있으며 최신 버전으로 오는 사이 문법이 바뀐 것으로 인한 문제로 보입니다.
해결책은 두가지가 있습니다.


__방법 1: perl 5.14.2 설치__

Google groups 의 관련 쓰레드[3] 를 참고한 방법입니다.
5.14.2 버전의 perl 소스코드를 받아와 이를 설치하고 PARSEC 빌드에 이 버전의 perl
을 사용하는 방법입니다.  다음의 커맨드로 `~/localperl/` 디렉토리 아래 5.14.2
버전 perl 을 설치하고 사용할 수 있습니다.

```
wget http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz
$ tar zxvf perl-5.14.2.tar.gz
$ cd perl-5.14.2/
$ mkdir ~/localperl
$ ./Configure -des -Dprefix=$HOME/localperl
$ time make -j
$ make test
$ make install
$ ~/localperl/bin/perl -v
```

__방법 2: pod 파일 문법 오류 수정__

좀 더 정공법에 가까운 방법으로, 다음 글을 참고한 해결책입니다:
https://yulistic.gitlab.io/2016/05/parsec-3.0-installation-issues/

최신 버전의 문법에 맞게 pod 파일의 문제시 되는 부분들을 고쳐주는 것으로,
문제되는 모든 pod 파일의 `=item [0-9]` 을 `=item C<[0-9]>` 으로 바꿔줍니다.
`diff` 로 표현하면 다음과 같은 수정을 가하게 되겠습니다:

```
--- a/pkgs/libs/ssl/src/doc/apps/smime.pod
+++ b/pkgs/libs/ssl/src/doc/apps/smime.pod
@@ -265,28 +265,28 @@ encrypted data is used for other purposes.

 =over 4

-=item 0
+=item C<0>

 the operation was completely successfully.

-=item 1
+=item C<1>

 an error occurred parsing the command options.

-=item 2
+=item C<2>

 one of the input files could not be read.

-=item 3
+=item C<3>

 an error occurred creating the PKCS#7 file or when reading the MIME
 message.

-=item 4
+=item C<4>

 an error occurred decrypting or verifying the message.

-=item 5
+=item C<5>

 the message was verified correctly but an error occurred writing out
 the signers certificates.
```

이렇게 파일 하나하나 수정하면 이 에러 메세지는 사라집니다.  참고한 링크에서는
하나하나 손으로 수정하기보다는 다음과 같이 간단한 bash shell script 를 짜서
일괄적으로 수정하는 걸 추천합니다:

```
#! /bin/bash
for i in 0 1 2 3 4 5 6 7 8 9 
do
    echo "Replacing '=item $i' to '=item C<$i>'"
    grep -rl "=item $i" * | xargs sed -i "s/=item $i/=item C<$i>/g"
done
```

이어서 설명할 문제들과 해결책도 해당 링크를 참고한 것임을 밝혀둡니다.


`__mbstate_t` Conflict
----------------------

앞의 에러 메세지는 사라지지만 이제 다음과 같은 에러 메세지가 나올 겁니다:
```
/usr/include/wchar.h:94:3: error: conflicting types for ‘__mbstate_t’
 } __mbstate_t;
   ^
In file included from ../include/machine/bsd_endian.h:37:0,
                 from ../include/sys/bsd_types.h:44,
                 from ../include/sys/bsd_param.h:64,
                 from if_host.c:48:
../include/sys/bsd__types.h:105:3: note: previous declaration of ‘__mbstate_t’ was here
 } __mbstate_t;
   ^
In file included from ../include/net/bsd_if_var.h:82:0,
                 from ../include/net/bsd_if.h:459,
                 from if_host.c:57:
../include/sys/bsd_buf_ring.h: In function ‘buf_ring_dequeue_sc’:
../include/sys/bsd_buf_ring.h:200:33: warning: variable ‘cons_next_next’ set but not used [-Wunused-but-set-variable]
  uint32_t cons_head, cons_next, cons_next_next;
                                 ^
make[1]: *** [if_host.o] Error 1
```

`basd__types.h` 파일에 `__mbstate_t` 타입을 중복 정의했기 때문에 발생한
문제입니다.  해당 파일에서 해당 정의 부분을 다음과 같이 주석 처리하면 이 문제는
사라집니다.

```
diff --git a/pkgs/libs/uptcpip/src/include/sys/bsd__types.h b/pkgs/libs/uptcpip/src/include/sys/bsd__types.h
index fa1b0f0f26d9..bd7e6a97f4c8 100644
--- a/pkgs/libs/uptcpip/src/include/sys/bsd__types.h
+++ b/pkgs/libs/uptcpip/src/include/sys/bsd__types.h
@@ -93,6 +93,7 @@ typedef       __ct_rune_t     __wint_t;       /* wint_t (see above) */

 typedef        __uint32_t      __fixpt_t;      /* fixed point number */

+#if 0  /* Skip conflicting __mbstate_t definition */
 /*
  * mbstate_t is an opaque object to keep conversion state during multibyte
  * stream conversions.
@@ -104,5 +105,6 @@ typedef union {
        __int64_t       _mbstateL;      /* for alignment */
 } __mbstate_t;
 #endif
+#endif /* Skip conflicting __mbstate_t definition */

 #endif /* !_BSD_SYS__TYPES_H_ */
```


pkg-config Package Not Found
----------------------------

성공적인 빌드를 위해선 당연하지만 PARSEC 3.0 이 의존성을 가진 패키지가 모두
설치되어 있어야 합니다.  이를 주의 깊게 미리 설치해 두지 않았다면 다음과 같은
에러 메세지를 만날 수도 있습니다:

```
configure: error: *** pkg-config not found. See http://www.freedesktop.org/software/pkgconfig/
[PARSEC] Error: ...
```

위 메세지는 `pkg-config` 프로그램이 설치되어 있지 않아서 발생한 문제임을 알 수
있습니다.  간단히 Ubuntu 의 package 시스템인 apt 를 사용해 다음과 같이 해당
프로그램을 설치해 주면 문제는 사라집니다.

```
$ sudo apt install pkg-config
```


Build Success
-------------

이 정도까지가 나타날 수 있는 대부분의 문제입니다.  위 해결책들을 모두
적용했다면 아마 빌드에 성공할 겁니다.  빌드에 성공하면 다음과 같이 성공했다는
메세지를 볼 수 있을 겁니다:

```
[PARSEC]
[PARSEC] BIBLIOGRAPHY
[PARSEC]
[PARSEC] [1] Bienia. Benchmarking Modern Multiprocessors. Ph.D. Thesis, 2011.
[PARSEC] [2] Woo et al. The SPLASH-2 Programs: Characterization and Methodological Considerations. ISCA, 1995.
[PARSEC]
[PARSEC] Done.
```

참고로 빌드에 꽤 긴 시간이 소모됩니다.  제가 사용한 72 코어 / 144 쓰레드
머신에서도 약 10분이 걸렸습니다.


Simple Usage
============

이제 빌드가 잘 되었는지 돌려봐야 할 차례입니다.  다음 커맨드는 각 벤치마크를
가장 작은 크기의 데이터셋을 가지고 실행해 보기 때문에 각 벤치마크가 돌아가긴
하는지만 보는데 적격입니다:
```
parsecmgmt -a run
```

가장 작은 크기의 데이터셋을 사용하기 때문에 모든 벤치마크를 수행하지만 빠르게
종료됩니다.


`parsecmgmt` Options
--------------------

`-a` 옵션은 action 을 의미합니다.  앞의 섹션에서는 빌드를 위해 여기에 `build`
값을 주었고, 여기선 벤치마크 수행을 위해 `run` 값을 준 것입니다.

`-i` 옵션을 통해 벤치마크들은 워크로드에서 사용할 데이터 크기를 지정할 수
있습니다.  이 인자의 값으로 test, simdev, simsmall, simmedium, simlarge, native
를 줄 수 있습니다.  Test 는 정확성 테스트만을 위한, 빨리 끝나는 데이터로 이
인자를 주지 않으면 default 로 이 값이 취해집니다.  native 는 가장 realworld
workload 에 가까운 벤치마크를 위한 데이터라 볼 수 있습니다.

`-p` 옵션을 통해 어떤 sub benchmark 를 돌릴지 정할 수 있습니다.  이 옵션을
별도로 주지 않으면 모든 benchmark 를 돌리게 됩니다.

`-n` 옵션은 number of threads to use 입니다.

예를 들어 `parsecmgmt -p canneal -a run -i native -n 1` 은 `canneal` sub
benchmark 하나만을 쓰레드 한개 써서 `native` 데이터셋으로 실행합니다.


References
==========

[1] http://parsec.cs.princeton.edu  
[2] https://en.wikipedia.org/wiki/Plain_Old_Documentation  
[3] https://groups.google.com/forum/#!topic/snipersim/_1qpbmpPRtg
