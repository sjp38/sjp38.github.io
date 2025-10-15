+++
title = "LKMM Setup and Usage"
date = 2018-11-08T04:30:42+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "parallel programming", "memory model"]
categories = ["linux kernel"]

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

리눅스 커널은 Formalised and executable memory consistent model 을 제공합니다.
줄여서 linux kernel memory model (LKMM) 이라고 하죠.  이 글은 4.19 버전을
기준으로 LKMM 을 실제로 수행해 보기 위한 환경 셋업 과정과 간단한 실행 방법을
정리해 봅니다.  글 작성을 위한 테스트는 Ubuntu 16.04 서버가 설치된 가상머신에서
진행되었습니다.


herd7 install
=============

LKMM 은 버전 7.49 의 "herd7" 과 "klitmus7" 을 필요로 합니다.  하지만 herd7 은
또 Ocaml 을 위한 패키지 매니저인 OPAM 을 설치할 것을 필요로 하죠.  우분투에선
패키지 시스템이 OPAM 을 지원하므로 아래와 같이 쉽게 설치할 수 있습니다:

```
$ sudo apt install opam
$ opam init
$ sudo opam update
$ sudo opam upgrade
```

두번째 커맨드 수행 중 다음과 같은 질문이 나오는데, 디폴트 선택을 주기 위해 그냥
엔터를 칩니다:

```
Do you want OPAM to modify ~/.profile and ~/.ocamlinit?
(default is 'no', use 'f' to name a file other than ~/.profile)
    [N/y/f]
```

또한 `update` 와 `upgrade` 명령 시에 root 권한으로 이 커맨드를 수행하는 걸
권장하지 않는다고 하지만 정작 `sudo` 없이 하면 권한 없어서 실패합니다.

이제 다음 명령을 통해 herdtools 의 빌드와 설치를 진행합니다.

```
$ git clone https://github.com/herd/herdtools7 && cd herdtools7
$ git checkout 7.49
$ make all
$ make install
```

빌드에 약 3분 10여초가 소요됐습니다.  설치가 잘 되었는지 아래와 같이 확인해
봅니다:

```
$ herd7 -version
7.49, Rev: 93dcbdd89086d5f3e981b280d437309fdeb8b427
```


LKMM Download
=============

LKMM 은 리눅스 소스 트리의 `tools/memory-model/` 디렉토리에 있습니다.
`https://kernel.org` 에서 다운받거나 해서 사용하면 됩니다.

```
$ ls ~/linux/tools/memory-model/
Documentation      linux-kernel.cat  linux-kernel.def  lock.cat  scripts
linux-kernel.bell  linux-kernel.cfg  litmus-tests      README
```


Herd7 Based Litmus Tests Execution
==================================

```
$ herd7 -conf linux-kernel.cfg litmus-tests/SB+fencembonceonces.litmus
Test SB+fencembonceonces Allowed
States 3
0:r0=0; 1:r0=1;
0:r0=1; 1:r0=0;
0:r0=1; 1:r0=1;
No
Witnesses
Positive: 0 Negative: 3
Condition exists (0:r0=0 /\ 1:r0=0)
Observation SB+fencembonceonces Never 0 3
Time SB+fencembonceonces 0.01
Hash=d66d99523e2cac6b06e66f4c995ebb48
```


Klistmus7 Based Litmus Tests Execution
======================================

```
$ mkdir klitmus_test
$ klitmus7 -o klitmus_test/ litmus-tests/SB+fencembonceonces.litmus
$ cd klitmus_test/
$ ls
```

```
$ make
$ sudo sh run.sh
$ sudo sh ./run.sh
[sudo] password for sjpark:
Thu Nov  8 04:55:44 KST 2018
Compilation command: klitmus7 -o klitmus_test/ litmus-tests/SB+fencembonceonces.litmus
OPT=
uname -r=4.19.0

Test SB+fencembonceonces Allowed
Histogram (3 states)
16580117:>0:r0=1; 1:r0=0;
16402936:>0:r0=0; 1:r0=1;
3016947 :>0:r0=1; 1:r0=1;
No

Witnesses
Positive: 0, Negative: 36000000
Condition exists (0:r0=0 /\ 1:r0=0) is NOT validated
Hash=d66d99523e2cac6b06e66f4c995ebb48
Observation SB+fencembonceonces Never 0 36000000
Time SB+fencembonceonces 1.40

Thu Nov  8 04:55:45 KST 2018
```
