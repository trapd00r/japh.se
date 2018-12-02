---
layout: default
permalink: /dev/rmcd/
title: "rmcd - an mplayer daemon and client"
author: "Magnus Woldrich"
---


# NAME

rmcd - Remotely control a daemonized Mplayer process

# SYNOPSIS

    rmcd [OPTION]... [FILE/URI]

# DESCRIPTION

**rmcd** is a mplayer daemon/client - it daemonizes itself, playing
music/movies/radio stations and waiting for input through the named pipe.

You can send commands, load and play new content whenever you like.

You can run rmcd on one computer and remotely control it on another, fully
transparent. It only cares for the presence of the named pipe.

You can also setup mplayer to stream the content to you, creating a solution
similar to MPD and their builti-in httpd streaming (except MPD does not support
video streaming).

rmcd features a built-in, user configurable, web radio management system,
functionality for copying the current track to your portable mp3 player or
wherever you prefer, favorizing of tracks and loading of the same, now playing
information for both local files and streams, along with other nifty stuff.

# OPTIONS

    -l,   --load       play FILE(s)/URI or radio station (see -chanlist)
    -r,   --shuffle    shuffle the playlist before adding it
          --repeat     turn repeat ON
    -pl,  --playlist   show the current playlist
    -c,   --cmd        send COMMAND to a running process (see shortcuts)
    -cl,  --clist      show a list of commands that are supported
    -i,   --info       show now playing information

    -n,   --next       next in playlist
    -p,   --prev       previous in playlist
    -t,   --toggle     toggle playback
    -s,   --stop       stop playback
    -f,   --fullscreen toggle fullscreen

    -k,   --kill       kill the running process

    -h,   --help       show the help and exit
    -m,   --man        show the documentation and exit
    -v,   --version    show version info and exit

# ENVIRONMENT

The configuration file should be placed in $XDG\_CONFIG\_HOME/rmcd/rmcd.conf

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# CONTRIBUTORS

None required yet.

# COPYRIGHT

Copyright 2010, 2011 the **rmcd** ["AUTHOR"](#author) and ["CONTRIBUTORS"](#contributors) as listed
above.

# LICENSE

This application is free software; you may redistribute it and/or modify it
under the same terms as Perl itself.

# SEE ALSO

[rmcd.conf(1)](http://man.he.net/man1/rmcd.conf)

**Radio Playing Daemon** [http://github.com/trapd00r/RPD/](http://github.com/trapd00r/RPD/)

[Mplayer::NowPlaying](https://metacpan.org/pod/Mplayer::NowPlaying)  [http://github.com/trapd00r/Mplayer-NowPlaying/](http://github.com/trapd00r/Mplayer-NowPlaying/)
