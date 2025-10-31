+++
title = "LKML News v5.3-rc8"
date = 2019-09-04T23:56:59+02:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "lkml", "news"]
categories = ["lkml news"]

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

[PATCH RFC 00/14] The new slab memory controller
------------------------------------------------

https://lkml.kernel.org/r/20190905214553.1643060-1-guro@fb.com

슬랩 할당자의 실제 메모리 활용률이 대부분 45-65 퍼센트에 불과했다고 합니다.
이는 슬랩 페이지가 각 메모리 cgroup 마다 배타적으로 사용되기 때문입니다.  적은
메모리만 사용하는 cgroup 여러개가 존재하면 슬랩에서 크게 받아놓은 메모리에서
조금씩만 실제 사용되니까 전체 활용률은 낮게 되는거죠.  이 RFC 패치셋은 서로
다른 cgroup 들이 슬랩 페이지를 공유할 수 있게 함으로써 이 문제를 해결합니다.


Linux 5.3-rc8
-------------

https://lkml.kernel.org/r/CAHk-=whBQ+6c-h+htiv6pp8ndtv97+45AH9WvdZougDRM6M4VQ@mail.gmail.com

평소대로라면 5.3 정식 릴리즈가 되었을테고 별다른 문제는 없었지만, rc7
릴리즈에서 이야기된대로 LPC 와 커널 서밋도 있고 한 이유로, -rc8 이 릴리즈
되었습니다.
그렇다보니 특기할 만한 사항은 없습니다만, 정식 릴리즈를 늦춘 덕에 stable 트리로
넘어갈 뻔한 수정사항 몇가지를 이번 릴리즈 내에 넣을 수 있게 되었다는군요.
