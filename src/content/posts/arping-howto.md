+++
subtitle = ""
date = "2017-03-07T19:41:16+09:00"
bigimg = ""
title = "Using arping to know ip-MAC mapping"
tags = ["tip", "linux", "network"]
categories = ["tip"]

+++

You can use `arping` to know IP address to MAC address mapping of your local
network.  Usage is simple:
```
arping  [-AbDfhqUV]  [-c count] [-w deadline] [-s source] -I interface destination
```

For example, you may use the command as below:
```
$ arping -I eth0 10.0.0.1
ARPING 10.0.0.1 from 10.0.0.2 eth0
Unicast reply from 10.0.0.1 [11:22:33:44:55:66]  0.123ms
Unicast reply from 10.0.0.1 [11:22:33:44:55:66]  0.251ms
...
```

Secret of the tool is ARP protocol [1].  To know the MAC address of the machine
that has a specific IP address, IP protocol layer uses the protocol.  MAC
address that found in this way can be used to communicate with Ethernet
protocol layer.  `arping` just sends the ARP REQUEST to local network
neighbour.

It could be useful in case of internet connection problem if IP duplication is
suspicious.


[1] http://www.erg.abdn.ac.uk/users/gorry/course/inet-pages/arp.html
