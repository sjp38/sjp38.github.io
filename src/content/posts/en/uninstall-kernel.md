+++
thumbnail = ""
title = "uninstall kernel"
description = ""
date = "2017-01-20T13:18:56+09:00"
categories = [
	"sysop",
]
tags = [
	"linux",
	"kernel",
	"tip",
]

+++

테스트 등을 위해 소스코드로부터 커널을 직접 빌드, 설치하기 시작하면 어느새
수많은 커널이 설치되어 있는 것을 확인할 수 있다.  삭제를 위해선 `make install`
로 만들어진 파일들을 직접 제거하고 grub 을 업데이트 해줘야 한다.

예를 들어 시스템이 현재 부팅되어 있는 버전의 커널을 언인스톨하고자 한다면
다음의 일련의 커맨드를 입력하면 된다:
```
# rm /boot/vmlinuz-$(uname -r)
# rm /boot/initrd.img-$(uname -r)
# rm /boot/System.map-$(uname -r)
# rm /boot/config-$(uname -r)
# rm -fr /lib/modules/$(uname -r)
# rm /var/lib/initramfs-tools/$(uname -r)
# update-grub2
```

다른 버전의 설치되어있는 커널을 제거하고 싶다면 위의 `$(uname -r)` 부분을
제거하고자 하는 커널 버전으로 대체하면 된다.


참고 문서
---------

- http://askubuntu.com/questions/594443/how-can-i-remove-compiled-kernel
