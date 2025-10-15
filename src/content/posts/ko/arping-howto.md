+++
subtitle = ""
date = "2017-03-07T19:41:16+09:00"
bigimg = ""
title = "Using arping to know ip-MAC mapping"
tags = ["tip", "linux", "network"]
categories = ["tip"]

+++

로컬 네트워크에서 어떤 IP 주소가 어떤 MAC 어드레스에 매핑되는지 알기 위해
`arping` 을 사용할 수 있습니다. 사용법은 간단합니다:
```
arping  [-AbDfhqUV]  [-c count] [-w deadline] [-s source] -I interface destination
```

예를 들면, 다음과 같습니다:
```
$ arping -I eth0 10.0.0.1
ARPING 10.0.0.1 from 10.0.0.2 eth0
Unicast reply from 10.0.0.1 [11:22:33:44:55:66]  0.123ms
Unicast reply from 10.0.0.1 [11:22:33:44:55:66]  0.251ms
...
```

이 툴의 동작 원리는 ARP 프로토콜 [1] 입니다.  IP 프로토콜 레이어는 이
프로토콜을 사용해 특정 IP 주소를 사용하는 기계의 MAC 어드레스를 파악하고 이
주소를 아랫단의 Ethernet 레이어에 보냅니다.  `arping` 은 단지 ARP REQUEST 를
로컬 네트워크의 컴퓨터들에게 보내는 일을 합니다.

인터넷 연결 문제가 발생했을 때, IP 중복이 의심된다면 유용하게 사용될 수
있습니다.

---

[1] http://www.erg.abdn.ac.uk/users/gorry/course/inet-pages/arp.html
