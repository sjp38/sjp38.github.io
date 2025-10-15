---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "DAMON 을 이용한 프로파일링의 한 예"
subtitle: ""
summary: ""
authors: []
tags: ["damon", "profile", "callstack", "linux", "kernel", "example"]
categories: ["examples"]
date: 2021-02-25T07:20:30+01:00
lastmod: 2021-02-25T07:20:30+01:00
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

DAMON[0] 이 프로파일링만을 위한 건 아니지만, DAMON 을 프로파일링에 활용하는
방법에 대한 괜찮은 직관적 예를 여태 소개한 적이 없다는 걸 깨달았습니다.
간단하지만 현실적인 DAMON 의 프로파일링 도구로써의 사용법은 모니터링 결과를
콜스택과 함께 기록한 후 시간대에 맞춰 시각화 하는 것입니다.

예를 들어, 아래 그림은 SPLASH-2X 벤치마크의 'fft' 라는 워크로드에 대한 그런
시각화 결과입니다.  여기서, 우린 이 워크로드에 세개의 폭발적 메모리 액세스가
이루어지는 구간이 있는 것을 알 수 있으며, `FFT1DOnce.cons::prop.2()` 가 그
첫번째와 두번째 구간에, 그리고 `Transpose()` 는 세번째 구간에 연관되어 있음을
알 수 있습니다.  이제 프로그래머는 이 함수들을 깊게 들여다보고 코드를 최적화
(ex: `madvise()` 나 `mlock()` 을 호출하기) 할 수 있을 겁니다.

![dasmon_callstack_visualization](/img/damon_callstack.png)

우린 이 기법을 다양한 실제에 가까운 벤치마크 워크로드들의 `mlock()` 기반
최적화에 사용해 보았습니다.  그렇게 최적화 되 버전은 메모리 부족 상태에서 최대
2.5배까지의 성능 향상을 기록했습니다[1].

주의: 위의 'fft' 시각화에서 위쪽 두개의 그림 (시간에 따른 워킹셋 크기와 메모리
영역별 접근 빈도) 는 DAMON 유저 스페이스 툴[2] 을 이용해서 그렸고, 가장 아래의
그림 (시간에 따른 콜스택) 은 perf 와 speedscope[3] 을 이용해 그렸습니다.  아직
이걸 완전히 자동화 하는 도구는 없습니다만 (조만간 구현할 계획입니다, 아마도
perf 아래에 perf-script[4] 의 형태로요), 여러분도 아래의 커맨드를 이용해 직접
만들어 보실 수 있습니다.

    $ # run the workload
    $ sudo damo record $(pidof <the workload>) &
    $ sudo perf record -g --pid $(pidof <the workload>)
    $ # after your workload finished (you should also finish perf on your own)
    $ damo report wss --sortby time --plot wss.pdf
    $ damo report heats --heatmap freq.pdf
    $ sudo perf script | speedscope -
    $ # open wss.pdf and freq.pdf with our favorite pdf viewer

[0] https://damonitor.github.io  
[1] https://linuxplumbersconf.org/event/4/contributions/548/attachments/311/590/damon_ksummit19.pdf  
[2] https://lore.kernel.org/linux-mm/20201215115448.25633-8-sjpark@amazon.com/  
[3] https://www.speedscope.app/  
[4] https://lore.kernel.org/linux-mm/20210107120729.22328-1-sjpark@amazon.com/
