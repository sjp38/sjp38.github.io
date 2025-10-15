---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Sphynx document on Github pages Needs `.nojekyll` File"
subtitle: ""
summary: ""
authors: []
tags: ["tip", "github", "sphynx"]
categories: []
date: 2020-05-13T06:40:03+02:00
lastmod: 2020-05-13T06:40:03+02:00
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

최근, Sphynx 빌드 시스템[1] 을 사용해 html 로 빌드한 리눅스 커널 문서를 Github
page[2] 에 올리려 했습니다.  DAMON[3] 문서를 어디서나 볼 수 있게 하려
함이었는데요.  업로드는 쉬웠습니다.  리포지토리 만들고, Sphynx 로 빌드된
``Documentation/output/`` 의 문서를 여기에 집어넣고 푸시했죠.  하지만, 테마가
적용되지 않아 보기 안좋더군요.

Github 은 모든 Github page 들이 Jekyll[4] 에 기반하고 있다고 생각하며, Jekyll
에서는 `_` 로 시작하는 이름의 모든 파일과 디렉토리가 특수하게 처리되기 때문에,
Sphynx 에서 생성한 일부 디렉토리가 무시되고 있었습니다.

`.nojekyll` 이라는 이름의 파일을 리포지토리의 루트에 놓고 푸시해 줌으로써
Github page 가 여러분의 사이트가 Jekyll 로 만들어진 것이 아님을 알게 해줄 수
있습니다.  예를 들면 다음과 같습니다.

```
$ cd <your github page repo>
$ touch .nojekyll
$ git add .nojekyll; git commit -m "Add .nojekyll"; git push
```

이 파일은 다른 곳이 아닌 리포지토리의 루트에 위치해야함을 기억하세요.

이 수정 후, 제 문서[5] 역시 기대한 대로 동작합니다 :)

[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#sphinx-build  
[2] https://pages.github.com/  
[3] https://sjp38.github.io/post/damon/  
[4] https://jekyllrb.com/  
[5] https://damonitor.github.io/doc/html/latest/admin-guide/mm/data_access_monitor.html
