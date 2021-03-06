---
layout: default
permalink: /dev/rmshit/
title: "rmshit - keep your $HOME or other directory structure tidy at all times"
author: "Magnus Woldrich"
---


# NAME

rmshit - keep a directory structure clean at all times

# SYNOPSIS

rmshit \[OPTIONS\]

# DESCRIPTION

**rmshit** was born out of plain rage and frustation, seeing that nobody seems to
care about the XDG specifications, and dumping configuration files, temporary
data and logs straight into $HOME.

Even if you manually delete these files, they will be recreated when the
Application of Sin wants to (when it's executed, seeing default data is missing,
for example).

The most well known application that does this, as of this writing, is Mozilla
Firefox, creating $HOME/Desktop, over and over again.

rmshit uses inotify to keep an eye on a directory structure, instantly removing
data upon it's creation.

# OPTIONS

    -c, --clean   clean dir(s) of unwanted files and exit
    -l, --lastlog show the last n number of removed files (default: 25)
    -k, --kill    kill a running rmshit process
    -h, --help    this help
    -m, --man     manpage

# ENVIRONMENT

rmshit watches the directories you specify in the configuration file. It should
be placed in $XDG\_CONFIG\_HOME/rmshit/rmshit.conf or
$HOME/.config/rmshit/rmshit.conf.

The log file will be placed in $XDG\_DATA\_HOME/rmshit/rmshit.log. Entries will
look like this:

\[\* FILE\] 2010-07-18 07:19:26: /home/scp1/.fehrc

\[\*  DIR\] 2010-07-18 07:20:02: /home/scp1/Desktop

\[  FILE\] 2010-07-18 07:20:02: /home/scp1/.craprc

The '\*' indicates the file was already present when rmshit was started.

# REPORTING BUGS

Report bugs to trapd00r@trapd00r.se

rmshit homepage: http://github.com/trapd00r/rmshit

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# COPYRIGHT

Copyright 2010 Magnus Woldrich <m@japh.se>. This program is free
software; you may redistribute it and/or modify it under the same terms as
Perl itself.
