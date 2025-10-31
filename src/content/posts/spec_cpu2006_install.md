+++
title = "Install / execute spec cpu2006 benchmark"
subtitle = ""
date = "2017-03-29T05:10:55+09:00"
bigimg = ""
tags = ["spec", "benchmark", "spec_cpu", "spec_cpu2006"]
categories = ["tip"]

+++

SPEC, which is a standard corporation for the benchmark[1], makes and shares
various benchmark suites.  SPEC CPU 2006[1] is one of those benchmark suites.
It has made to measure performance of computation intensive workload and widely
being used now.  It has released v1.0 in 2006, 1.1 in 2008, and 1.2 in 2011.
This post briefly describes the way to install and execute the SPEC CPU 2006
v1.1 on Ubuntu 16.04 servers.


Automated Toolbox
=================

For those who might say `TL; DR`, I wrote a script that can install and execute
the SPEC CPU 2006 with one command[1].  If you have no time to read further,
just use it, please.

[1] https://github.com/sjp38/spec_on_ubuntu_xenial


Test Environment
================

The test machine I used for this post has:

- Intel Xeon E7-8870 v3
- Linux 4.10 kernel
- Ubuntu 16.04.1 Server version


Get The Source Code
===================

You should get the source code first.  You can buy SPEC CPU 2006 in DVD or
`.iso` file format (As of March 2017, the cost of the SPEC CPU 2006 v1.2 is
$800).
There are source code of the benchmarks, source code of tool programs that
helps compile, execution, and verification of the benchmarks, pre-compiled tool
programs, rule files for the execution of the benchmarks, and documents.
This post is written basedon SPEC CPU 2006 v1.1.
If you got the `.iso` file, you can access to the files in it by mounting it as
below:

```
$ mkdir tmnt
$ sudo mount -o loop SPEC_CPU2006v1.1.iso ./tmnt
$ ls tmnt
```

It is ok to directly install and execute the benchmarks, but I prefer to first
copy the files outside of the mounted dir.
The `owner` of the files is `root`, as the above command mounted the file via
the `sudo` command.
Change the owner to you as below:

```
$ mkdir SPEC_CPU2006v1.1
$ cp -R ./tmnt/* SPEC_CPU2006v1.1/
$ sudo umount ./tmnt && rm -fr ./tmnt
$ sudo chown -R <username> SPEC_CPU2006v1.1
$ sudo chmod -R 755 SPEC_CPU2006v1.1
$ cd SPEC_CPU2006v1.1
```


Build The Tools
===============

The `.iso` file has executable binaries for the tools, which is built for
various platforms such as redhat and suse.
But, there is no binary for Ubuntu.
Therefore, you should build the tools from the source code as below:

```
$ cd tools/src
$ ./buildtools
```

`buildtools` is a shell script which builds tools under `tools/src`.
But, you may encounter some errors.  Following sections describe the errors and
how you can solve it.


Conflicting types for 'getline'
-------------------------------

Build of `md5sum` will show you following error message:

```
gcc -DHAVE_CONFIG_H    -I/home/sjpark/SPEC_CPU2006v1.1/tools/output/include   -I. -Ilib  -c -o md5sum.o md5sum.c
In file included from md5sum.c:38:0:
lib/getline.h:31:1: error: conflicting types for 'getline'
 getline PARAMS ((char **_lineptr, size_t *_n, FILE *_stream));
 ^
```

Type conflict is occurred because `getline()` and `getdelim()` functions are
declared in `stdio.h`, but those are declared again in `getline.h` file.
You can fix this as below, by checking `GLIBC` version.

```
--- a/tools/src/specmd5sum/lib/getline.h
+++ b/tools/src/specmd5sum/lib/getline.h
@@ -27,10 +27,14 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
 #  endif
 # endif

+# if __GLIBC__ < 2
+
 int
 getline PARAMS ((char **_lineptr, size_t *_n, FILE *_stream));

 int
 getdelim PARAMS ((char **_lineptr, size_t *_n, int _delimiter, FILE *_stream));

+#endif
+
 #endif /* not GETLINE_H_ */
```


Undefined reference to `pow`
----------------------------

I referenced an internet post[3] to solve this and following two problems.

Now, you will see below error message while building `perl`.

```
cc -L/home/sjpark/SPEC_CPU2006v1.1/tools/output/lib -L/usr/local/lib -o miniperl \
            miniperlmain.o opmini.o libperl.a
libperl.a(pp.o): In function `Perl_pp_pow':
pp.c:(.text+0x2a76): undefined reference to `pow'
```

It failed to find `pow` functiona.  You should modify it to link `libm`
library.
You can solve this problem by setting `PERLFLAGS` env variable and executing
`buildtools` again:

``$ PERLFLAGS="-A libs=-lm -A libs=-ldl" ./buildtools``


