---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON 테스트 패키지가 GPL v2 로 릴리즈 되었습니다"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm"]
categories: []
date: 2020-09-26T08:47:12+02:00
lastmod: 2020-09-26T08:47:12+02:00
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

DAMON 은 kselftest 와 kunit 에 기반한 여러 테스트를 자신의 패치셋에 포함시켜
두고 있습니다.  커널 트리에 위치하는 테스트는 짧은 수행시간만 가지는게
바람직하므로, 시간을 오래 소요하는 테스트들을 패키지화 해서 저희 회사 내에서만
사용해 오고 있었습니다.  테스트는 좋은 문서로 사용될 수 있고 컨트리뷰터들에게도
필요하죠.  그런 이유로, 이 패키지를 오픈소스로 만들겠다고 지난 커널 서밋
발표에서 이야기 했었습니다
(https://linuxplumbersconf.org/event/7/contributions/659/).

어제, 이 [패키지](https://github.com/damonitor/damon-tests) 를 마침내 GPL v2
라이센스의 오픈소스로 릴리즈 했습니다.  이제 DAMON 인터페이스를 이해하고
여러분의 기계 위에서 스스로 DAMON 을 테스트 하는데 이 패키지를 사용하실 수
있습니다.
