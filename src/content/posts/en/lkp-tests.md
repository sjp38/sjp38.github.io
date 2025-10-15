+++
title = "Linux Kernel Performance (LKP) Tests"
date = 2018-08-02T17:20:10+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "test", "evaluation", "benchmark"]
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

리눅스 커널의 개발은 커뮤니티 주도입니다.  개발의 한 부분인 테스트 역시
커뮤니티 주도적입니다.  여러 개인 또는 단체가 커널을 각자의 방식으로 테스트
하고 그 결과를 공유합니다.  인텔에서는 0-day 서비스[1] 라는 서비스를 자체적으로
돌리는데, 이 서비스는 최신 리눅스 커널을 가져다가 빌드하고 다양한 기능 / 성능
테스트를 돌리고 그 결과 발견된 regression 을 LKML 에 메일로 보내주는 일을
합니다.  말하자면 Continuous Integration (CI) 이죠.

Linux Kernel Performance (LKP) Tests[2] 는 0-day 서비스에서 기능 / 성능 테스트를
수행하는데 사용되는 도구입니다.  다양한 테스트를 돌리기 위한 시스템 환경 구성,
테스트 프로그램과 그 종속 프로그램 / 라이브러리의 설치와 환경 구성, 테스트
수행과 결과 정리, 그리고 테스트 진행 사이의 시스템 상태 프로파일링 및
프로파일링 결과 정리를 대신해 줍니다.  0-day 서비스에 연결되어 있지만 lkp-tests
와 0-day 서비스 사이의 종속성이 없으며, 오픈소스 프로젝트로 개발이 진행되고
있어 그 소스코드를 누구나 사용할 수 있으며 개인이 사용하기에도 편리하게 되어
있어서 개인 개발자가 자신의 패치를 테스트할 목적으로 사용하기에도 좋습니다.  이
글에서는 이러한 lkp-tests 의 구조와 사용법을 간단히 설명합니다.  전체적으로
인텔의 관련 블로그 글[3] 을 참고했습니다.


설치
====

먼저 다음 커맨드로 lkp-tests 소스코드를 얻어옵니다:

```
$ git clone https://github.com/intel/lkp-tests
$ cd lkp-tests
```

그리고 lkp-tests 자체를 설치.
```
$ sudo make install
```

이 커맨드는 단순히 지금 소스코드를 땡겨온 lkp-tests 소스코드 디렉토리의
`bin/lkp` 파일을 링크하는 `/usr/local/bin/lkp` 심볼릭 링크를 만들 뿐입니다.
따라서 셸에서 `lkp` 커맨드를 쓸 수 있게 해주죠.  이 `lkp` 파일이 결국 lkp-tests
의 대부분의 일을 해주는 핵심 커맨드입니다.  이 프로그램의 간단한 사용법은
다음과 같이 확인할 수 있습니다:

```
$ lkp
Usage: lkp <command> [options]

INSTALLATION

        install JOB                     install binary dependencies for JOB

JOB

        split JOB                       split JOB matrix
        compile JOB                     compile JOB into shell script

TESTING

        run JOB                         run test JOB locally
        qemu JOB                        run test JOB in QEMU virtual machine

RESULT

        result|rt|_rt|__rt PATTERNs     show result dirs
        ls|ll PATTERNs                  ls result dirs
        rm-path result                  remove result dirs
        _rm PATTERNs                    remove _result dirs

        stat [options]                  show result stats
        compare [options]               compare result stats

DEBUG

        irb                             run irb with lib/*.rb loaded
        pry                             run pry with lib/*.rb loaded

More commands can be found in /home/sjpark/lkp-tests/{bin,sbin,tools}/
```

여기서 `<command>` 는 lkp-tests 소스코드 디렉토리 아래 `bin/`, `sbin/`,
`tools/`, 또는 `lkp-exec/` 아래 위치한 실행파일로, `lkp` 는 단순히 그
실행파일을 수행하면서 인자를 넘길 뿐입니다.


테스트에 필요한 소프트웨어 설치
===============================

다음 커맨드는 lkp-tests 가 의존하고 있는 기본적 소프트웨어 패키지들을 모두
설치합니다:

```
$ sudo lkp install
```

Ubuntu 16.04 에서는 다음 패키지들을 까는군요:

```
bc gawk gzip kmod time automake bison bsdtar build-essential bzip2
ca-certificates cpio fakeroot flex gcc git libc6-dev libc6-dev:i386
libklibc-dev libtool linux-libc-dev linux-libc-dev:i386 linux-tools-generic
make openssl patch rsync ruby ruby-dev wget
```


lkp-tests 내부 벤치마크 실행
============================

이제 lkp-tests 에서 지원하는 벤치마크를 실제로 돌려봅시다.


테스트 수행에 필요한 환경 설정
------------------------------

실제 테스트를 돌리기 위해선 벤치마크를 깔고, 그 벤치마크가 사용하는 패키지를
깔고, 테스트에 사용될 도구들을 깔고, 여러 설정을 하는등의 작업이 필요합니다.

다음 명령은 lkp-tests 에서 ebizzy 라는 벤치마크를 사용하는 테스트를 위해
필요한 프로그램들을 설치하고 수행 환경을 준비합니다.

```
$ sudo lkp install jobs/ebizzy.yaml
```


