+++
title = "Linux Development History Visualization Youtube Channel"
date = 2019-06-04T10:44:33+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "youtube", "development", "visualization"]
categories = ["projects"]

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

재미 삼아 리눅스 커널 릴리즈 때마다 git history 를 visualize 해서 올리는 유투브
채널[1]을 개설해 봤습니다. 지금은 visualization 에는 gource[2] 를 사용하고
있습니다. 이 비디오를 만드는데 사용되는 스크립트도 GPL v3 로 공개[3]했으니
필요한 분은 사용해 보셔도 좋을 것 같습니다.

[1] https://www.youtube.com/channel/UCI7qoGt1hOfCsI8hFqriYCg

[2] https://gource.io/

[3] https://github.com/sjp38/linux_development_visualization
