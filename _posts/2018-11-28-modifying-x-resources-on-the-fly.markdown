---
layout: post
title: "modifying x resources on the fly"
date: 2018-11-28
author: "Magnus Woldrich"
tags: linux, colors, terminals
---

For these tricks, I am going to assume that you are using a somewhat
sane terminal emulator.
Everything I write about here works in xterm and urxvt, and most things
should work in any vte-based terminal (gnome-terminal, termite,
lxterminal etc).

Some things might or might not work in iTerm...

All things listed here does work in both GNU Screen and Tmux, but you will
have to [escape the escape sequences](https://github.com/trapd00r/Term-ExtendedColor-Xresources/blob/5973c08d7a4624a6e1b5d4a3c4f90a025985ea31/lib/Term/ExtendedColor/Xresources.pm#L115). ;)

Here's a gif to keep you interested:

![gif](/assets/t_e_x_rainbow.gif)

Changing terminal color schemes
==========

If you for some reason wish to change the colorscheme in your terminal,
this is the usual way to do so:

{%highlight bash%}

vim ~/.Xresources
<tedious edit>
<save>
xrdb !$
<close terminal session>
<start a new one>

{%endhighlight%}

This gets old quickly, especially if you're in the process of trying new
colors out, not sure what you'll end up with.

Most people are aware of the fact that you can modify some colors of
your terminal, i.e the so called ANSI colors; color index 0-15. The
colors are usualy set during xinit, like so:

**~/.xinitrc**:

    xrdb ${XDG_CONFIG_HOME}/Xresources

**Xresources**:

     .color0: #1b1d1e
     .color1: #1b1d1e
    ...
    .color15: #f8f8f2
    .color16: #000000

When you log in to your system and start your first terminal, these
colors will be set... in stone.

No, not really.

Let's start two terminals, side by side:
[IMAGE]

In both terminals, run this command:

{%highlight bash%}

for i in {0..15}; do printf "\e[48;5;${x}m%.2d\e[m\n" $i; done

{%endhighlight%}

[IMAGE]

What you see is the currently defined ANSI color table. Now, in one of
the terminals, run this:

{%highlight bash%}

for i in {0..15}; do printf "\e]4;$x;rgb:ff/00/00\e\\"; done

{%endhighlight%}

[IMAGE]

We've just changed all of the defined ANSI colors to #ff0000, also known as
'very red', but *only* in the currently running terminal session. Not
very useful, but bare with me.


- - -


Over the years I've stumbled upon countless open source projects that
deal with terminal colors in any way that hardcode the color values. It
seems to be a little known fact that the extended colorset is not only
customizable, but you can modify them on the fly as well. Needless to say, 
hardcoded values are never good.

Let's try to modify some non-ANSI colors, shall we?

{%highlight bash%}

    for i in {17..33}; do printf "\e]4;$i;rgb:00/00/00\e\\"; done
{%endhighlight%}


![svg](/assets/modify_index_17_to_33.svg)

If this doesn't work for you and you're using xterm, you might need to
set these options in your Xresources configuration:

    XTerm*dynamicColors: 1
    XTerm*allowColorOps: 1

If you're using urxvt and it doesn't work, you might need to [patch](https://github.com/trapd00r/rxvt-unicode/commit/8b254b10e18d2cc1c0d8de37781e8982fb0aa284) it.


So, we can modify colors, that's great. But what about the hardcoded
values we talked about earlier? If we modify our colors like crazy, the
software that relies on those hardcoded default will break?

Well, they are broken to begin with, and they need to be fixed. We can query the terminal for the actual colors:

{%highlight bash%}

    printf "\e]4;197;?\a"

{%endhighlight%}

Output:

    rgb:ffff/0000/5f5f

Color index 197 has the value of ff005f (default).

Let's change its value and query the terminal again:

{%highlight bash%}
    printf "\e]4;197;rgb:ff/ff/00\e\\"
    printf "\e]4;197;?\a"
{%endhighlight%}

Output:

    rgb:ffff/ffff/0000

Pink turned yellow.

Maybe we can get away with assuming the first 16 ANSI colors are set to
something somewhat sane, but applications that deal with these extended
colors should either:

* Do the right thing and **query** the terminal for set colors.
* Explicitly state that it assumes that no colors are modified; i.e;
  default xterm colors.







Other escapes
-------------

The development of new terminal features has been pretty sparse over the
past 27 years ([ECMA-48, 1991](https://www.ecma-international.org/publications/standards/Ecma-
048.htm)).

And for good reasons. Having a standard is crucial for developers and users alike.
Nowadays when talking about standards, the phrase 'xterm compatible' is common.
Terminals claim to emulate _most_ of xterm, when in reality they emulate
the [most commonly used](https://invisible-
island.net/xterm/xterm.faq.html#compare_versions) control sequences.

There has been new development in this area though as of lately.
A few new terminals that market themselves as using opengl to render the
screen have seen the light, most notably
[kitty](https://sw.kovidgoyal.net/kitty) (not to be confused with the
putty fork of the same name).







Resources
=========


[Term::ExtendedColor - Perl library for using extended colors in your terminal](https://metacpan.org/pod/release/WOLDRICH/Term-ExtendedColor-0.222/lib/Term/ExtendedColor.pm)

[Term::ExtendedColor::Xresources - Perl library for modifying colors and query the terminal for set values](https://metacpan.org/pod/Term::ExtendedColor::Xresources)

[Text::ExtendedColor::TTY - Perl library for changing and querying the TTY/VC for various resources, such as colors](https://github.com/trapd00r/Term-ExtendedColor-TTY)

[Colorcoke - Program for changing the terminal colors in many ways](https://github.com/trapd00r/colorcoke/tree/4dc70684a33995694812f5ce59ce7241a97b30e4)

[rgbterm - query the terminal for rgb values of defined terminal colors](https://github.com/trapd00r/rgbterm)

[uncolor - strip input data from escape sequences](https://github.com/trapd00r/Term-ExtendedColor/blob/master/bin/uncolor)

[My Xresources](https://github.com/trapd00r/configs/blob/a7c67925a2e1a14a777e26592f6de0e5973e3d89/Xresources)

[My defined terminal colors](https://github.com/trapd00r/configs/blob/master/Xcolors/nancy.Xresources)

