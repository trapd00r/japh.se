---
layout: post
title: rtorrent harddrive lockup with many torrents solution
date: 2019-03-09
author: "Magnus Woldrich"
tags: rtorrent, linux
---


rtorrent is a great piece of software, and with patches from the [rtorrent-ps](https://github.com/pyroscope/rtorrent-
ps) project it's even better. Seeding many torrents, I started noticing
harddrive lockups every now and then, where the program wouldn't respond
until I forcefully removed the usb cable to one of my drives.

Figuring it could be that the drive itself was running bad, I just lived
with the issue for a while. Upon accident, I stumbled upon an [issue](https://github.com/rakshasa/rtorrent/issues/180) that looked relevant.

Although some people think it could be an dns issue, some people also
reports that:


> It seems to happen when the session directory is being updated.


Turns out that rtorrent saves all the sessions every 20 minutes by
default. With a large amount of torrents this can be a disk
performance hog.

I tried to increase the interval to 12 hours instead:

**~/.rtorrent.rc**

`
schedule2 = session_save, 1200, 43200, ((session.save))
`

and I've had zero lockups or crashes since then.

Current situation looks like this:

![img](/assets/rtorrent.png)


`
1.5 GiB +   1.8 MiB =   1.5 GiB    rtorrent main
`



which is pretty darn good I must say.
