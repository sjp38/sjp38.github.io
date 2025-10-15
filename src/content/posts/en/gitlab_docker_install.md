+++
title = "Gitlab docker install"
date = 2019-03-19T16:39:48+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["gitlab", "docker", "installation"]
categories = ["installations"]

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

연구실 내부 사용을 위한 Gitlab 을 Docker 를 사용해서 구축하고 사용하고
있습니다만, 하도 예전이라 Gitlab official docker image 가 아니었고, docker
버전도 2.x 대라서 최신 버전으로 바로 업그레이드가 불가능하군요.

지금은 gitlab 에서 자체적으로 정식 docker 이미지를 제공합니다.
이 포스트에서는 Ubuntu 18.04 서버 위에 gitlab 정식 docker 이미지를 사용해
설치하는 방법을 기록합니다.


Docker 설치
===========

먼저 Docker 를 설치해야죠.  문서[1]를 참고해서 설치를 진행해 봅니다.

먼저 apt 업데이트 후 종속 패키지들을 깔아줍니다:
```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

이제 최신 docker 를 깔기 위해 docker repository 를 apt 에 추가해 주고요:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
```

설치합시다:
```
sudo apt install docker-ce
```

잘 깔렸는지 확인해 봅시다:
```
$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete 
Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0fe535
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

위와 같이 ``Hello from Docker!`` 가 나오면 된겁니다.

[1] https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04


Gitlab 설치
===========


일단 시작
---------

이제 Gitlab docker image 를 가져오고 돌려보죠.  Gitlab 쪽 문서[1]를 참고합니다.

```
$ cd $HOME; mkdir data
$ sudo docker run --detach --hostname gitlab.example.com \
		--publish 30443:443 --publish 30480:80 --publish 30422:22 \
		--name gitlab --restart always \
		--volume $HOME/data/srv/gitlab/config:/etc/gitlab \
		--volume $HOME/data/srv/gitlab/logs:/var/log/gitlab \
		--volume $HOME/data/srv/gitlab/data:/var/opt/gitlab \
		gitlab/gitlab-ce:11.8.2-ce.0
```

이 글 작성 시점 기준으로 가장 마지막 정식 릴리즈가 11.8 이므로 11.8.2 버전을
골랐고, 기존에 웹서버와 ssh 가 깔려있는 관계로 별도의 포트를 사용하게 했습니다.

조금 기다렸다가 http://gitlab.example.com:30480 으로 들어가면 로그인 됩니다.
``$ sudo docker ps -a`` 명령을 통해 만든 컨테이너의 status 가 `starting` 을
넘어갈 때까지만 기다리면 됩니다.
최초 로그인 시에는 관리자 패스워드를 바로 설정할 수 있습니다.
이후 root 계정에 지금 설정한 패스워드를 입력해 접속할 수 있습니다.


설정 변경
---------

몇가지 설정을 추가해야 합니다.  설정은 아래 명령으로 지금 띄운 컨테이너에
들어가 설정 파일을 수정하는 것으로 가능합니다:
```
$ sudo docker exec -it gitlab /bin/bash
# vi /etc/gitlab/gitlab.rb
```

`--volume` 으로 `$HOME/data/srv/gitlab/config` 아래로 파일이 링크되어 있으므로
여기서 수정해도 괜찮습니다.

해당 파일을 변경한 후에는 docker 를 재시작 해야 변경된 설정이 적용됩니다.
```
$ sudo docker restart gitlab
```


포트 변경 적용
--------------

호스트의 80 포트, 22 포트, 443 포트를 점유할 수 없는 상황이므로 우린 30480,
30422, 30443 포트를 대신 사용하도록 했습니다.
이 경우 추가적인 설정이 필요합니다.
`gitlab.rb` 파일에 아래 네줄을 추가합시다.
```
external_url 'http://gitlab.example.com:30480'
nginx['listen_port'] = 80
nginx['listen_https'] = false
gitlab_rails['gitlab_shell_ssh_port'] = 30422
```

두번째, 세번째 줄을 추가 안해주면 동작 안합니다[3].


gmail smtp 설정
---------------

이어서 smtp 설정을 해야 합니다.

우린 gmail smtp 를 사용하겠습니다.  이 설정 파일에 다음과 같은 내용을
추가합니다.  이 내용은 공식 문서의 예제[2]에서 가져왔습니다.

```
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "my.email@gmail.com"
gitlab_rails['smtp_password'] = "my-gmail-password"
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'peer' # Can be: 'none', 'peer', 'client_once', 'fail_if_no_peer_cert', see http://api.rubyonrails.org/classes/ActionMailer/Base.html
```

여기서 ``my.email`` 과 ``my-gmail-password`` 는 당연히 실제 gmail 계정으로
바꿔야겠죠?  해당 gmail 계정도 gmail 설정에서 smtp 를 사용할 수 있게 설정해
줘야 합니다.


가입 기능 제거
--------------

gitlab 첫페이지는 `sign in` 과 `register` 기능이 있습니다.  처음 사용하는
유저는 `register` 를 사용하면 되는거죠.

하지만 우린 폐쇄적으로 운영할 꺼라 계정을 관리자 통해서만 만들 수 있게 하고
싶습니다.  Admin area -> Settings -> General -> Sign-up restrictions 메뉴에서
Sign-up enabled 를 비활성화 시키고 변경사항 저장 버튼을 누릅니다.
이제 gitlab 첫페이지에 `register` 기능이 사라져 있을 겁니다.


[1] https://docs.gitlab.com/omnibus/docker/
[2] https://docs.gitlab.com/omnibus/settings/smtp.html
[3] https://gitlab.com/gitlab-org/omnibus-gitlab/issues/3535
