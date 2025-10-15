+++
title = "Alpine for LKML"
date = 2018-07-18T21:09:54+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

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

리눅스 커널 커뮤니티는 버그 레포팅, 패치 업로드, 리뷰, 릴리즈, 토론 등등 모든
활동은 이메일을 통해 이루어집니다.  이 포스트에서는 리누스 토발즈도 쓰는 이메일
클라이언트인 Alpine 을 gmail 과 연동하는 방법을 알아봅니다.

먼저 alpine 설치는 대부분 리눅스 배포판의 패키지 시스템에 등록되어 있으므로
해당 패키지 시스템을 사용해 쉽게 설치할 수 있습니다.  데비안 계열이면 `apt
install alpine`, 페도라 계열이면 `dnf install alpine` 이죠.


gmail imap 정보 입력
====================

S (Settings) -> L (collectionLists) -> A (Add Cltn)

Nickname: gmail or anything
Server: imap.gmail.com/ssl/user=sj@gmail.com

^X (Commit change)
E (Exit Setup)


SMTP 서버 설정
==============

S (Setup) -> C (config)

SMTP server: smtp.gmail.com/tls/user=sj@gmail.com


쓰레드 기반 소팅
----------------

`[Sort key]`: tHread (enter)


리눅스 커널 커뮤니티에서 요구하는 설정
--------------------------------------

`[Sending Preferences]`: Do Not Send Flowed Text, Strip Whitespace Before Sending


References
==========

https://harbhag.wordpress.com/2010/07/14/configure-alpine-to-sendreceive-emails-from-gmail/
