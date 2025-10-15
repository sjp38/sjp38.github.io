+++
title = "Perf symbol problem on Linux 4.19"
date = 2018-12-21T17:00:22+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "perf"]
categories = ["linux kernel"]

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

4.19 커널에서 오랫만에 perf 를 다시 빌드하고 써보려고 하니, `perf report` 가
아래와 같이 제대로 된 symbol name 을 찾질 못합니다.

```
$ sudo perf record -g ls
arch                     builtin-ftrace.c    builtin-report.c     Documentation       perf.data.old
bench                    builtin.h           builtin-sched.c      examples            perf.h
Build                    builtin-help.c      builtin-script.c     include             perf-read-vdso.c
builtin-annotate.c       builtin-inject.c    builtin-stat.c       jvmti               perf-sys.h
builtin-bench.c          builtin-kallsyms.c  builtin-timechart.c  Makefile            perf-with-kcore.sh
builtin-buildid-cache.c  builtin-kmem.c      builtin-top.c        Makefile.config     pmu-events
builtin-buildid-list.c   builtin-kvm.c       builtin-trace.c      Makefile.perf       python
builtin-c2c.c            builtin-list.c      builtin-version.c    MANIFEST            scripts
builtin-config.c         builtin-lock.c      check-headers.sh     perf-archive.sh     tests
builtin-data.c           builtin-mem.c       command-list.txt     perf.c              trace
builtin-diff.c           builtin-probe.c     CREDITS              perf-completion.sh  ui
builtin-evlist.c         builtin-record.c    design.txt           perf.data           util
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.025 MB perf.data (21 samples) ]
sjpark@hydra:~/linux/tools/perf$ sudo perf report --stdio
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 21  of event 'cycles:ppp'
# Event count (approx.): 2712237
#
# Children      Self  Command  Shared Object      Symbol
# ........  ........  .......  .................  .................................
#
    59.39%     0.00%  ls       [unknown]          [k] 0xffffffffa8a00088
            |
            ---0xffffffffa8a00088
               |
               |--51.91%--0xffffffffa8004185
               |          |
               |          |--17.13%--0xffffffffa8212c8b
               |          |          0xffffffffa8212afe
               |          |          0xffffffffa821274a
               |          |          0xffffffffa81bb3c5
```

왜이러지 하고 삽질하다가 알고보니 perf 쪽 최신 커밋인 edeb0c90df35 ("perf
tools: Stop fallbacking to kallsyms for vdso symbols lookup") 이 만든 버그군요.
해당 커밋만 revert 하고 perf 를 다시 빌드하면 다시 잘 됩니다.

저만 겪는 문제는 아닌지 버그질라에도 이에 대한 이슈가 올라와 있네요:
https://bugzilla.kernel.org/show_bug.cgi?id=201551
