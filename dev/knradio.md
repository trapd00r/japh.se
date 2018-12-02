---
layout: default
permalink: /dev/knradio/
title: "knradio (karlstad rock) cli interface"
author: Magnus Woldrich
---

# NAME

knradio - interface for knradio, 92,2 FM

# DESCRIPTION

knradio is a command line interface for the "knradio" radio station.

# OPTIONS

    -np, --now-playing     print the currently playing song title
    -p,  --play            start playback
    -s,  --stop            stop playback
    -l,  --log             log playlist history to file
    -f,  --fav             add now playing song to favorites
    -lf, --list            list favorites
    -n,  --no-daemon       don't fork into the background

    -h,   --help           show this help
    -v,   --version        show version info

# AUTHOR

    Magnus japh Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# CONTRIBUTORS

Floff, for finding the np-url in the javascript mess.

# REPORTING BUGS

Report bugs and/or feature requests to <m@japh.se>.

# COPYRIGHT

Copyright 2016 the **knradio** ["AUTHOR"](#author) as listed above.

# LICENSE

This application is free software; you may redistribute it and/or modify it
under the same terms as Perl itself.

# SEE ALSO

[http://knradio.se](http://knradio.se)
