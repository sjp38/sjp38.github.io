+++
bigimg = ""
title = "Updating Google Chrome on Fedora 23"
subtitle = ""
date = "2017-03-20T22:24:26+09:00"
tags = ["tip", "fedora", "linux", "google", "chrome"]
categories = ["tip"]

+++

I am using Fedora 23 laptop and installed stable version Google Chrome from its
official website [0].  In this case, just using `Updates` of Fedora `Software`
program doesn't update Chrome automatically.  For the case, follow below
commands to update your Chrome:

```
$ sudo dnf update google-chrome-stable
...
$ sudo killall chrome
$ google-chrome-stable
```

The second `killall` command is necessary because Chrome doesn't kill its
process by just cliking `Close` button.  Or, you may reboot your computer but
you wouldn't like that.


[0] https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=CKiMjdqX5dICFYcGKgodqZIM2Q