job
---

lkp-tests 에서 테스트 수행의 기본 단위는 `job` 이라고 이야기 하는데, `jobs/`
디렉토리 아래에 각 job 을 설명한 yaml 파일이 있습니다.  위의 커맨드에서 인자로
넣은 `ebizzy.yaml` 은 ebizzy 를 사용한 테스트에 필요한 사항들이 들어있습니다.
이 커맨드는 내부적으로 이 테스트에 필요한 패키지를 설치하고 ebizzy 벤치마크도
소스코드를 인터넷에서 받아다가 컴파일해 설치합니다.

Job 파일은 또한 해당 테스트가 어떤 시스템 환경들에서 어떤 벤치마크를 어떤
인자를 줘가며 수행해야할지 등에 대한 내용을 담고 있습니다.  예컨대
`jobs/aim7-fs-1brd.yaml` job 은 `xfs`, `ext4`, `btrfs`, `f2fs` 파일 시스템
각각에 대해 aim7 을 돌려보도록 되어 있습니다.


테스트 수행
-----------

다음 명령은 ebizzy job 으로 기술된 테스트를 실제 수행시킵니다:

```
$ sudo lkp run jobs/ebizzy.yaml
```


job 쪼개기
----------

`ebizzy.yaml` 은 시스템 소유 CPU 코어 갯수 2배 갯수의 쓰레드를 사용해 ebizzy 를
10초간 돌리는 실험을 100번 반복하도록 되어 있습니다.  즉, 실험의 경우의 수가
하나입니다.  그러나, 앞서 설명한 `aim7-fs-1brd` 와 같이 다양한 구성을 사용하게
되어 있는 경우, 한가지 구성에 대해서만 반복 실험을 하고 싶을 수 있을 겁니다.
이런 경우 다음 명령으로 job 을 쪼갤 수 있습니다:

```
$ sudo lkp split jobs/ebizzy.yaml
```

이 커맨드는 인자로 넣은 job 파일을 쪼개서 현재 디렉토리에 쪼개진 job 파일들을
저장합니다.  어떤 구성이 쪼개졌는지는 파일 이름으로 볼 수 있습니다.
`ebizzy.yaml` 을 쪼개면 `ebizzy-200%-100x-10s.yaml` 라는 이름의 한개의 job
파일이 생성됩니다.  앞서 이야기한 `aim7-fs-1brd.yaml` 을 쪼개면 다음과 같이
많은 수의 job 이 생성됩니다:

```
aim7-fs-1brd-1BRD_48G-btrfs-creat-clo-4.yaml
aim7-fs-1brd-1BRD_48G-f2fs-creat-clo-1500.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_cp-1500.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_cp-3000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_rd-9000.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_rd-9000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_rr-1500.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_rr-3000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_rw-1500.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_rw-3000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_src-500.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_src-3000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-disk_wrt-1500.yaml
aim7-fs-1brd-1BRD_48G-f2fs-disk_wrt-3000.yaml
aim7-fs-1brd-1BRD_48G-btrfs-sync_disk_rw-10.yaml
aim7-fs-1brd-1BRD_48G-f2fs-sync_disk_rw-600.yaml
aim7-fs-1brd-1BRD_48G-ext4-creat-clo-1000.yaml
aim7-fs-1brd-1BRD_48G-xfs-creat-clo-1500.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_cp-3000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_cp-3000.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_rd-9000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_rd-9000.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_rr-3000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_rr-3000.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_rw-3000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_rw-3000.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_src-3000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_src-3000.yaml
aim7-fs-1brd-1BRD_48G-ext4-disk_wrt-3000.yaml
aim7-fs-1brd-1BRD_48G-xfs-disk_wrt-3000.yaml
aim7-fs-1brd-1BRD_48G-ext4-sync_disk_rw-600.yaml
aim7-fs-1brd-1BRD_48G-xfs-sync_disk_rw-600.yaml
```


테스트 결과 확인
================

테스트에 사용된 벤치마크 수행의 결과와 테스트 동안의 시스템 프로파일링 결과는
`/lkp/result/` 디렉토리 밑에 `<job name>/<configuration>/<host name>/<os
distribution name>/<kernel config>/<gcc version>/<kernel version>/<unique id>`
의 계층 구조로 저장됩니다.  또한, 이 실험 결과를 parsing 할 수 있는 경우엔
`.json` 파일을 만들어 줘서 parsing 된 결과 값도 보여줍니다.

또한, 최근의 테스트 결과는 테스트 돌린 디렉토리에 `result/` 라는 이름의,
`/lkp/result/` 아래 해당 디렉토리로의 심볼릭 링크를 만들어 줍니다.


Conclusion
==========

이렇게 lkp-tests 가 무엇인지, 그리고 어떻게 사용할 수 있는지 알아봤습니다.
이제, 리눅스 커널 개발 커뮤니티에서 사용하는 리그레션 테스트를 여러분의
환경에서도 손쉽게 돌려볼 수 있습니다.


References
----------

[1] https://01.org/lkp/documentation/0-day-test-service  
[2] https://github.com/intel/lkp-tests  
[3] https://01.org/blogs/jdu1/2017/lkp-tests-linux-kernel-performance-test-and-analysis-tool  
[4] https://wiki.archlinux.org/index.php/makepkg
