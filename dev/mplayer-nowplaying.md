---
layout: default
permalink: /dev/mplayer-nowplaying/
title: "Query a running mplayer process for now-playing metadata"
author: Magnus Woldrich
---


# NAME

Mplayer::NowPlaying - query a running mplayer process for now playing metadata

# SYNOPSIS

{%highlight perl%}

use Mplayer::NowPlaying;

my $log = "$ENV{HOME}/.mplayer/mplayer.log"; # or elsewhere

my $current = now_playing($log, 'identify');

if(exists($current->{artist})) {
  print "Current artist is $current->{artist}\n";
}

{%endhighlight%}

# DESCRIPTION

**Mplayer::NowPlaying** was born because the author runs **mplayer** daemonized,
controlling it via named pipes. I wanted a simple way to retrieve various 'now
playing' metadata for the currently playing media.

# EXPORTS

None by default.

# FUNCTIONS

## now\_playing()

- Arguments:    $logfile | $filehandle, \[ $mode \]
- Return value: \\%metadata

    my %metadata = %{ now_playing($logfile, 'identify'); };
    my $artist = $metadata{artist};

**now\_playing()** takes two arguments, the last one is optional:

\* The logfile (or filehandle) output from mplayer is directed to

\* 'normal' or 'identify' mode. Normal is the default.

## MODES

### NORMAL

Start mplayer in normal mode and redirect STDOUT to a file:

    mplayer *.mp3 > ./mplayer_log

Get the current title:

    # 'normal' argument optional; this is the default
    my $now_playing = now_playing("$ENV{HOME}/mplayer.log", 'normal');

    printf("Current title is %s\n", $now_playing->{title});

Mplayer produces a lot of output in normal mode, effectively making our metadata
retrieval slow very fast (10 files played or so). Therefore it's really
recommended to use **identify** mode, see below.

### IDENTIFY

Start mplayer with the -identify switch:

    mplayer -identify *.mp3 > mplayer_log

or the preferred

    mplayer -quiet -msglevel all=0 -identify *.mp3 > mplayer_log

Get the current title:

    # note 'identify' argument
    my $now_playing = now_playing("$ENV{HOME}/mplayer.log", 'identify');

    printf("Current title is %s\n", $now_playing->{title});

By using **-msglevel all=0 -identify** the amount of output from mplayer is
reduced to a minimum, making the retrieval very fast. This is recommended.

The hash will be filled with the available metadata for the current media.
A typical result might look like:

    album    => "Me and Simon",
    artist   => "Laleh",
    audio    => 44100,
    bitrate  => 128000,
    channels => 2,
    chapters => 0,
    codec    => "mp3",
    demuxer  => "audio",
    file     => "~/Laleh-Me_and_Simon/01-big_city_love.mp3",
    format   => 85,
    genre    => 1,
    id       => 0,
    length   => "1288.00",
    seekable => 1,
    start    => "0.00",
    title    => "Big city love",
    year     => 2009

Possible keys include:

    title
    artist
    album
    year
    comment
    genre
    bitrate
    codec
    format
    id
    channels
    chapters
    audio
    demuxer
    length
    seekable,
    start
    file

## now\_playing\_stream()

- Arguments:    $logfile | $filehandle
- Return value: \\%metadata

**now\_playing\_stream()** takes a single argument; the logfile (or filehandle) to
be used.

If the stream being played supports **ICY info**, a hash reference will be
returned with artist, album, title and ICY keys and their corresponding values,
like so:

    artist => "Suzanne Vega",
    album  => "Retrospective: The Best of Suzanne Vega",
    title  => "Left of Center",,
    icy    => "Retrospective: The Best of Suzanne Vega - Suzanne Vega - Left of Center",

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    magnus@trapd00r.se
    http://japh.se

# CONTRIBUTORS

None required yet.

# COPYRIGHT

Copyright 2011 the **Mplayer::NowPlaying** ["AUTHOR"](#author) and ["CONTRIBUTORS"](#contributors) as
listed above.

# LICENSE

This library is free software; you may redistribute it and/or modify it under
the same terms as Perl itself.

# SEE ALSO

[Mplayer::NowPlaying::Genres](https://metacpan.org/pod/Mplayer::NowPlaying::Genres)
