+++
title = "LKML News after v4.19-rc4"
date = 2018-09-17T08:03:05+09:00
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

Linux 4.19-rc4 released, an apology, and a maintainership note
--------------------------------------------------------------

https://lkml.kernel.org/r/CA+55aFy+Hv9O5citAawS+mVZO+ywCKd9NQ2wxUmGsz9ZJzqgJQ@mail.gmail.com

한국시간 새벽 네시 좀 넘어 이 메일을 받았습니다.  평범한 릴리즈 메일이겠거니
했는데 제목이 뭔가 심상치 않군요.

일단 4.19를 위한 네번째 release candidate 릴리즈가 되었습니다.  약 3주 후 정식 4.19 버전이 릴리즈 되겠군요.  하지만 이 메일은 그보다 많은 내용을 담고 있습니다.

자유분방하고 형식에 구애되지 않는 해커 문화에 기원을 두고 있는 리눅스
커뮤니티는 조금 거친 언어 문화로 유명했습니다.  예를 들어 이상한 코드를 보내면
리누스 토발즈와 커뮤니티의 일부 사람들이 이 코드를 꾸짖을 수 있는데 그 과정에서
욕설도 있을 수 있다는 거죠.  어느새 5년이 넘게 흐른 사건이지만 토발즈는
공식석상에서 Nvidia 에 가운데 손가락을 펴서 보여주기도 했죠.  이로 인해 마음에
상처를 받았다는 사람도 꽤 되고, 7년간 리눅스에 패치를 올렸던 Sarah Sharp 라는
인텔의 프로그래머는 이를 이유로 들어 결국 리눅스 커뮤니티에서 빠지기로 해서[1]
한때 많은 논란이 있기도 했습니다.  당시 토발즈는 욕설을 멈출 생각이 없다고
강경하게 맞서기도 했죠[2].

그랬던 토발즈가 생각이 바뀌었다고 합니다.  올해 커널 메인테이너 서밋은 Linux
Plumbers Conference 와 함께 열릴 예정이었는데 토발즈가 그걸 깜박하고 가족
휴가를 잡는 바람에 토론이 있었고, 이 토론 과정에서 토발즈는 자신의 행위가 커널
개발에 정말로 악영향을 끼치고 있다고 느낀 것 같습니다.  이로 인해 토발즈는 이
메일을 통해 자신의 행위가 잘못되었음을 인정하고 그로 인해 상처 받은 사람들에게
공식적으로 사과를 하고 있습니다.  또한 앞으로 그런 행위를 반복하지 않기 위해
커널 개발에서 잠시 손을 떼고 거울 속의 자신을 바라보며 더 낫게 행동할 수 있도록
하는 시간을 갖겠다고 하는군요.

리누스 토발즈가 커널 개발에서 손을 떼는건 과거 git 개발을 위해 손을 뗐던
사건[3] 후 처음입니다.  이 사이의 릴리즈 작업은 Greg Kroah-Hartman 에게
부탁했다고 하니 곧바로 전체 개발 작업이 멈추진 않겠습니다.

이 휴식 시간이 아주 길지는 않을 거고, 토발즈 자신은 너무 지쳐 더이상 리눅스
커널 개발에 손을 데고 싶지 않다는 의도가 아니라고 합니다.  이건 얼마전 너무
지쳤다며 자비로운 종신 독재자 직을 그만둔 귀도 반 로썸의 예[4]와 비교되기도
하는군요, 토발즈도 이를 조금 의식한 거 아닐까 싶습니다.  토발즈는 자신은 여전히
리눅스 커널 개발을 하고 싶고, 잘하고 싶기 때문에 이 선택을 한 것 뿐이며, 어쩌면
단순히 욕설을 감지해 욕설이 포함된 메일은 자동으로 보내지 않는 메일
클라이언트를 개발하고 복귀하는 간단한 일이 될수도 있을 거라고 합니다.

개인적인 감상은, 글쎄요.  조금 반갑기도 하고 조금 아쉽기도 합니다.  커널
커뮤니티가 거칠고 모욕적인건 사실이지만 어느정도의 긴장감은 필요하다고
생각하기도 했고, 어떤 면에선 더욱 자유분방한 그 분위기를 저는 좋아했던 것도
같아서일 겁니다.  특히 AOSP 와 같이 악플은 커녕 무플이 심한 프로젝트에 참여했던
경험이 있는 저로썬 무플보단 악플이 낫다는 주의를 가졌던 것도 한 이유겠죠.
분명한 건 이 선언은 리눅스 커뮤니티의 외연 확장을 크게 도울 것 같습니다.  그게
마냥 좋기만 한 일일지, 윤리에 대한 자기검열이 커뮤니티의 토론 열기를 식히지는
않을지 걱정되기도 하지만요.  그리고, 이 선언의 최종 결과가 어떨지를 떠나,
그정도 위치에 있고 과거에 뱉어놓은 말들이 많은 리누스 토발즈가 이렇게 깔끔하게
사과를 하는 것도 대단한 멘탈이라 생각됩니다.


[1] http://sarah.thesharps.us/2013/07/15/no-more-verbal-abuse/  
[2] https://arstechnica.com/information-technology/2013/07/linus-torvalds-defends-his-right-to-shame-linux-kernel-developers/  
[3] https://sjp38.github.io/post/git_origin_story_ko/  
[4] https://www.i-programmer.info/news/216-python/11967-guido-van-rossum-quits-as-python-bdfl.html
