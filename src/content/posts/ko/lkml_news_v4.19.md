+++
title = "LKML News after v4.19"
date = 2018-10-22T17:45:08+09:00
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


Linux 4.19
----------

https://lkml.kernel.org/r/20181022073224.GA5658@kroah.com

드디어 9 주간의 안정화를 거쳐 4.19 버전이 릴리즈 되었습니다.  역시 토발즈가
쉬고 있는 관계로 Greg KroahHartman 이 릴리즈 했습니다.  지난 네번의 릴리즈
가운데 가장 큰 릴리즈군요.  그리고 이 버전은 "Long Tern" 커널 중 하나가 될
예정입니다.

이번 릴리즈 메일은 토발즈가 잠시 쉬겠다고 했던 메일을 연상케 할정도로 내용이
긴데요, 꽤 많은 부분은 이번 버전 개발 과정에서 이야기 되었던, 새로운 커뮤니티
참여자들과의 관계와 태도에 대한 내용입니다.  Greg 이 매년 발표하고 있는 커널
커뮤니티의 작업 방식 이야기를 예로 들며 설명하네요.  관련해서는 다음주 영국에서
열리는 Maintainers Summit 에서도 좀 더 이야기 할 생각인가 봅니다.

그리고, 릴리즈 메일의 말미에서 이렇게 이야기 하며 릴리즈 메일을 끝맺는군요:
```
And with that, Linus, I'm handing the kernel tree back to you.  You can
have the joy of dealing with the merge window :)
```

토발즈가 돌아오려나요?  아니면 새로운 대리인이?


Git pull ack emails..
---------------------

https://lkml.kernel.org/r/CAHk-=wjS6cjjP+fkZWzzrdZ_fZ1F=PrAGcBc57vKCpNyoD73Vw@mail.gmail.com

앞서 4.19 릴리즈와 함께 Greg 이 토발즈의 대리인을 그만두기로 했다고 했지만,
그에 대한 토발즈의 공식적 답변은 없었습니다.  때문에 토발즈가 돌아오는건지,
또는 Greg 이 아닌 또다른 사람이 릴리즈 관리를 할지 애매했는데, 토발즈가
돌아왔습니다.

이 메일을 이렇게 시작하는군요:

> So I've obviously started pulling stuff for the merge window,

마침 Maintainers Summit 이 있었으니, 거의 Summit 직후 돌아왔다고 볼 수 있을 것
같네요.

이 메일에선 이와 함께 Greg 이 pull request 마다 꼬박꼬박 응답을 보내줬던 걸
지속할지 말지에 대한 이야기를 하고 있습니다.  토발즈는 풀 리퀘스트를 받으면
일단 빌드 테스트를 진행하고, 그동안 다른 풀 리퀘스트를 보고 그 빌드 테스트도
병렬로 진행하는 파이프라인 형태의 작업 형태를 가지고 있는데, Greg 처럼 하나하나
순차적으로 응답하려면 좀 애매하기 때문입니다.  일단은 응답 보내보고, 그게 정말
중요한지 판단해 보겠다는군요.

아무튼, 잘 돌아왔어요, 리누스!
