+++
title = "Unit test for the Linux kernel using Kunit"
date = 2019-03-20T15:32:29+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["linux", "kernel", "kunit", "test", "unit test"]
categories = ["kernel"]

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

Update (2020-01-01): KUnit has merged in v5.5 merge window.  From the writing
of this post, it had some changes, so below content, especially the test setup
and running will not work.  Recommend you to refer to the
[official document](https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html)
in the kernel for detailed tutorial.  It also has a python version dependency
now, so you would encounter a problem with Ubuntu 16.04.  Recommend you to use
later Python or Ubuntu 18.04 instead.

I have attended FAST'19 last February.  There was
[Ted Tso](https://thunk.org/tytso/).
I saw he hanging out with a few of Redhat people who I met during the lunch and
tagged along with them.
During the chat, we talked about test and Ted introduced us a testing framework
called KUnit.
I started using it after return from FAST'19 and felt it is amazing, so I would
like to introduce it in this post.

As its name intimates, KUnit is a unit test framework for the Linux kernel.
Google's Brendan Higgins is developing it and he is also sending
[RFC patches](https://lkml.org/lkml/2019/2/14/1144) to LKML so that it can be
merged into the mainline.
Because he is a Googler, he is hosting a [source
tree](https://kunit.googlesource.com/linux/) on a Google server and also made a
well written
[Documentation](https://google.github.io/kunit-docs/third_party/kernel/docs/).

This post will further briefly summarise how you can use KUnit.  I tested this
post on my Ubuntu 16.04 server.


Install
=======

You can receive Kunit development kernel from https://kunit.googlesource.com.
Clone it with below simple command.
I will use 5.0-rc5 based version which Brendan has recently sent the RFC
patches.

```
$ git clone -b kunit/rfc/5.0-rc5/v4 https://kunit.googlesource.com/linux
```

Of course, you can get only patches via
[Patchwork](https://lore.kernel.org/patchwork/project/lkml/list/?series=383391)
and apply it on your kernel.
I got it and applied it on my v5.0 kernel and it worked well.

Now you should install some packages for KUnit.
You need only the packages that required by kernel build.
For the list of the packages, refer to the
[post]({{< ref "linux-kernel-build.md" >}}) describing it.


Test
====

It's almost ready.  Let's run the example tests that kunit provides.

First, you should write a file named `kunitconfig` under the kernel tree root
directory.
This file specifies what tests you want to run.
Just write as below for now:

```
$ cd linux
$ echo CONFIG_KUNIT=y > kunitconfig
$ echo CONFIG_KUNIT_TEST=y >> kunitconfig
$ echo CONFIG_KUNIT_EXAMPLE_TEST=y >> kunitconfig
```

Now you can run the KUnit example tests as below:

```
$ ./tools/testing/kunit/kunit.py
```

You will see results below on your terminal:

```
[11:31:47] Building KUnit Kernel ...
[11:32:12] Starting KUnit Kernel ...
[11:32:12] ==============================
[11:32:13] [PASSED] kunit-resource-test:kunit_resource_test_init_resources
[11:32:13] [PASSED] kunit-resource-test:kunit_resource_test_alloc_resource
[11:32:13] [PASSED] kunit-resource-test:kunit_resource_test_free_resource
[11:32:13] [PASSED] kunit-resource-test:kunit_resource_test_cleanup_resources
[11:32:13] ==============================
[11:32:13] [PASSED] kunit-try-catch-test:kunit_test_try_catch_successful_try_no_catch
[11:32:13] [PASSED] kunit-try-catch-test:kunit_test_try_catch_unsuccessful_try_does_catch
[11:32:13] [PASSED] kunit-try-catch-test:kunit_test_generic_try_catch_successful_try_no_catch
[11:32:13] [PASSED] kunit-try-catch-test:kunit_test_generic_try_catch_unsuccessful_try_does_catch
[11:32:13] ==============================
[11:32:13] [PASSED] string-stream-test:string_stream_test_get_string
[11:32:13] [PASSED] string-stream-test:string_stream_test_add_and_clear
[11:32:13] ==============================
[11:32:13] [PASSED] example:example_simple_test
[11:32:13] ==============================
[11:32:13] Testing complete. 11 tests run. 0 failed. 0 crashed.
[11:32:13] Elapsed time: 26.005s total, 0.000s configuring, 25.736s building, 0.268s running.
```

It says example tests including `kunit-resource-test, kunit-try-catch-test,
string-stream-tets, example` has ran, and all of those passed.

KUnit should also build the kernel for the test, and the build takes a few of
time.
In this case, it took 26 seconds.
That said, this was long because it's first build.
It took about only 10 seconds for me when I modified only one file after.
Also, it takes very short time only for running actual test.
In this case, it took only 0.27 seconds!
Therefore, it will not take too huge time even though you have lots of tests.

Refer to the Kunit official
[document](https://google.github.io/kunit-docs/third_party/kernel/docs/start.html#writing-your-first-test)
to know how you can add your unit test.
Not so hard :)


Conclusion
==========

Introduced the unit test framework for the Linux kernel, KUnit.
I am also using it for my recent programming and could feel the advantage of
TDD again.
Hope this to be merged in the upstream soon!
