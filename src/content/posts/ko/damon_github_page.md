---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON 쇼케이스 웹사이트를 열었습니다"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "linux", "kernel", "mm", "record", "github page"]
categories: ["record"]
date: 2020-05-16T13:25:55+02:00
lastmod: 2020-05-16T13:25:55+02:00
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

DAMON 소개를 위한 웹사이트[1] 를 열었습니다.

- DAMON 공식 문서[2],
- 실제에 가까운 여러 워크로드의 힙[3], mmap() 된 영역[4], 그리고 스택[5] 에
  대한 히트맵 포맷의 동적 액세스 패턴들,
- 동적 워킹셋 사이즈의 분포[6] 와 시간대에 따른 워킹셋 사이즈의 변화양상[7],
  그리고
- 성능 테스트 결과[8]

를 확인해 보실 수 있습니다.

[1] https://damonitor.github.io  
[2] https://damonitor.github.io/doc/html/latest  
[3] https://damonitor.github.io/test/result/visual/latest/heatmap.0.html  
[4] https://damonitor.github.io/test/result/visual/latest/heatmap.1.html  
[5] https://damonitor.github.io/test/result/visual/latest/heatmap.2.html  
[6] https://damonitor.github.io/test/result/visual/latest/wss_sz.html  
[7] https://damonitor.github.io/test/result/visual/latest/wss_time.html  
[8] https://damonitor.github.io/test/result/perf/latest/html/index.html
