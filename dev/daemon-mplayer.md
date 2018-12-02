---
layout: default
permalink: /dev/daemon-mplayer/
title: "Daemon::Mplayer - run mplayer as a daemon"
author: Magnus Woldrich
---


Mplayer, daemonized.

SYNOPSIS
--------

{%highlight perl%}
use Daemon::Mplayer;

mplayer_play(
  {
    pidfile => $pidfile,
    logfile => $logfile,
    path    => '/usr/bin/mplayer',
    args    => [ @files ],
  }
);

mplayer_stop($pid);
{%endhighlight%}



    mplayer_play()
      Parameters: $pidfile, $log, $path, @mplayer_arguments

      mplayer_play(
        pidfile => $pidfile,      # /tmp/mplayer_daemon.pid
        logfile => $logfile,      # /dev/null
        path    => $mplayer_path, # /usr/bin/mplayer
        args    => $mplayer_opts  # None
      );

    The pidfile is used as a locking mechanism and will contain the PID of
    the spawned mplayer process.

    The logfile is where the output from mplayer will be stored. The default
    is /dev/null.

    The path is the full path to an mplayer executable. Defaults to
    /usr/bin/mplayer.

    args takes an array reference that might contain optional parameters to
    mplayer, as well as the file/URI to be played.

    mplayer_stop()
      Parameters: $pid | $pidfile

      Returns: Boolean

      Takes a PID or pidfile and tries to stop the corresponding process.

      If a valid PID is encountered in the pidfile, tries to stop the process.
      If this succeeds, the pidfile is removed.

AUTHOR
------
      Magnus Woldrich
      CPAN ID: WOLDRICH
      m@japh.se
      http://japh.se
