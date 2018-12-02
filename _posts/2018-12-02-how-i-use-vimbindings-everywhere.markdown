---
layout: post
title: "how I use vim-bindings everywhere"
date: 2018-12-02
author: "Magnus Woldrich"
tags: linux, vim, cli, terminal
---

I love vim. It's quite possibly one of the best engineered pieces of
software ever created. Let me describe how I use vi(m) keymaps in every
single application that I use on a daily basis.

Xorg
----
I highly recommend mapping the useless Caps Lock key to ESC globaly in X
using xmodmap. This will be very useful in every place where we use
vimbindings, like readline in your shell.

Use xev to find out the keycode for your caps lock key. On my desktop
it's 0x42, on my laptop it's 60.

{%highlight bash%}
xmodmap -e 'clear Lock' -e 'keycode 60' = Escape
{%endhighlight%}

The virtual console / TTY
-------------------------

Having Caps Lock mapped to ESC outside of X is a tiny bit trickier. Make
sure you're in a TTY when you do this, or else you'll get false results!

{%highlight bash%}
# Let's find out what keycodes map to the keys we want to remap
dumpkeys -l | grep -P 'escape|caps'

  Caps Lock       58
  Escape           1

{%endhighlight%}

Put our new definition in a file called */usr/local/share/kbd/keymaps/caps_to_esc*
and use the loadkeys application to load our new values:

{%highlight bash%}

echo 'keycode 58 = 1' >> /usr/local/share/kbd/caps_to_esc
loadkeys -q /usr/local/share/kbd/caps_to_esc

{%endhighlight%}

Shell
----

**Bash and readline**

Bash uses readline which supports a vi keymap. In bash you can enable it
by issuing:

{%highlight bash%}
set -o vi
{%endhighlight%}

You can activate it for other applications using readline (like for example [pimpd2](/dev/pimpd2/) by placing
this in your $HOME/.inputrc:

{%highlight bash%}
set editing-mode vi
set keymap vi-insert
{%endhighlight%}

See readline(3) for a full list of options. You can also take a peek at [my inputrc](https://github.com/trapd00r/configs/blob/master/inputrc).

**Zsh**

Zsh doesn't make use of readline since it got its own command line
editor called zle. You can still put this in your shell resource
file though:

{%highlight bash%}
set -o vi
{%endhighlight%}

Additionally, you can use the very powerful zle function **bindkey** to manipulate
your keymaps. See

{%highlight bash%}
zle -l
{%endhighlight%}

for a full list of keymaps, or [checkout mine](https://github.com/trapd00r/configs/blob/master/zsh/03-
bindkeys.zsh). I use full vimbindings along with a subset of useful
emacs bindings.


File management
-----

**vidir**

All my file management needs is handled in the shell or in [vidir](https://github.com/trapd00r/vidir).
vidir isn't a file manager plugin for vim; all the file management is handled in vim itself. 
A buffer is loaded with the content of a directory in a buffer. All
operations that you perform on this buffer happens on the files themselves.
You can use regular expressions, visual mode marks, [custom
functions](https://github.com/trapd00r/configs/blob/master/vim/nancy/00-
0-functions.vim#L16) and so on.

Simple example:

dd (delete linewise) will delete a line in the buffer, and when you :wq, that file will be deleted in the filesystem.


irc
-----

**irssi**

For a very long time, irssi was the only place where I couldn't get
vimbindings working. I had to use cursor keys and other evilness.
Then, all of a sudden, [shabble](https://github.com/shabble) came along
and saved the day (and my fingers) with his wonderful [vim-mode](https://github.com/shabble/irssi-scripts/tree/master/vim-mode) plugin.

Make sure to check out his [other scripts](https://github.com/shabble/irssi-
scripts) as well, there are some really nifty stuff in there.


Browsers
------------------

**Firefox**

Quite a sad story, really.

I used vimperator for many, many years. Along came pentadactyl which was
supposed to be the successor, and I used it for a few years as well.
Then, pentadactyl broke somehow and I went back to vimperator where
development had started again.

Now, sadly, firefox changed their addon api in a way that renders all
old addons obsolete and non-functional. Due to the complexity of
vimperator, writing it again from scratch isn't a task someone have been
willing to take on.

There's a few options today:

* Use firefox =< 56 and vimperator.
* Use a recent firefox and [tridactyl](https://github.com/tridactyl/tridactyl).
* Use Google chrome and Vimium.

I don't like chrome so I use tridactyl which is ok.

Music
-----

**pimpd2**

The most [feature-full](https://github.com/trapd00r/pimpd2) cli mpd client that I know of.
I also happened to write it. :) 

It's a command line client that also sports an interactive shell. That
shell used readline, and using readline we get the vi keymap, remember?

**ncmpcpp**

[ncmpcpp](http://unkart.ovh.org/ncmpcpp) is a client built using c++ and
ncurses. It features vim-like bindings fresh out of the box and is highly configurable.


Video
-----

**mplayer**

On linux, the obvious choice for video is mplayer. Along with the
mplayer config, an additional file can be used that specifies your input
configuration. [Here's mine](https://github.com/trapd00r/configs/tree/master/mplayer).

Git
---

[tig](https://git.wiki.kernel.org/index.php/Tig) is a highly
configurable ncurses git client with vim movement keys being the
defaults.

pdf
---

For PDF viewing I use [apvlv](https://github.com/naihe2010/apvlv) which is the least
annoying PDF viewer I know of and it 'works just like Vim'.

