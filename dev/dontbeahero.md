---
layout: default
permalink: /dev/dontbeahero/
title: "Don't worry, someone else will save the planet"
author: Magnus Woldrich
---

# NAME

dontbeahero - don't worry, someone else will save the planet

# USAGE

dontbeahero \[OPTION\]...

# OPTIONS

    -s,  --stdout    don't daemonize
    -d,  --delay     set delay
    -l,  --lockfile  specify lockfile
    -k,  --stop      stop the daemon

    -h,  --help      show the help and exit
    -v,  --version   show version info and exit
    -m,  --man       show the manual and exit

# DESCRIPTION

I often play music videos on my TV when I code. When I need to take a break
I usually go and get some pineapple slices and make myself comfortable in
the sofa.

The builtin power saving features can't be turned off enough to make the screen
not darken itself, so I had to manually press a key on the tiny htpc keyboard to
get the picture back on. Accidently I often pressed a button that'd quit mplayer
or do other nasty things like jumping 50 videos back in the playlist.

The initial solution was to run

    xdotool mousemove 0 0

in a crontab. This worked great the first time. The second time around there's
nowhere to move and the screen stays black.

**dontbeahero** uses a delay of 540 seconds (9 minutes) by default. It seems most 
monitors turn themselves off after 10 or 15 minutes.

# PREREQUISITES

[xdotool](http://www.semicomplete.com/projects/xdotool/)

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# CONTRIBUTORS

[Dmitri Iouchtchenko](https://github.com/0)

# LICENSE

This application is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
