---
layout: post
title: use mhddfs to mount several physical disks as one
date: 2019-01-27
author: "Magnus Woldrich"
tags: filesystem, linux
---

I'm guilty as charged with obsessive compulsion disorder when it comes to
my files. Nothing more so than my music collection. I've spent more time
sorting it through the years than I'd like to think about.

An annoying thing with this behavior is that I have to move files from
time to time across physical disks and partitions. This can be quite
tiresome and time consuming.

Let me present [mhddfs](https://romanrm.net/mhddfs). It's a filesystem
in userspace that allows you to mount several physical drives into one
fixed mount point. Doesn't have to be physical drives either, can be
partitions or plain directories as well.

**df -h /mnt/music\***:

    Filesystem                          Size  Used Avail Use% Mounted on
    /dev/sdc1                           916G  840G   30G  97% /mnt/music
    /dev/sdb1                           916G  788G   82G  91% /mnt/music2
    /dev/sdd1                           1.8T  126G  1.6T   8% /mnt/music3
    /mnt/music;/mnt/music2;/mnt/music3  3.6T  1.8T  1.7T  51% /mnt/music4
    total                               7.2T  3.5T  3.4T  51% -

As you can see, the first three drives are mounted in /mnt/music4.
Everything on sdb1, sdc1 and sdd1 can be found at that mount point.
If I decide to stop using mhddfs, I can do so at any time without any
form of data loss. Files are written to the disk with enough free space.


    mhddfs#/mnt/music,/mnt/music2,/mnt/music3   /mnt/music4 fuse defaults,user,allow_other 0 0
