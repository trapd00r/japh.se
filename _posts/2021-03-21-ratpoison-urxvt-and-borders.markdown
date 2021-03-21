---
layout: post
title: ratpoison, urxvt and borders
date: 2021-03-21
author: "Magnus Woldrich"
tags: linux, ratpoison, urxvt
---

The ratpoison window manager seems to have some kind of weird issues
with urxvt and borders, or the other way around. The right and bottom
border of a window gets 1px thicker than the rest and I can't seem to
figure out why. I've recompiled a clean urxvt and tried different fonts,
grepped the ratpoison source and investigated window manager hints, not
to much avail.

Since the borders are merely for aesthetics I found another solution:

By using the gap feature introduced by [jcs](https://github.com/jcs/ratpoison):

.ratpoisonrc:
```
 set gap 1
```
together with **no** border in Xresources, we can see 1px of the
background inbetween the windows. Since the background is black (by
default), just change it to your desired border color like so:


.xinitrc:
```
xsetroot -solid '#ff5400'
```

and we get perfect borders as a result:

![rp-borders](/assets/rp-urxvt-borders.png)

