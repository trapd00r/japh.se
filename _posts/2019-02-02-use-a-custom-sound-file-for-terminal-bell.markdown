---
layout: post
title: use a custom sound file for terminal bell
date: 2019-02-02
author: "Magnus Woldrich"
tags: linux, terminal
---

I wanted to enable my internal pc speaker; you know that annoying
beeping thing. Normally the pcspkr module is blacklisted by default
(since it's so annoying), so I re-enabled it.

{%highlight bash%}

modprobe pcspkr
printf \\a

{%endhighlight%}

No beep.

Upon closer inspection of my computer, turns out there's no actual
speaker inside my computer. Well isn't that a shame.
I did however discover that you can simulate one by using X resources:

{%highlight bash%}
URxvt*bell-command: play ~/awp.wav
{%endhighlight%}

The actual sound will obviously go through your normal speakers or
headphones, but that's okay. Now I can do things like:

{%highlight bash%}
unrar x big_movie.rar \
  && cp Big_movie.mkv /mnt/NAS/movies \
  && printf \\a
{%endhighlight%}

and walk away from the computer. I will still hear the sound of the [CS 1.6 AWP](https://github.com/trapd00r/configs/blob/master/awp.wav?raw=true)
firing off at me when the operation is done.

The bell-command can be anything, and the play command is part of the
ALSA packages.
