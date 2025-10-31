---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Build, Install, and Use QEMU on Ubuntu"
subtitle: ""
summary: ""
authors: []
tags: ["qemu", "kvm", "tips", "virtualization", "setup"]
categories: ["setup"]
date: 2019-12-12T00:46:05+01:00
lastmod: 2019-12-12T00:46:05+01:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

This post describes how you can build, install, and use QEMU on an Ubuntu
machine.
I basically refererenced http://wiki.qemu.org/Hosts/Linux.
The test has proceeded on an Ubuntu 18.04 server machine.


QEMU Build
==========

```
sudo apt install libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev \
		libgtk-3-dev
git clone git://git.qemu-project.org/qemu.git
cd qemu
git checkout v4.2.0
mkdir -p $HOME/qemu.sandbox/bin
cd $HOME/qemu.sandbox/bin
../../qemu/configure --enable-debug --enable-gtk
time make -j143
./x86_64-softmmu/qemu-system-x86_64 -L pc-bios
```


Guest OS Install
================

Get an Ubuntu server install image:
```
$ wget http://releases.ubuntu.com/18.04/ubuntu-18.04.3-live-server-amd64.iso
```

Make qcow2 format image file:
```
cd ..
$ ./bin/qemu-img create -f qcow2 qc2img 32G
Formatting 'qc2img', fmt=qcow2 size=34359738368 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
$ ls -alh
total 830M
drwxrwxr-x  3 sjpark sjpark 4.0K Jun  1 20:34 .
drwxr-xr-x 28 sjpark sjpark 4.0K Jun  1 20:15 ..
drwxrwxr-x 94 sjpark sjpark  12K Jun  1 20:19 bin
-rw-r--r--  1 sjpark sjpark 193K Jun  1 20:34 qc2img
-rw-rw-r--  1 sjpark sjpark 848M Feb 16 05:37 ubuntu-18.04.3-live-server-amd64.iso
```

And, boot QEMU VM with the install image:
```
$ sudo ./bin/x86_64-softmmu/qemu-system-x86_64 -m 8G -enable-kvm \
	-drive if=virtio,file=qc2img,cache=none \
	-cdrom ubuntu-18.04.3-live-server-amd64.iso
```

If your session is connected with X, above command opens QEMU GUI for the
booted VM.
The VM will be booted with the Ubuntu server install image, as same as when you
boot a machine with an install media.
As usual, proceed the install of the Ubuntu server on the VM.
This post will use ssh to connect to the VM.  Install openssh pacakge while the
install process.

Now, you can boot your Ubuntu VM as below:
```
$ sudo ./bin/x86_64-softmmu/qemu-system-x86_64 -m 20G -smp 32 -enable-kvm \
	-drive if=virtio,file=qc2img,cache=none \
	-net user,hostfwd=tcp::2242-:22 -net nic -nographic
```

Because of the `-nographic` option, it will not give you GUI interface but
shows `Booting from Hard Disk...` message only.  But, the VM is booted well.
You can ssh to the VM via the port, 2242.
```
$ ssh localhost -p 2242
```

Connect Console to Terminal
---------------------------

Let's connect the VM's console to the QEMU executing terminal.
Modify the `/etc/default/grub` file's `GRUB_CMDLINE_LINUX_DEFAULT` to have
`"console=ttyS0 earlyprintk=ttyS0 ftrace_dump_on_oops"`.

You may also want to show GRUB when boot.  Comment out
`GRUB_TIMEOUT_STYLE=hidden`, give none-zero value to `GRUB_TIMEOUT=`, and
Uncomment `GRUB_TERMINAL=console`.

Finally, commit the change by:
```
$ sudo update-grub
$ sudo shutdown -h now
```

After this, if you start the VM again using the QEMU command, the terminal you
executed the QEMU command will be connected with the console of the VM and will
show boot log and login prompt.


Return to VM Monitor Console
============================

If you want to go back to the VM monitor console, which you have seen before
connecting the QEMU executed terminal to the VM's console, press `Ctrl+a c`.
If you want to go back to the guest console again, press `Ctrl+a c enter`.

Reference:
https://serverfault.com/questions/471719/how-to-start-qemu-directly-in-the-console-not-in-curses-or-sdl


Boot with Kernel in Host
========================

You can boot the VM to use a kernel image in the file system of the host
machine.
If you want to keep your development environment on your host machine but use
the QEMU as a test target device, this is useful.
Give the path to the kernel image file via `-kernel` option and give the kernel
parameter you want to use using `-append` option.
For example:

```
$ sudo ../qemu/build/x86_64-softmmu/qemu-system-x86_64 -m 2048 -smp 2 \
	-enable-kvm -drive if=virtio,file=debian.img,cache=none \
	-net user,hostfwd=tcp::2242-:22 -net nic -nographic \
	-kernel /linux.out/arch/x86/boot/bzImage \
	-append “root=/dev/vda1 console=ttyS0 earlyprintk=ttyS0 debug ignore_loglevel ftrace_dump_on_oops”
```

