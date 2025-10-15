+++
bigimg = ""
date = "2017-09-13T13:46:00+09:00"
subtitle = ""
title = "Idle Page Tracking Tools"
categories = [
	"projects",
]
tags = [
	"projects",
	"idle_page_tracking",
]

+++

`idle_page_tracking`[1] is a simple, stupid toolbox for idle pages tracking.
It can be used to get real working set size of a process.


Tools
=====

This section describes two tools in the box though more tools exists.  You can
get more description about each tool from the README in the repository[1].


userprog
--------

`userprog` is a sample synthetic workload for test of other tools.  It
interactively allocates and access specified pages in the allocated pages.
After execution, it first asks how many pages to allocates.  Once you type in
how many pages to allocate, the program will repeatedly asks how many pages in
the allocated pages you want to do access.



wspages.sh
----------

Now you can calculate working set size of a process using the tools.  To
simplify the life even more, `wspages.sh` helps the complicated works.  It
requires pid, time interval, and target memory mapped regions as argument.  The
third argument can be ignored.  In the case, it uses heap, stack, and anonymous
pages as target memory region by default.  If you give the arguments well, this
tool will prints out number of pages accessed between the time interval.
Simple example of usage and output is as below:
```
$ sudo ./wspages.sh `pidof userprog` 1 [heap]
3
```


wspgstat.sh
-----------

Like `*stat` programs (such as vmstat, iostat, ...), wspgstat.sh monitors and
print out number of pages in working set of specific process repeatedly.  It
requires pid of target program, delay between idleness check, and target memory
mapped regions as arguments.  The third argument is optional and has default
value as same as wspages.sh's same argument.  Simple example usage is as below:
```
$ ./wspgstat.sh `pidof mysqld` 5
1 17448
9 21536
18 21659
```


Limitations
===========

The tools use idle page tracking feature of the Linux kernel[2] internally.  It
means that the tools work on Linux systems that idle page tracking feature is
turned on.  You can check whether your system turned on or off the feature by
simply running the command below:
```
$ if [ -d /sys/kernel/mm/page_idle ]; \
        then echo "ON"; else echo "OFF"; fi
```

It also shares limitation of idle page tracking feature of the Linux kernel.
It tracks only userspace pages on LRU list of the kernel.



License
=======

GPL v3


References
==========

[1] https://github.com/sjp38/idle_page_tracking  
[2] https://www.kernel.org/doc/Documentation/vm/idle_page_tracking.txt
