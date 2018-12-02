---
layout: default
permalink: /dev/screenfo/
title: "screenfo - screenshot information tool written in perl"
author: "Magnus Woldrich"
---


# NAME

    screenfo - screenshot information tool for nerds

# SYNOPSIS

    screenfo [OPTION]...

# DESCRIPTION

Everybody likes 'The monthly screenshot thread' where one is supposed to show
off their latest setup.

Nobody likes screenshots that look awesome, but where there's no information
at all available.

**screenfo** outputs a load of system information, including the running window
manager, GTK theme, icons, fonts, shell, terminal emulator, and much more,
while taking the screenshot.

# OPTIONS

    -c,   --color     specify colorscheme to use
    -l,   --list      list available colorschemes
    -a,   --ascii     specify ascii art to use
    -r,   --random    randomize the colors
    -s    --shot      take screenshot

    -d,   --debug     run some tests and exit
    -h,   --help      show help and exit
    -m,   --man       show the manpage and exit
    -v,   --version   show version info and exit

# ENVIRONMENT

The configuration file is searched for in the following places:

    $XDG_CONFIG_HOME/screenfo/screenfo.conf
    $HOME/.config/screenfo/screenfo.conf
    $HOME/.screenfo.conf
    $HOME/screenfo.conf
    ./screenfo.conf
    /etc/screenfo.conf

The files in the ascii/ directory is searched for in in the following places:

    $XDG_DATA_HOME/screenfo/ascii
    $XDG_CONFIG_HOME/screenfo/ascii
    $HOME/.local/share/screenfo/ascii
    $HOME/.screenfo/ascii
    ./ascii
    /usr/share/screenfo/ascii

# REQUIREMENTS

Perl => 5.10

Term::ExtendedColor, available from CPAN:

    cpan Term::ExtendedColor

or github: [http://github.com/trapd00r/Term-ExtendedColor](http://github.com/trapd00r/Term-ExtendedColor)

Some standard UNIX tools

scrot for taking the actual screenshot

# AUTHOR

Written by Magnus Woldrich

# REPORTING BUGS

Report bugs to m@japh.se or use the issue tracker located at <http://github.com/trapd00r/screenfo/issues>

screenfo homepage: &lt;http://github.com/trapd00r/screenfo>

# COPYRIGHT

Copyright (C) 2010 Magnus Woldrich

License: GPLv2

# HISTORY

Lets quote the Arch Linux user **dtw** from a post on the BBS, late 2006:

    OK, all the time in the screenshots thread we get "What gtk theme is that?",
    "What is that in the corner?", blah blah blah.
    Now, while we try to encourage people to post that with their screenie why
    don't we make a simple script that grabs info from from the gtkrc's, .xinitrc,
    etc, and outputs into a nice cowsay-like soundbite?

Couple days later, user **rab** made the first Perl version simply named
'info.pl'. There were a lot of people in the community helping out,
making it better, bigger, more complicated and virtually unmaintainable since
absolutely no modularization or subroutines were used.

People realized this and started to make their own versions in Bash and Python.

My intent was to fork the original project, clean it up and make it
maintainable, but that was no fun. Therefore, **screenfo** was born.

# THANKS

I'd like to thank the Archlinux community for being awesome, **kittykatt** for
providing some ASCII art that I stole without asking, and **slush-** for coming up
with this awesome name.

# SEE ALSO

The original post: &lt;https://bbs.archlinux.org/viewtopic.php?id=24208&p=10>
