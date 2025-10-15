---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Shallow Thought: Simple and safe thoughts management"
subtitle: ""
summary: ""
authors: []
tags: ["projects", "shallow thought"]
categories: ["projects"]
date: 2020-10-03T10:40:28+02:00
lastmod: 2020-10-03T10:40:28+02:00
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

다양한 형태로 생각을 기록하고 가끔은 공유도 해왔습니다.  그 생각들을 오래도록
안전히 보관하고 싶었지만 몇차례 시행착오를 거치며 그게 쉽지 않음을
깨달았습니다.

시작은 일기장과 노트였습니다.  분실하기도 쉽고 구석에 쳐박아 두면 다시 볼일도
거의 없더군요.

클라우드 문서 서비스가 매력적이어 보였습니다.  하지만 영원한 건 없고 결국 그때
그때 흥하는, 또는 사용 가능한 서비스를 옮겨다녀야 하더군요.  그러다보니
서비스마다의 호환성이 문제가 됩니다.

https://yargerdotblog.files.wordpress.com/2019/02/cloudmeme.jpg

Hugo 와 같은 README 등 표준적 포맷의 plain text 기반 static site generator 를
사용하고 Git 으로 원격 repo 도 관리하는 게 괜찮은 방법 같아 보였습니다.  지금
이 블로그도 이 방법으로 관리하고 있습니다.  하지만 다른 테마로 이동할 때마다
생각보다 만질 부분이 꽤 있더군요.  또한 혼자 간직하고 싶은, 또는 잠깐 떠오르는
짧은 생각들을 간단하게 기록하기엔 생각보다 번거로웠습니다.

결국 나만의 규칙 아래 plain text 로 파일에 생각을 적어 git 으로 관리하게
되었습니다.  가장 낫긴 한데 여러 기계를 사용하면 동기화 하는걸 가끔 잊어버려
곤란한 상황에 직면하곤 했습니다.  나만의 규칙이라 해봤자 날짜를 기록하는
정도인데 그 포맷도 그때그때 헷갈리구요.  생각마다 다른 파일에 적을지 달마다
다른 파일에 적을지도 고민이었습니다.   그때그때 git 커맨드를 추가로 작성해야
하는것도 정말 짧은 생각만 관리하기엔 부담으로 느껴지더군요.  특히 핸드폰에서는
파일 수정하고 git 을 사용하기가 쉽지 않으니 사실상 다른 앱에 생각을 적어두고
나중에 컴퓨터 앞에서 git 으로 옮겨 관리하는데 그것도 별로였습니다.

결국 제가 원하는 건 트위터 수준으로 간단히 짧은 생각들을 작성하는 인터페이스와
third party 의존성 없는 안전한 관리였습니다.

그래서 [간단한 도구](https://github.com/sjp38/shallow_thought)를 만들었습니다.
날짜와 같은 주요 메타데이터를 Git 으로 안전히 관리하며, 모든 생각을 그때 그때
원격 저장소로 동기화 합니다.  핸드폰에서 tmux 등으로 사용하기 충분할 정도로
간단한 커맨드 라인 인터페이스를 제공합니다.  예를 들면:

```
$ st new "Thanks for all the fish"
$ st show
Sat Oct 3 11:21:14 2020 +0200

Thanks for all the fish
```

아주 간단한 포맷의 plain text file 로의 export / import 기능을 제공하므로
복잡한 히스토리 관리는 물론 다른 포맷으로의, 으로부터의 변환 역시 간단합니다.
예전에 매뉴얼하게 Git 으로 관리하던 기록들을 최근에 이 기능을 이용해 import
했는데 드디어 하나의 통합된 제 생각 관리가 가능할 것으로 기대합니다.

무엇보다, 아날로그 때의, 마음가는대로 아무 페이지나 펴서 무작위로 글을 읽으며
추억에 빠지는 경험을 되살리고 싶었는데, 됩니다.

```
$ st show --random
Wed Mar 8 22:30:00 1978 +0000

The first episode of "The Hitchhiker's Guide to the Galaxy" will now broadcast.
```

아직 다듬을 부분이 많고 추가할 기능도 많지만 일단 제 개인 목적으로 쓰기
시작한지는 제법 되었고 이제는 남들도 사용은 해볼 수 있을 것 같아 이렇게 소개해
봅니다.