You haven't done a "make depend" yet!
-------------------------------------

Now, you see below error message.

```
You haven't done a "make depend" yet!
make[1]: *** [hash.o] Error 1
```

The `bin/sh` which is used while building `perl` directs to `/bin/dash`.
This problem made by `dash`.
Simply modify the symbolic link so that it can use `bash` instead.

```
$ sudo rm /bin/sh
$ sudo ln -s /bin/bash /bin/sh
```

If you want it to revert this change, simply restore the symbolic link again.


`asm/page.h` file not found
---------------------------

`tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs` is including a kernel header file,
`asm/page.h`.

```
cc -c   -I/home/sjpark/SPEC_CPU2006v1.1/tools/output/include -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.04\" -DXS_VERSION=\"1.04\" -fpic "-I../../.."   SysV.c
SysV.xs:7:25: fatal error: asm/page.h: No such file or directory
```

Block the `include` statement in the `SysV.xs` file and define `PAGE_SIZE` as
below.

```
--- a/tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs
+++ b/tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs
@@ -4,7 +4,7 @@

 #include <sys/types.h>
 #ifdef __linux__
-#   include <asm/page.h>
+#define PAGE_SIZE      4096
 #endif
```


`perl` test fail
----------------

If you apply every solution above and run ``$ PERLFLAGS="-A libs=-lm -A
libs=-ldl" ./buildtools``, about 9 of 900 tests for the perl fails.
Because those tests are ignorable, just answer to ignore (Simply enter `y` as
the prompt explains).

```
Failed 9 test scripts out of 907, 99.01% okay.
### Since not all tests were successful, you may want to run some of
### them individually and examine any diagnostic messages they produce.
### See the INSTALL document's section on "make test".
### You have a good chance to get more information by running
###   ./perl harness
### in the 't' directory since most (>=80%) of the tests succeeded.
### You may have to set your dynamic library search path,
### LD_LIBRARY_PATH, to point to the build directory:
###   setenv LD_LIBRARY_PATH `pwd`:$LD_LIBRARY_PATH; cd t; ./perl harness
###   LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd t; ./perl harness
###   export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH; cd t; ./perl harness
### for csh-style shells, like tcsh; or for traditional/modern
### Bourne-style shells, like bash, ksh, and zsh, respectively.
u=0.92  s=0.69  cu=89.23  cs=5.47  scripts=907  tests=112394
make[2]: *** [_test_tty] Error 1
make[2]: Leaving directory `/home/sjpark/SPEC_CPU2006v1.1/tools/src/perl-5.8.8'
make[1]: *** [_test] Error 2
make[1]: Leaving directory `/home/sjpark/SPEC_CPU2006v1.1/tools/src/perl-5.8.8'
make: *** [test] Error 2
+ '[' 2 -ne 0 ']'
+ set +x


Hey!  Some of the Perl tests failed!  If you think this is okay, enter y now:
```


Build success
-------------

Finally, the build step completes.

```
Tools built successfully.  Go to the top of the tree and
source the shrc file.  Then you should be ready.
$
```


Execution
=========


Configuration File
------------------

Now you can execute the benchmarks.
For this, you should configure the execution environemnts of the benchmarks.
There are example configuration files under `config/` dir.  
`Example-linux64-amd64-gcc43.cfg` would be appropriate for the test system I
use for this post.
You can modify this file as you want.
In my test, I just copied the file to `config/config.cfg` file.


Environment Setup
-----------------

For execution of SPEC CPU benchmarks, you should set various environemnt
variables.  Below simple one command do that for you.

```
$ source ./shrc
```


Running Workload
----------------

`runspec` program is used for the execution of each benchmark.
This program is located under `bin/` dir of the SPEC CPU source code, but you
can use it directly without entering path, as the above envrionment variables
setting has registered it as `$PATH`.
For example, if you want to execute `mcf` benchmark, you can use below command:

```
$ runspec --iterations 1 --size ref --action onlyrun --config config.cfg --noreportable mcf
```

This command executes `mcf` benchmark and prints the path to the log file
describing the execution results.
```
...

Run Complete

The log for this run is in /home/username/spec/spec_src/result/CPU2006.003.log

runspec finished at Sun Sep 24 13:55:14 2017; 290 total seconds elapsed
```

To do some experiments for your particular use case, you should understand the
usage of `runspec`.
Because it is an out of scope of this post, reference to other documents,
please.


Conclusion
==========

This post described the way to run SPEC CPU 2006 on an Ubuntu 16.04 system.


References
----------

[0] http://spec.org/  
[1] http://spec.org/benchmarks.html#cpu  
[2] http://spec.org/order.html  
[3] https://wiki.linaro.org/MichaelHope/Sandbox/BuildingSPECTools
