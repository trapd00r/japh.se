---
layout: post
title: adding LS_COLORS to ack3
date: 2019-03-26
author: "Magnus Woldrich"
tags: perl, ack, colors, LS_COLORS
---

A while back I made a quick hack in
[ack2](https://github.com/trapd00r/ack2) to make it use
[File::LsColor](https://metacpan.org/pod/File::LsColor) and
[LS_COLORS](https://github.com/trapd00r/LS_COLORS) for colorizing the
filenames instead of just Term::ANSIColor and the simple environment
variable ACK_COLOR_FILENAME.

I figured it was pretty useful so I opened an issue over at
[ack3](https://github.com/beyondgrep/ack3/issues/191) requesting
comments for the idea. Was it something anyone else would find useful?


At first, Andy Lester wasn't to keen on the idea, but the discussion has
continued and it seems he has changed his mind. I don't agree on the way
he wants to colorize filenames based on ack's internal types (a great
feature of the program!), but he wants to support LS\_COLORS as well so
it's all good.

Implementing a first working draft in ack3 wasn't too hard, and you can
see the difference between plain old Term::ANSIColor and File::LsColor
output here:

![ack](/assets/ack3_lscolor.png)


It will be exciting to see what will happen with this, in the meantime
the code can be found over at
[github](https://github.com/trapd00r/ack3/tree/dircolors) in the
dircolors branch.
