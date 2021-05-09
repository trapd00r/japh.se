---
layout: post
title: abusing permission flags to distinguish watched episodes
date: 2021-05-09
author: "Magnus Woldrich"
tags: linux 
---

![seen](/assets/seen.png)

I do 95% of my file management straight in the terminal using standard coreutils.
The remaining 5%, I use [vidir](https://github.com/trapd00r/vidir).

I also use things like mplayer and mpd to watch episodes and listen to
music and podcasts, ergo; no builtin way of marking episodes as watched,
as can be found in various gui applications. How, then, would one keep
track of what's watched and what's not?

The standard LS_COLORS project have a few interesting ways of adding
attributes to files and directories with special permission bits set.
The most interesting ones are:

```
SETGID
STICKY
STICKY_OTHER_WRITABLE
```

All of these can be colored individually, and with the exception of the
last one, setting the corresponding bits in the filesystem shouldn't
have any security implications or limitations, assuming a local
filesystem where you are the only user.

If a file has the `SETGID` bit set, when executed, instead of running
with the privileges of the group of the user who started it, runs with
those of the group which owns the file. In the situation described
above, these should be the same in most cases.


If a directory has the `STICKY BIT` set, all the files in said directory
will be modifiable only by their owners. Again, in the situation
described above, this isn't a bad thing.

So, how can we (ab)use this?

Here's a script called `seen` that sets the `SETGID` bit on a file and
`STICKY` on a directory.

```
#!/usr/bin/perl
# vim:ft=perl:
# abstract: abuse sticky bits etc to mark a movie or show as seen
use strict;
use warnings FATAL => 'all';

if(!@ARGV) {
  use Cwd ();
  push @ARGV, Cwd::abs_path
}

for my $f(@ARGV) {
  if(-f $f) {
    chmod(02740, $f) or warn "chmod: $!\n";
  }
  elsif(-d $f) {
    chmod(01700, $f) or warn "chmod: $!\n";
  }
  else {
    warn "E: $_ is neither a file or a directory\n";
  }
}
```

Use it like this:

```
$ mplayer Laleh.S01E01-FOO/Laleh.S01E01-FOO.mkv
$ seen !$
```

![seen2](/assets/seen2.png)

[LS_COLORS](https://github.com/trapd00r/LS_COLORS)

