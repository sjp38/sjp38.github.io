---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Git 을 사용해 이메일 보내기"
subtitle: ""
summary: ""
authors: []
tags: ["git", "git-email", "patch", "submission"]
categories: ["git"]
date: 2019-12-28T09:58:49+01:00
lastmod: 2019-12-28T09:58:49+01:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

많은 개발 커뮤니티가 요즘은 Github 을 사용합니다만, 일부 커뮤니티는 여전히
메일링 리스트 기반 개발 스타일을 고수하고 있습니다.
리눅스 커널 커뮤니티가 좋은 예가 되겠죠.
이런 스타일에서는 모든 주요 커뮤니케이션이 이메일을 통해 이루어집니다.
패치는 메인테이너와 하나 이상의 공개 메일링 리스트를 향해 메일의 형태로
보내어집니다.
리뷰 또한 이에 대한 답장의 형태로 이루어지지요.

그런데, 일부 이메일 클라이언트는 ``rich user experience'' 라는 명목하에 원래
내용을 오염시키곤 합니다.
탭을 스페이스로 바꾸거나 html 코드를 집어넣거나 하는 식이죠.
때문에 패치를 보내는 사람은 자신의 메일 내용이 원래 의도한대로 읽는 사람에게
보내지도록 조심해야합니다.
이건 짜증나거니와 일부 메일 클라이언트에서는 불가능하기까지 합니다.

이런 이유로, git 은 패치를 만들고 SMTP 를 통해 이메일로 보내는 걸 돕는 기능을
갖고 있습니다.
이 포스트는 git 을 이용해 이메일을 어떻게 보낼 수 있는지 간략히 정리해 봅니다.


필요 패키지 설치
===============

여러분이 패키지 매니저를 이용해 git 을 설치했다면, `git` 패키지 외에도
`git-email` 패키지를 설치해야 합니다.  `apt` 패키지 매니저를 사용하신다면, 아래
커맨드를 입력해 주세요:
``$ sudo apt install git-email`` on the terminal.


SMTP 설정
========

이제, 여러분의 smtp 서버 관련 설정을 할 차례입니다.  물론, 여러분의 메일 계정의
smtp 설정을 먼저 활성화 해둬야 합니다.  이게 되었다면 git 에게 여러분의 메일
계정을 smtp 를 통해 사용하기 위한 정보를 입력해야겠죠.  `git config` 를
사용하는데요, 예를 들어 Gmail 계정을 사용하고자 하신다면, 아래와 같습니다:

```
$ git config --global sendemail.smtpserver smtp.gmail.com
$ git config --global sendemail.smtpserverport 587
$ git config --global sendemail.smtpencryption tls
$ git config --global sendemail.smtpuser <your-gmail-account@gmail.com>
```

해당 메일 계정의 패스워드도 아래와 같이 저장해 둘 수 있습니다만, 이런 방법은
보안에 위험할 수 있으니 추천하진 않습니다.

```
$ git config --global sendemail.smtppass <your_password>
```


메일 보내기
==========

메일을 보내긴 매우 간단합니다.
먼저 여러분이 보내고자 하는 메일 내용을 파일에 저장하세요.
`git format-patch` 를 통해 만든 패치 파일이 될 수도 있겠습니다.
그러고 나서, 누구에게 메일을 보낼 건지를 확실해 기억해 두시구요.
이제, 아래 커맨드를 입력합니다.

```
$ git send-email --to <수신인들> <the file containing your message>
```

앞서 메일 계정 패스워드를 저장해 주지 않았다면 (다시 말하지만 저장하지 말 것을
추천합니다), 이 커멘드는 메일 계정 패스워드를 물어볼 겁니다.
이제, 해당 메일이 여러분이 지정한 수신인에게 전달될 겁니다.

더 자세한 정보를 위해선, `$ git help send-email` 커맨드를 사용하세요.


결론
====

어떻게 Git 을 이용해 이메일을 보낼 수 있는지 정리해 보았습니다.  패키지를
설치하고, SMTP 설정하고, 보내고자 하는 메세지를 파일에 저장 후, `git
send-email`.  그게 답니다. :)
