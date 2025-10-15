+++
title = "Raspberry Pi 3 Model B Setup"
date = 2018-08-27T16:03:42+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["raspberry", "setup"]
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

OSSE 2016 에서 받아온 라즈베리 파이3 셋업을 해봅니다.
셋업에 사용된 호스트 환경은 Ubuntu 16.04 데스크탑입니다.

라즈베리 파이는 SD 카드를 저장소로 사용합니다.  따라서 여기에 운영체제를 깔아야
합니다.  다만, 라즈베리 파이를 구매하면 SD 카드는 따라오지 않습니다.  각자
알아서 사야 합니다.  전 예전에 사둔 16 GiB 짜리 SD 카드를 사용하겠습니다.

라즈베리 파이를 지원하는 운영체제는 여러가지 있는데, 데비안 계열의 Raspbian 이
공식 운영체제입니다.  [다운로드 페이지](https://www.raspberrypi.org/downloads/)
에서 Raspbian stretch lite 를 다운받고 압축을 풀어줍니다.

```
$ ls
2018-06-27-raspbian-stretch-lite.zip
$ unzip 2018-06-27-raspbian-stretch-lite.zip 
Archive:  2018-06-27-raspbian-stretch-lite.zip
  inflating: 2018-06-27-raspbian-stretch-lite.img  

$ ls
2018-06-27-raspbian-stretch-lite.img  2018-06-27-raspbian-stretch-lite.zip
```

압축 파일이 350 MiB, 압축 푼 이미지는 1.8 GiB 나 하는군요.

이제 요걸 SD 카드에 써야하는데요, 일단 SD 카드를 데스크탑에 연결하고, `df` 명령을 이용해 이게 어떤 디바이스 파일로 인식되었는지 봅시다:
```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G  174M  1.4G  11% /run
/dev/sda1       222G  127G   84G  61% /
tmpfs           7.8G  161M  7.7G   3% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
tmpfs           1.6G   68K  1.6G   1% /run/user/1000
/dev/sdb        917G  541G  330G  63% /media/sjpark/47f422d0-445f-4dfc-86ca-559b801eb9d3
/dev/sdc2        15G  4.7G  9.3G  34% /media/sjpark/f24a4949-f4b2-4cad-a780-a138695079ec
/dev/sdc1        56M   24M   33M  42% /media/sjpark/boot
```

제가 사용한 SD 카드는 기존에 라즈베리파이2 모델 B+ 운영체제가 설치되어
있었습니다.  /`dev/sdc` 로 SD 카드가 잡혔고, `/dev/sdc1` 으로 부팅 파티션이,
`/dev/sdc2` 로 데이터 파티션이 잡힌 것 같군요.

이제 마운트된 파티션들을 언마운트하고, `dd` 명령으로 이미지를 덮어씌웁시다:

```
$ sudo umount /media/sjpark/f24a4949-f4b2-4cad-a780-a138695079ec
$ sudo umount /media/sjpark/boot
$ sudo dd bs=4M if=./2018-06-27-raspbian-stretch-lite.img of=/dev/sdc
444+0 records in
444+0 records out
1862270976 bytes (1.9 GB, 1.7 GiB) copied, 199.44 s, 9.3 MB/s
$ sync
```

처음 두개 커맨드가 언마운트를 하고, 세번째 커맨드가 이미지를 덮어씌우는
커맨드입니다.  혹시 모르니 네번째 커맨드에서 `sync` 해서 데이터가 확실히
씌워지게 했습니다.

이제 라즈베리 파이의 HDMI 단자에 모니터를 연결하고 micro USB 포트에 스마트폰
충전하듯이 USB 를 연결해 전원을 인가해주면 라즈베리 파이가 라즈비안으로
부팅됩니다.
