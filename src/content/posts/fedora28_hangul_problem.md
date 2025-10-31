+++
title = "Fedora28 ibus-hangul input problem"
date = 2019-04-26T11:05:59+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["fedora", "hangul", "ime"]
categories = ["tips"]

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

어느날부터 Fedora 터미널에서 한글 입력이 매우 불편해졌습니다.  한글 모드에서는
backspace, enter, esc 등의 특수키가 하나도 안먹힙니다.  Vim 을 쓰는 입장에선
매우 불편하죠.  알고보니 ibus-hangul 버그인 것 같습니다[1].  아래 커맨드로
ibus-hangul 을 문제 없던 버전으로 다운그레이드 시키고 세션을 재시작 하면 문제가
사라집니다.

```
sudo dnf downgrade ibus-hangul-1.5.0-12.fc28.x86_64
```


[1] http://www.fedoralinux.or.kr/board-read.do?boardId=bbs3&boardNo=153170459823549&command=READ&page=1&categoryId=-1
