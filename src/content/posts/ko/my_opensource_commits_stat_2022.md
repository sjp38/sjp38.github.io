---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2022년 오픈소스 커밋 통계"
subtitle: ""
summary: ""
authors: []
tags: ["linux", "kernel", "open source", "commits", "github", "statistics"]
categories: ["statistics"]
date: Sat Dec 31 13:48:12 PST 2022
lastmod: Sat Dec 31 13:48:12 PST 2022
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

2022년 마지막 날을 맞아, 저의 간단하고 버그가 많은 스크립트와[1] github 을 통해
저의 오픈소스 커밋 통계를 내봤습니다.

리눅스 커널 통계
----------------

리눅스 커널의 메모리 관리 서브시스템과 커널 전체의 2022년 통계를 위해 제 버그
많은 스크립트를[1] 아래와 같이 돌려 봤습니다.

![script outputs](/img/2022_open_source_commits_stat/linux_kernel_authors.png)


### 메모리 관리 서브시스템

2022년 한해, 305명의 사람들이 리눅스 커널 메모리 관리 서브시스템 개발에 참여해
81,631 라인의 변경을 2,135 개 커밋으로 만들었습니다.

변경한 라인 수와 커밋 갯수 기준으로 저는 그 305명 가운데 두번째와 (10,537
라인) 세번째로 (106 커밋) 큰 변경을 만들었군요.

### 리눅스 커널 전체

2022년 한해, 5,286명의 사람들이 리눅스 커널 개발에 참여해 6,841,739 라인의
변경을 77,636 개 커밋으로 만들었습니다.

변경한 라인 수와 커밋 갯수 기준으로 저는 그 5,286명 가운데 85번째와 (11,907
라인) 89번째로 (155 커밋) 큰 변경을 만들었군요.

Github
------

Github 에서 저는 2022년 한해동안 2,316 개 커밋을 만들었습니다.  이건 제 github
메인 계정의 이메일 주소로 만들어진 커밋만 세기 때문에 리눅스 커널을 포함한 일부
프로젝트로의 제 커밋은 포함 안된 수치이긴 합니다.  2022년은 사흘 빼고는 매일
커밋을 만들었군요.

![github contributions in 3d](/img/2022_open_source_commits_stat/github_sj38_park_3d.png)
![github contributions in 2d](/img/2022_open_source_commits_stat/github_sj38_park_2d.png)

아무래도 2022년은 제게도 세계에게도 바쁜 해였던 것 같습니다.  저도 커뮤니티도
2023년에도 즐거운 해킹을 이어갈 수 있길 바랍니다.

[1] https://github.com/sjp38/lazybox/blob/master/git_helpers/authors.py
