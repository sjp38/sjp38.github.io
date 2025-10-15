+++
title = "머신러닝 학습/실습 환경 (Jupyter Notebook & Google Colab)"
date = 2018-05-28T19:51:49+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["ML", "Machine Learning", "Jupyter Notebook", "Google Colab"]
categories = ["Machine Learning"]

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

이 글은 머신러닝 학습 환경으로도 널리 사용되는 Jupyter Notebook 과 Google Colab
에 대해 간단히 설명합니다.


Jupyter Notebook
================

Jupyter Notebook [1] 은 대화형으로 프로그래밍 언어를 공부하고 실습해 볼 수
있도록 만들어진 개발 / 학습 환경입니다.  이 환경은 크게 노트북 문서, Jupyter
Notebook App, Notebook kernel, 그리고 Notebook Dashboard 로 구성됩니다.


노트북 문서
-----------

노트북 문서는 프로그램 코드 조각들과 Rich text (이걸 한글로 뭐라 해야 할지...),
그리고 각 코드 조각의 수행 결과 로 구성됩니다.  백문이 불여일견, 이
[링크](https://colab.research.google.com/github/sjp38/jupyternb_hello/blob/master/jupyternb_hello.ipynb)
를 따라가 보시기 바랍니다.  링크는 간단한 파이썬 교육을 위해 만들어진 노트북
문서로,  코드를 수정하고 수행해 볼 수 있습니다.  텍스트도 수정할 수 있습니다.
문서에 코드 또는 텍스트 셀을 추가해 코드 셀에는 코드를, 텍스트 셀에는 텍스트를
작성할 수 있으며, 텍스트 셀에 작성할 수 있는 텍스트는 단순한 평문이 아니라
강조, 이탤릭 등의 효과를 포함할 수 있습니다.  Jupyter Notebook 환경은 노트북
문서들을 읽어들여 Rich Text 를 저자가 의도한 모습대로 렌더링 해주고, 코드 셀을
사용자가 원하면 셀별로 수행시켜줍니다.  코드 셀의 좌측에 수행 버튼이 떠서, 이를
클릭하면 해당 셀을 수행하는 형태입니다.  문서 상의 모든 코드 셀의 일괄 수행
역시 가능합니다.  이 때, 앞서 수행된 코드 셀의 수행 결과는 다음에 수행되는 코드
셀에 영향을 끼칩니다.  예를 들어 특정 셀에서 전역 변수의 값을 변경했다면 다음에
수행하는 셀에 변경된 전역 변수의 값이 보입니다.

이를 통해 Jupyter Notebook 사용자는 노트북 문서를 사용해 타인에게 학습시킬
문서를 작성하고 학습자가 곧바로 하나씩 수행해 볼 수 있게 해줄 수 있으며, 스스로
공부하는 사람도 자신이 공부한 내용을 쉽게 정리할 수 있게 해줍니다.


Jupyter Notebook App
--------------------

Jupyter Notebook App 은 Jupyter 노트북 문서를 읽어들여 작성자가 원한 모습으로
보여주고 코드의 수행 등을 대신해 주고, 또한 노트북 문서를 새로 작성할 수 있는
에디터 역할을 합니다.  서버-클라이언트 구조로 되어 있어 로컬 컴퓨터에 서버를
띄우고 웹브라우저로 접속해서 작업할 수도, 다른 컴퓨터에 띄워진 서버에
웹브라우저로 접속해 작업할 수도 있습니다.  일부 공개 Jupyter Notebook 서버도
서비스 되고 있습니다.  Google Colab 역시 그런 형태입니다.

Github 은 웹인터페이스 상에서 Notebook 문서를 렌더링 해 보여주는 기능을
제공하고 있습니다.


Notebook kernel 과 Notebook Dashboard
-------------------------------------

실제 코드의 수행을 담당하는게 Notebook kernel, 각 노트북 문서의 관리를 담당해
주는 인터페이스가 Dashboard 입니다.  커널은 프로그램이 언어별로 존재하며,
Jupyter Notebook 에서는 다양한 언어의 커널을 지원하고 있습니다.


Google Colab
============

Jupyter Notebook 은 앞서 설명했듯 자신의 컴퓨터에 설치하고 서버를 띄울수도,
다른 컴퓨터에 설치하고 서버를 띄울 수도 있습니다.  `...  as a Service` 의
시대인 만큼, Jupyter Notebook Server 를 서비스하는 회사들이 많습니다.  Google
Colab[2] 은 그런 서비스 중 하나입니다.  이 프로젝트는 머신러닝 교육과 연구를
돕기 위해 만들어진 Google 의 연구 프로젝트로, 결국은 하나의 Jupyter notebook
환경일 뿐인데, 어떠한 셋업도 필요 없고 구글 클라우드 위에서 동작합니다.

노트북 문서는 구글 드라이브에 저장하고 불러올 수 있으며, Github 에 있는 노트북
문서도 읽어올 수 있습니다.  참고로 노트북 문서는 `.ipynb` 라는 확장자를
사용하는 텍스트 파일입니다.  Colab 에서 작성한 노트북 문서를 `.ipynb` 확장자
파일로 곧바로 다운받을 수 있으므로 구글 드라이브로 공유하기 부담스러운 경우는
github 을 통해 공유해도 좋겠습니다.  뿐만 아니라 읽기만 하므로 다른 사람의
Jupyter Notebook 문서도 공개되어 있다면 얼마든지 불러올 수 있습니다.


Github 의 노트북 문서 불러오기
------------------------------

Github 의 노트북 파일을 불러오는 방법은 간단합니다.  먼저 Github 웹
인터페이스에 들어가 Google Colab 에서 읽고자 하는 문서의 github 상에서의 주소를
파악합니다.  대략
https://github.com/sjp38/jupyternb_hello/blob/master/jupyternb_hello.ipynb 와
같은 형태가 될겁니다.  여기서 `https://` 를 제거하고 `github.com` 에서 `./com`
을 제거한 후, https://colab.research.google.com/ 뒤에 붙여줍니다.  그러면 대략
https://colab.research.google.com/github/sjp38/jupyternb_hello/blob/master/jupyternb_hello.ipynb
같은 모습이 되겠죠.  이 주소를 웹브라우저에 입력하면, Colab 에 해당 노트북이
열리고 수행도 해볼 수 있습니다.


Summary
=======

머신러닝 학습에 많이 사용되는 Jupyter Notebook 과 머신러닝을 위한 Jupyter
Notebook 서비스 중 하나인 Google Colab 에 대해 알아봤습니다.  저도 최근에야
알게 된 프로젝트인데, 코드와 그에 대한 설명을 정말 쉽고 효과적으로 공유할 수
있는 획기적 방법 같습니다.  다른 분야에도 널리 퍼지면 좋겠군요.


[1] http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html  
[2] https://colab.research.google.com/notebooks/welcome.ipynb
