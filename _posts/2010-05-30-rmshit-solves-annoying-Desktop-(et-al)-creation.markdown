---
layout: post
title: "rmshit solves annoying ~/Desktop (et al) creation"
date: 2010-05-30
author: "Magnus Woldrich"
tags: linux, cli, perl
---

Tired of having unwanted configs, directories and bloat messing with
your home dir?

So was I.

[rmshit](http://github.com/trapd00r/rmshit) uses
[inotify](http://en.wikipedia.org/wiki/Inotify) to watch your $HOME (or,
alternatively, any other dir) for unwanted files and instantly deletes
them. Since it's a daemon, you can start it at boot time and know
that'll keep your directories clean.

** To install the dependencies:**

{% highlight bash %}
cpan Linux::Inotify2 Working::Daemon
{% endhighlight %}

<i>or use your package manager of choice.</i>

**To install rmshit:**

{% highlight bash %}
git clone git://github.com/trapd00r/rmshit.git
cd rmshit
perl Makefile.PL
make
make install
{% endhighlight %}

You might want to edit the **@shittyfiles** array, containing unwanted files and dirs. 
It looks like this right now:

{% highlight perl %}
my @shittyfiles = qw(.dbus
                     .gconf
                     .gconfd
                     .links
                     .lynx
                     .local
                     .Xauthority
                     .dmenu_cache
                     .fmenu_cache
                     .esd_auth
                     .fehrc
                     .xsel.log
                     .ncmpcpp
                     Desktop
                     .adobe
                     .macromedia
                   );
{% endhighlight %}
