+++
title = "원격 데스크탑의 clipboard 를 ssh 와 xclip 으로 복사해오기"
subtitle = ""
date = "2017-03-31T13:53:54+09:00"
bigimg = ""
tags = ["tip", "xclip"]
categories = ["tip"]

+++

여러개의 리눅스 데스크탑 PC 를 한 책상 위에서 사용하는 경우가 있다.  이 때, 한
PC 에서 Ctrl-C 해서 clipboard 에 복사한 내용을 다른쪽 PC 에서 Ctrl-V 로
붙여넣고 싶은 경우가 있다.  여러가지 해결책이 있겠으나, 다음과 같이 ssh 와
xclip 을 사용해서 해결할 수도 있다:

```
$ ssh <username>@<remote host> 'DISPLAY=:0 xclip -o -selection clipboard' | \
	xclip -i -selection clipboard
```


참고: http://askubuntu.com/questions/513442/can-two-pcs-with-ubuntu-share-the-clipboard-buffer
