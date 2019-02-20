---
layout: post
title: ignore blob of text on irssi channel join
date: 2019-02-20
author: "Magnus Woldrich"
tags: irssi, perl
---

Lately I've been having some connectivity issues on my wifi-connected
raspberry pi. I run irssi among other things on it, and when I re-attach to the screen session running on it I'll be greated by blobs of text like this one:

    > Topic set by Zathrus ~tom@redhat/Zathrus [Fri Nov 16 18:15:40 2018]
    > Home page for #vim: http://vi-improved.org
    > Channel #vim created Sun Nov 26 07:42:44 2006
    > Irssi: Join to #vim was synced in 74 secs

This blob of text is re-printed everytime you (re)join a channel, and
with a not so stable wifi connection it'll very quickly fill up the
entire scrollback.

Since I'm never interested in any of these info texts, I tried to just
/ignore it all together, but that doesn't work even with a mask like this:

    \*: CRAP CTCPS JOINS PARTS QUITS MODES TOPICS WALLOPS INVITES NICKS DCC DCCMSGS CLIENTNOTICES CLIENTCRAP CLIENTERRORS

It was suggested to me to examine the lines with [linebuffer.pl](https://scripts.irssi.org/scripts/linebuffer.pl), so I did:

    > Topic set by %bgrknight%_ ~grknight@gentoo/developer/grknight %K[%b%_Fri Jan  4 20:55:24 2019%K]   [CRAP]
    > Home page for %R#gentoo%n: http://www.gentoo.org [CRAP]
    > Channel %R#gentoo%n created Sat Sep 15 05:15:36 2001   [CRAP]
    > %WIrssi:%_ Join to %_#gentoo%_ was synced in 2%_ secs     [NO_ACT CLIENTNOTICES]

To me it seems that the ignore mask SHOULD work, and this is indeed a [bug](https://github.com/irssi/irssi/issues/992) in irssi.

I went ahead and just [removed](https://github.com/trapd00r/irssi/commit/87f38a20beda81e409a72efd323f5db45d824927) the formats defined in module-
formats.c.
It works, but kind of annoying having to recompile (remember, this is a pi and it takes forever).

A better solution was to whip up a simple [script](https://github.com/irssi/scripts.irssi.org/blob/master/scripts/ignore_join_blob.pl) that stops the text to be printed to the terminal:

{%highlight perl%}
sub sig_print_text {
  my ($dest, $string, $stripped) = @_;

  if($dest->{level} & MSGLEVEL_CRAP) {
    if($stripped =~ m/Topic (for|set)|Channel [#]\S+ created|Home page for [#]\S+/) {
      Irssi::signal_stop();
    }
  }
}

Irssi::signal_add_first('print text', \&sig_print_text);
{%endhighlight%}

Works great and now I'm able to follow up on conversations without
having to scroll like crazy whenever I reattach my screen session.
