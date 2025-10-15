+++
title = "Integrate external git repository with its history"
date = 2019-06-27T17:02:49+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["git", "tip", "version control"]
categories = ["tip"]

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

프로젝트 a 와 프로젝트 b 를 병렬로 진행하고 있었는데, 두개의 리포지토리를
합치고 싶어지는 경우가 있습니다.  예컨대 프로젝트 a 의 성격이 보다 범용이
되었고 프로젝트 b 는 프로젝트 a 를 위한 도구적 성격이 되는 경우가 있겠죠.
a 프로젝트에 'b' 디렉토리를 만들고 그 아래 기존 프로젝트 b 의 파일들을 위치하고
싶습니다.
하지만 기존 b 프로젝트의 git 히스토리들도 유지하고 싶습니다.
비슷한 사례로 리눅스 커널 메모리 모델 프로젝트는 별도의 리포지토리[1] 로
개발되었지만 리눅스 업스트림 리포지토리의 tools/ 디렉토리 아래로 머지[2]
되었는데, 이 때 기존 개발 히스토리를 유지했죠.

이 포스트는 이렇게 특정 git 리포지토리를 그 히스토리를 유지한 채 다른 git
리포지토리의 하위 디렉토리로 옮기는 법을 설명합니다.

[1] https://github.com/aparri/memory-model

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model


초기 상황과 목표
----------------

먼저 현재 디렉토리 아래에 a 리포지토리와 b 리포지토리가 있다고 가정합니다:
```
$ ls
a   b
$
```

우리는 a 리포지토리 아래 b/ 디렉토리를 만들고 그 아래 b 리포지토리를 넣고
싶습니다.


전략
----

b 리포지토리가 b/ 디렉토리 아래 모든 파일을 위치하도록 변경한 후, 이
리포지토리를 a 리포지토리에서 `--allow-unrelated-histories` 옵션을 사용해
머지하도록 하겠습니다.


합쳐질 리포지토리 파일 구조 변경
--------------------------------

먼저 b 리포지토리의 파일들이 b/ 디렉토리 아래 위치하도록 만듭니다:
```
$ cd b
$ mkdir b
$ git mv !(b) b
$ git commit -a -m "Relocate files for inclusion"
```


리포지토리 병합
---------------

이제 b 리포지토리를 임시 remote 리포지토리로 등록하고 머지합니다:
```
$ cd ../a
$ git remote add temp ../b
$ git fetch temp
$ git merge --allow-unrelated-histories temp/master
```

`--allow-unrelated-histories` 는 경로가 다른 파일에 대한 커밋들도 머지가 될 수
있게 해줍니다.

임시로 등록한 remote 리포지토리는 지워줍시다:
```
$ git remote rm temp
```


정리
----

이상과 같이 기존의 개발 히스토리를 유지하면서 특정 git 리포지토리를 다른 git
리포지토리의 하위 디렉토리로 병합하는 방법을 알아보았습니다.
