+++
bigimg = ""
title = "Updating Google Chrome on Fedora 23"
subtitle = ""
date = "2017-03-20T22:24:26+09:00"
tags = ["tip", "fedora", "linux", "google", "chrome"]
categories = ["tip"]

+++

랩톱에 Fedora 23 을 깔고 크롬을 공식 홈페이지 [0] 에서 다운받아 메인 브라우저로
사용하고 있습니다.  그런데 이렇게 설치한 경우에는 단순히 Fedora `Software`
프로그램의 `Updates` 기능을 통해 업데이트가 되지 않더군요.  이런 경우에는
다음의 커맨드를 통해 직접 업데이트를 할 수 있습니다:
```
$ sudo dnf update google-chrome-stable
...
$ sudo killall chrome
$ google-chrome-stable
```

두번째의 `killall` 커맨드는 Chrome 프로세스들이 `닫기` 버튼을 누르는 것만으로는
모두 종료되지 않기 때문에 명시적으로 종료시키기 위해 필요합니다.  컴퓨터를 아예
리붓 하는 방법도 있겠지만 별로 그러고 싶지는 않을테지요.  이후에 크롬을 다시
시작하면 업데이트된 버전으로 시작됩니다.



[0] https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=CKiMjdqX5dICFYcGKgodqZIM2Q