For the `root=` in the kernel parameter, check which device file is mounted as
the rootfs by the guest OS and use it.

Also, you cannot use modules built on the host in the VM, unless you send the
module binary files into the VM.
If you don't want to do that, simply build the modules you need in static.  For
example, as this post uses the `ssh`, I statically built the ethernet driver.


Image Resize
============

The guest os disk might be full soon, if you configured it too small.
You can enlarge the qcow2 image's size as below:
```
$ qemu-img resize qc2img +160G
$ sudo apt install libguestfs-tools
$ cp qc2img qc2img.bak
$ sudo virt-resize --expand /dev/sda1 qc2img.bak qc2img
$ sudo virt-resize --expand /dev/sda1 qc2img.bak qc2img
[   0.0] Examining qc2img.bak
◓ 25% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒═════════════════════════════════════════════════════════════════════⟧ --:--
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
******

Summary of changes:

/dev/sda1: This partition will be resized from 24.0G to 184.0G.  The
filesystem ext4 on /dev/sda1 will be expanded using the 'resize2fs' method.

/dev/sda2: This partition will be left alone.

******
[  49.9] Setting up initial partition table on qc2img
[  56.7] Copying /dev/sda1
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
[ 594.9] Copying /dev/sda2
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
[ 767.4] Expanding /dev/sda1 using the 'resize2fs' method

Resize operation completed with no errors.  Before deleting the old disk,
carefully check that the resized disk boots and works correctly.
$
$
$ ./bin/qemu-img info qc2img
image: qc2img
file format: qcow2
virtual size: 192G (206158430208 bytes)
disk size: 32G
cluster_size: 65536
Format specific information:
    compat: 1.1
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
$ 
$
$ virt-filesystems --long -h --all -a qc2img
libguestfs: warning: current user is not a member of the KVM group (group ID 117). This user cannot access /dev/kvm, so libguestfs may run very slowly. It is recommended that you 'chmod 0666 /dev/kvm' or add the current user to the KVM group (you might need to log out and log in again).
Name       Type        VFS      Label  MBR  Size  Parent
/dev/sda1  filesystem  ext4     -      -    184G  -
/dev/sda2  filesystem  unknown  -      -    1.0K  -
/dev/sda5  filesystem  swap     -      -    8.0G  -
/dev/sda1  partition   -        -      83   184G  /dev/sda
/dev/sda2  partition   -        -      05   1.0K  /dev/sda
/dev/sda5  partition   -        -      82   8.0G  /dev/sda
/dev/sda   device      -        -      -    192G  -
```

After that, if you boot the guest VM again and check, you can use the enlarged
space:
```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            9.7G     0  9.7G   0% /dev
tmpfs           2.0G  8.6M  2.0G   1% /run
/dev/vda1       181G   24G  149G  14% /
tmpfs           9.8G     0  9.8G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           9.8G     0  9.8G   0% /sys/fs/cgroup
tmpfs           2.0G     0  2.0G   0% /run/user/1000
```

Reference:
https://fatmin.com/2016/12/20/how-to-resize-a-qcow2-image-and-filesystem-with-virt-resize/


QCOW2 Image Mount
=================

You might want to access to the guest VM image directly from the host.
It is available using `qemu-nbd` tool.
For that, load the `nbd` kernel module and connect the qcow2 format VM image
via `qemu-nbd`:

```
$ cd qemu.sandbox
$ sudo modprobe nbd max_part=8
$ sudo ./bin/qemu-nbd --connect=/dev/nbd0 ./qc2img.bak
```

Now you can see the partitions in the image using `fdisk` as below:

```
$ sudo fdisk -l /dev/nbd0
Disk /dev/nbd0: 192 GiB, 206158430208 bytes, 402653184 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xe513ef69

Device      Boot     Start       End   Sectors  Size Id Type
/dev/nbd0p1 *         2048 385877631 385875584  184G 83 Linux
/dev/nbd0p2      385877632 402650753  16773122    8G  5 Extended
/dev/nbd0p5      385877634 402650753  16773120    8G 82 Linux swap / Solaris
```

Mount a partition you want to access:
```
$ sudo mount /dev/nbd0p1 ./mnt/
$ cd mnt/
$ ls
bin   etc         initrd.img.old  lib64       media  proc  sbin  sys  var
boot  home        lib             libx32      mnt    root  snap  tmp  vmlinuz
dev   initrd.img  lib32           lost+found  opt    run   srv   usr  vmlinuz.old
```

If you are done, `unmount` and disconnect the device using `qemu-nbd`.

```
$ sudo umount ./mnt
$ sudo ./bin/qemu-nbd --disconnect /dev/nbd
nbd0    nbd0p2  nbd1    nbd11   nbd13   nbd15   nbd3    nbd5    nbd7    nbd9
nbd0p1  nbd0p5  nbd10   nbd12   nbd14   nbd2    nbd4    nbd6    nbd8
$ sudo ./bin/qemu-nbd --disconnect /dev/nbd0
/dev/nbd0 disconnected
$
```
