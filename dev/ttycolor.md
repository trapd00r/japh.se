---
layout: default
permalink: /dev/ttycolor/
title: "ttycolor - change color palette in the tty / linux virtual console"
author: "Magnus Woldrich"
---

# NAME

ttycolor - set the colors in the TTY / Linux Virtual Console

# SYNOPSIS

**ttycolor** \[OPTIONS\] \[colorscheme\]

# DESCRIPTION

ttycolor allows you to change the colors in a Virtual Console.
It uses [Term::ExtendedColor::TTY](https://metacpan.org/pod/Term::ExtendedColor::TTY) and [Term::ExtendedColor::TTY::Colorschemes](https://metacpan.org/pod/Term::ExtendedColor::TTY::Colorschemes)
to perform that magic.

# OPTIONS

    -l, --list    list available colorschemes
    -t, --tty=N   specify TTY
    -r, --reset   reset to default TTY palette

    -h, --help    show the help and exit
    -v, --version show version info and exit
    -m, --man     show the manual and exit

# SEE ALSO

[Term::ExtendedColor::TTY](https://metacpan.org/pod/Term::ExtendedColor::TTY), [Term::ExtendedColor::TTY::Colorschemes](https://metacpan.org/pod/Term::ExtendedColor::TTY::Colorschemes)

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# REPORTING BUGS

Report bugs on rt.cpan.org or to m@japh.se

# COPYRIGHT

Copyright (C) 2010, 2011 Magnus Woldrich. All right reserved.
This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
