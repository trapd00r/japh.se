---
layout: default
permalink: /dev/pimpd2/
title: "pimpd2 - an advanced cli mpd client written in Perl"
author: "Magnus Woldrich"
---

pimpd2 - Perl Interface for the Music Player Daemon 2
-----------------------------------------------------

[pimpd2](https://github.com/trapd00r/pimpd2) is a command-line based MPD client that implements all the features the author was missing from the
other awesome client, mpc.

* Regular expression based database queries
* Regular expression based searches in active playlist
* Quick searches for artist, album and title
* Randomizing of playlist; you could add 100 (carefully!) randomly selected tracks to your playlist
* Fetching of lyrics on demand
* Queue functionality
* Powerful interactive shell for basic MPD operations
* Monitoring of MPD - Whenever a song change takes place, pimpd announces
* Ability to easily copy current track to specified location; i.e your
  portable musicplayer of choice, your NAS or maybe to your to-burn directory
* Huge load of interesting information regarding what's currently spinning
* Support for 256 colors
* Support for colorschemes


Options
-------

          -np,   --now-playing      basic song info on a single line
          -i,    --info             full song info
          -cp,   --copy             copy the current track to destination
          -cpa,  --copy-album       copy the current album to destination
          -sh,   --shell            spawn the interactive shell
          -q,    --queue            queue tracks

      Playlist:
          -pls,  --playlist         show the current playlist
                 --playlists        list all known playlists
          -af,   --add-files        add files to playlist
          -a,    --add-playlist     add playlist
          -r,    --randomize        randomize a new playlist with n tracks
          -ra,   --random-album     add n random full albums
          -rma,  --rmalbum          remove album matching pattern from playlist
          -da,   --delete-album     delete the current album from disk
          -f,    --love             love song
                 --loved            check if the current song is loved
          -u,    --unlove           unlove songs matching pattern
          -spl,  --search-playlist  search the current playlist for str

      Collection:
          -lsa,  --songs            list songs on album
          -l,    --albums           list albums by artist
          -sdb,  --search-db        search database for pattern
          -sar,  --search-artist    search database for artist
          -sal,  --search-album     search database for album
          -set,  --search-title     search database for title
                 --slove            search the database with loved songs for pattern
                 --stats            display statistics about MPD
                 --status           display MPD status

      Controls:
          -n,    --next             next track in playlist
          -p,    --previous         previous track in playlist
          -cl,   --clear            clear the playlist
          -cr,   --crop             remove all songs but the current one from playlist
          -x,    --xfade            set crossfade
                 --pause            toggle playback status
                 --repeat           toggle repeat mode
                 --random           toggle random mode

          -p,    --play             start playback (locally and remote)
          -s,    --stop             stop playback (locally and remote)
          -k,    --kill             stop playback (locally)

          -h,    --help             show the help and exit
          -m,    --man              show the manual and exit
          -v,    --version          show version info and exit




Environment
-----------

pimpd2 will look for a configuration file in the following locations, in this
order:

    $XDG_CONFIG_HOME/pimpd2/pimpd2.conf
    ~/.config/pimpd2/pimpd.conf
    ~/.pimpd2.conf
    ./pimpd2.conf
    /etc/pimpd2.conf

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se


# SEE ALSO

[mpd(1)](http://man.he.net/man1/mpd)

[App::Pimpd::Collection::Album](https://metacpan.org/pod/App::Pimpd::Collection::Album), [App::Pimpd::Collection::Search](https://metacpan.org/pod/App::Pimpd::Collection::Search),
[App::Pimpd::Commands](https://metacpan.org/pod/App::Pimpd::Commands), [App::Pimpd::Doc](https://metacpan.org/pod/App::Pimpd::Doc), [App::Pimpd::Info](https://metacpan.org/pod/App::Pimpd::Info),
[App::Pimpd::Player](https://metacpan.org/pod/App::Pimpd::Player), [App::Pimpd::Playlist](https://metacpan.org/pod/App::Pimpd::Playlist),
[App::Pimpd::Playlist::Favorite](https://metacpan.org/pod/App::Pimpd::Playlist::Favorite), [App::Pimpd::Playlist::Randomize](https://metacpan.org/pod/App::Pimpd::Playlist::Randomize),
[App::Pimpd::Playlist::Search](https://metacpan.org/pod/App::Pimpd::Playlist::Search), [App::Pimpd::Shell](https://metacpan.org/pod/App::Pimpd::Shell), [App::Pimpd::Transfer](https://metacpan.org/pod/App::Pimpd::Transfer),
[App::Pimpd::Validate](https://metacpan.org/pod/App::Pimpd::Validate)
