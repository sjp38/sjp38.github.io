+++
title = "Linux Kernel Build"
date = 2018-09-07T16:00:23+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "hack", "development", "setup"]
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

제가 새 기계에서 리눅스 커널 빌드 환경을 셋업하고 실제 빌드, 설치하는 과정을
정리해 봅니다.  글 작성 과정에서 실제 커맨드를 수행한 환경은 Ubuntu 16.04.3
Server OS 를 설치한 `x86_64` 가상머신입니다.


Install Dependent Packages
==========================

```
$ sudo apt install build-essential libncurses5-dev libssl-dev bc bison flex \
		libelf-dev
```

커널을 빌드하려면 컴파일러와 라이브러리 등이 필요하겠죠.  위 커맨드는
우분투에서 커널 빌드에 필요한 패키지들을 깔아줍니다.  커널 트리의
`Documentation/process/changes.rst` 에도 커널 빌드에 필요한 패키지들이 나열되어
있으므로, 다른 환경이라면 이를 참고해 필요한 패키지를 설치합시다.

페도라라면 아래와 같이 패키지를 깔면 됩니다:
```
$ sudo dnf install ncurses-devel bison-devel bison flex-devel flex \
		elfutils-libelf-devel openssl-devel
```


Fetch Linux Kernel Source Code
==============================

```
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
```

빌드를 하려면 소스코드를 가져와야죠.  위 커맨드를 통해 토발즈의 리눅스
소스코드를 가져올 수 있습니다.  네트워크를 통해 가져오는데, 소스코드는 물론이고
개발 이력 정보를 모두 담고 있으므로 많은 데이터를 가져와야해 시간이 상당히
걸립니다.  이 글을 쓰는 2018년 9월 초 기준, 버전정보만 약 1.2 GiB 군요.

토발즈는 github 에 [미러] (https://github.com/torvalds/linux) 를 두고 있으므로,
여길 이용하는 것도 생각해 볼 수 있고, 굳이 버전 정보는 필요하지 않다면
[`kernel.org`] (https://kernel.org) 에서 tarball 로 소스코드만 받는것도 한
방법입니다.

저는 아예 `.git` 디렉토리를 압축해서 별도 저장소에
보관하기도 합니다.


Make Configuration File
=======================

```
$ cd linux
$ cp /boot/config-$(uname -r) ./.config
$ make menuconfig
```

리눅스 빌드 설정 파일을 만들어야 합니다.  앞의 커맨드를 통해 배포판에서 제공한
커널을 빌드하는데 사용된 설정 파일을 기반으로 gui 환경에서 필요한 설정을
추가/제거 할 수 있습니다.  별달리 변경할 게 없다면 그냥 저장하고 나오면 됩니다.

저는 빌드에 많은 시간이 걸리지 않고 저장 공간이 큰 시스템에서는 이 방법을
사용하고, 작은 가상머신 등의 환경에서는 `localmodconfig` 빌드 타겟을 사용해
가벼운 설정 파일을 만드는 편입니다.


Seperated Build Directory
-------------------------

이렇게 빌드를 하면 컴파일된 파일들이 소스코드와 같은 디렉토리에 위치하게
되는데, `grep` 등을 할때 성가시고, 실수로 git 에 이렇게 만들어진 파일들을
추가하는 실수도 흔합니다.  리눅스 커널 빌드 시스템은 `make` 커맨드에 `O` 옵션을
제공하는데, 이 옵션의 인자로 빌드 디렉토리를 지정할 수 있습니다.  빌드 과정에서
만들어진 파일들은 이 디렉토리로 저장되므로, 소스코드 디렉토리를 깨끗하게 유지할
수 있습니다.  예를 들어 `/foo` 라는 디렉토리에 빌드 과정에서 만들어진 파일을
저장하고 싶다면 다음과 같습니다.

```
$ make O=/foo menuconfig
```


Build
=====

```
$ make -j $(grep "^processor" /proc/cpuinfo | wc -l)
```

이 커맨드는 리눅스 커널을 빌드합니다.  이 때 뒤의 `-j` 옵션을 통해 빌드 과정
작업을 한순간에 최대 몇개까지 수행해도 되는지 지정해주는데, 이 커맨드에선
빌드를 수행하는 시스템에 장착된 논리적 코어의 갯수를 줬습니다.  커널 빌드엔 긴
시간이 걸립니다.  프로세서 3개를 준 제 가상머신에서는 12분 30초 정도 걸렸군요.
이것도 `localmodconfig` 를 해줬기 때문이고, 이런저런 모듈 다 빌드하라고 했다면
훨씬 많이 걸렸을 겁니다.


Install
=======

```
$ sudo make modules_install install
```

이 커맨드는 빌드한 모듈들과 커널 자체를 설치합니다.  커널 빌드 시스템은 이
과정에서 가장 최신의 커널로 grub 의 디폴트 부트 대상도 바꿔줍니다.  이제 기계를
껐다 켜되, grub 등에서 부트할 커널 버전을 해당 버전으로 선택하면 빌드한 커널로
부팅됩니다.  현재 시스템이 사용중인 커널의 버전은 `uname -r` 로 알 수 있습니다.


Conclusion
==========

이상으로 Ubuntu 16.04.3 을 기본으로 리눅스 커널을 빌드하고 설치하는 방법을
알아봤습니다.  총 일곱개의 커맨드 뿐.   쉽죠?
