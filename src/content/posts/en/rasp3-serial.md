+++
title = "Raspberry Pi 3 Serial Connection"
date = 2018-08-27T17:16:35+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["raspberry", "setup", "serial"]
categories = ["Raspberry Pi"]

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

라즈베리 파이를 메인 컴퓨터로 사용하려는게 아니라면, 라즈베리 파이에 모니터와
키보드, 마우스를 연결하고 사용하는게 아무래도 번거롭습니다.  ssh 로 붙어서
작업하는 것도 한 방법이지만, 그게 여의치 않은 상황도 있습니다.  그저 터미널만
연결되면 되는 상황이라면, 가장 간단한 건 UART Serial 통신을 사용하는 겁니다.

라즈베리 파이는 UART 통신을 지원하고 있는데, GPIO 핀 중 14번과 15번이[2] 각각
TX, RX 입니다.  호스트 컴퓨터와 이 두개의 핀을 연결하면 UART 통신을 할 수
있어서 라즈베리 파이의 터미널에 바로 접근할 수 있습니다.

호스트 머신에 핀을 연결하는게 번거로울 수 있는데, 시리얼-USB 젠더를 여기저기서
저렴한 가격에 팝니다[1].  이걸 이용해 TX/RX 핀을 라즈베리 파이의 GPIO 14, 15번에
각각 연결하고 USB 를 호스트 머신에 연결합니다.

이제 호스트 머신의 `/dev/` 디렉토리에 `ttyUSB` 로 시작하는 파일이 생겼을
겁니다.  제 경우 `ttyUSB0` 라는 이름의 파일이 생겼군요.  이제, 시리얼 통신
프로그램인 `minicom` 을 사용해서 이 포트로 연결해서 UART 통신을 합시다:
```
$ sudo minicom -D /dev/ttyUSB0
```

이제 라즈베리 파이를 부팅 시키면 부팅 로그부터 터미널에 나오고, 로그인 화면까지
뜹니다.


라즈베리파이3 시리얼 문제와 해결법
==================================

하지만, 라즈베리 파이 3 에서는 내장으로 블루투스와 WiFi 가 들어가면서 GPIO 핀이
겹치게 되어 앞의 과정만으로는 시리얼 통신을 할 수 없습니다.  블루투스를 끄고
시리얼을 켜줘야 합니다.

먼저, 다음과 같이 `/boot/config.txt` 파일에 다음 두줄을 추가합니다:
```
$ sudo echo "enable_uart=1" >> /boot/config.txt
$ sudo echo "dtoverlay=pi3-miniuart-bt" >> /boot/config.txt
```

그리고 /boot/cmdline.txt 를 열어서 `console=tty1` 이라는 내용을 추가해줍니다.

준비가 끝났습니다.  재부팅 하면 `minicom` 에 라즈비안 콘솔이 연결됩니다.

[1] https://www.devicemart.co.kr/29565  
[2] https://www.raspberrypi.org/documentation/usage/gpio/  
