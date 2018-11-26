---
layout: post
title: "Want more colors in your terminal? Enter colorcoke!"
date: 2010-10-03
tags: linux, terminal, cli
---


**History**

In the beginning, there were eight colors.

Soon this was extended to 1; the added eight was supposed to be either
just the same colors with an added bold attribute, or 'bright' versions
of the first 8, depending on implementation. Known as the *ANSI
colors*, these could be freely modified by loading X resources and
respawning the terminal.

Along came rxvt-unicode that offered an amazing 88 colors.

Xterm followed by supporting 256, but none of these could be modified by
a regular user. You simply were stuck with what some dude thought were a
good selection of colors.

Now that a lot of applications support more then the regular ANSI
colors, they actually serve a purpose. Therefore it's quite sad that one
can't modify them.

Right. So *let's do it anyway.*

**colorcoke**

![colorcoke](/assets/colorcoke.gif)

[colorcoke](http://github.com/trapd00r/colorcoke)


colorcoke lets one modify the whole range of colors for a running terminal session.

The changes will take effect immediately - no need to spawn a new
terminal or (ab)use the xrdb tool.

Shades and tints can be generated for specific ranges - you could leave the
ANSI colors untouched while going for a matrix-like green shading for colors
32-60, a deep purple theme for 102-200, and completely randomizing the rest.

The randomness can be modified as well. If you dont like green, just use
something like this:

{%highlight perl%}

colorcoke --random -rr 200 -rb 190 -rg 0

{%endhighlight%}

The main feature of *colorcoke* is the one that generates tints and shades though.
This works by giving it a color to start with (the default is #000, pitch black).

Try this:

{%highlight perl%}
colorcoke -c 000000 -r 2 -g 1 -b 1 -s 0 -e 255
{%endhighlight%}

You might notice that color 7, 15 and 232 doesn't quite fit in there.
Those reside in the array of colors to ignore - I use 232 as my terminal
background color, and 7 and 15 are the default foreground colors.

The -s and -e flag specify start and end index, respectively. To simply
generate standard ANSI colorschemes, one might try

{%highlight perl%}
colorcoke --random -s 0 -e 15 -rg 0 -rb 200
{%endhighlight%}
