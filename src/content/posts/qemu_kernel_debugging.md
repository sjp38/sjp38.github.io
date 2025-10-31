+++
title = "Linux Kernel Debugging Using QEMU"
date = 2018-05-07T18:21:01+09:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = [
	"linux",
	"kernel",
	"tip",
	"linux-kernel-hack",
	]
categories = ["linux-kernel-hack"]

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

You can use classical debugger for your Linux kernel programming, though
Torvalds doesn't like it.
I also do not prefer such use of debuggers, but admit that sometimes debuggers
are quite useful. ;)

There are several ways to debug Linux kernel, but one of above is to set up a
Linux virtual machine using QEMU and debugging the Linux kernel of the virtual
machine from the host machine.
This post summarises how to debug the Linux kernel in this way.


Test Environment
================

The versions and names of the software I used for test of this post are as
below.

- Ubuntu 16.04.3 Server
- gdb 7.11.1
- QEMU v2.11.0-dirty
- Linux v4.16


Kernel Build
============

First, build the kernel you want to debug.  You should turn
`CONFIG_GDB_SCRIPTS` on, turn `CONFIG_DEBUG_INFO_REDUCED` off, and turn
`CONFIG_FRAME_POINTER` on if your target architecture supports it.


Boot The Virtual Machine
========================

If your kernel is ready, boot a QEMU vertual machine with it.
You could do it in several ways.
For example, you could install the kernel on the virtual machine disk.  Or, you
could use `-kernel`, `-append` and `-initrd` QEMU option to boot the virtual
machine with your kernel image in host machine directly, or some other ways.
One thing you should keep in your mind is that you should turn __kaslr__ off.
Just giving `nokaslr` in the kernel parameter doesn't works well.

Pass `-s` option to QEMU when you start up the QEMU virtual machine, or enter
`gdbserver` in the QEMU monitor console command line.
This make the virtual machine to start gdbserver and wait on `tcp::1234` for
some accesses.
If you have given `-nographic` QEMU option and set the kernel parameter so that
the virtual machine's console is connected to your terminal, you could not see
the QEMU monitor console directly.  In this case, you can go back to QEMU
monitor console by entering `Ctrl+a c`.
If you want to go back to the virtual machine's console again, `Ctrl+a c
<enter>`.


Start gdb
=========

Move to the build directory of the kernel to debug, enter `gdb vmlinux`.
This will start up gdb using the symbol and debuggin information of the kernel.
Ubuntu or some distributions might fail to read `vmlinux-gdb.py`.  The error
message also show you how you can fix it, but in summary, you should append
below one line at the end of the `.gdbinit` file and start the gdb again with
the above command:

```
add-auto-load-state-path /path/to/linux-build
```

Now, connect to the QEMU virtual machine by entering below command from the gdb
session:

```
(gdb) target remote :1234
Remote debugging using :1234
0xffffffff818cce92 in native_safe_halt () at /home/sjpark/linux/arch/x86/include/asm/irqflags.h:54
54              asm volatile("sti; hlt": : :"memory");
```

Just after you entering this command, QEMU virtual machine will be frozen.
From now, you can see the variables of the kernel, set the breakpoint, execute
the code step by step, as you normally did with gdb and user space programs.
For example, you can set breakpoint to specific function as below:

```
(gdb) b cma_alloc
Breakpoint 1 at 0xffffffff81240f10: file /home/hacklog/linux/mm/cma.c, line 399.
```

If you want your virtual machine to run again, you can enter `c`.
This will resume the execution of the kernel.
If you set a breakpoint as described above and if the code is be executed, the
execution will be started on the breakpoint.

```
(gdb) c
Continuing.
```

If you want the kernel to stop again, enter `Ctrl+C` in the gdb.

```
^C
Thread 1 received signal SIGINT, Interrupt.
0xffffffff818cce92 in native_safe_halt () at /home/sjpark/linux/arch/x86/include/asm/irqflags.h:54
54              asm volatile("sti; hlt": : :"memory");
(gdb)
```


Use Linux gdb helper
====================

Actually, you can normally use gdb even though it failed to load
`vmlinux-gdb.py`.
The python script contains some helper scripts for more convenient kernel
debugging on the gdb.
You can do kernel debugging a little bit more conveniently if you use it.


List of the helper scripts
--------------------------

The helper scripts have `lx` prefix.  You can list up their names and brief
descriptions as below:

```
(gdb) apropos lx
function lx_current -- Return current task
function lx_module -- Find module by name and return the module variable
function lx_per_cpu -- Return per-cpu variable
function lx_task_by_pid -- Find Linux task by PID and return the task_struct variable
function lx_thread_info -- Calculate Linux thread_info from task variable
function lx_thread_info_by_pid -- Calculate Linux thread_info from task variable found by pid
lx-cmdline --  Report the Linux Commandline used in the current kernel
lx-cpus -- List CPU status arrays
lx-dmesg -- Print Linux kernel log buffer
lx-fdtdump -- Output Flattened Device Tree header and dump FDT blob to the filename
lx-iomem -- Identify the IO memory resource locations defined by the kernel
lx-ioports -- Identify the IO port resource locations defined by the kernel
lx-list-check -- Verify a list consistency
lx-lsmod -- List currently loaded modules
lx-mounts -- Report the VFS mounts of the current process namespace
lx-ps -- Dump Linux tasks
lx-symbols -- (Re-)load symbols of Linux kernel and currently loaded modules
lx-version --  Report the Linux Version of the current kernel
```


So easy, huh? ;)


References
==========

1. [The Kernel Official Document for the Kernel Debugging](https://www.kernel.org/doc/html/v4.11/dev-tools/gdb-kernel-debugging.html)
2. [A blog article](http://www.alexlambert.com/2017/12/18/kernel-debugging-for-newbies.html)
3. [The gdbserver official document](https://sourceware.org/gdb/onlinedocs/gdb/Server.html)
