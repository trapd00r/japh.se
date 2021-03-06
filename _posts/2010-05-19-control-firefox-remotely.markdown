---
layout: post
title: "control firefox remotely"
date: 2010-05-19
author: "Magnus Woldrich"
tags: linux, perl, firefox
---

Do you wish to have firefox auto-refresh a certain page/tab?
Are you tired of having to focus the firefox window (means, leaving vim)
just to switch tab, go back a couple of pages, open a new page, etc?

Fear no more.

**MozRepl**

MozRepl is a javascript module that can be used to control various
Mozilla based applications 'from the inside'. It is also an application
itself - you can use it straight from the commandline. Beware though,
you'll have to write javascript.

Since I don't like javascript, that wasn't very appealing.
Lucky for me, there's a couple of Perl bindings, and here's the most interesting
ones.

* MozRepl::\*
* MozRepl::RemoteObject
* WWW::Mechanize::Firefox

Since I had prior knowledge of the WWW::Mechanize class, I went with
WWW::Mechanize::Firefox and started hacking.

So far, I've created several functions:

* load new page $page
* refresh the current page
* back / forward
* get current URI
* save current page as HTML
* show basic information about the current page
* extract all links
* click (yep! :)
* load a local page / directory
* dump the current page as a png. This will dump what firefox have rendered -
   not only what **you** see. That means, you can make a full-sized 
   PNG copy, no matter how big the page is. It also tries to be smart  by naming 
   the captured pictures after title-tag (escaped to some extent).
   This have been possible with webkit for ages and something I missed in Fx.


Now I have a couple of keybindings in my window manager for going back/forward,
load a uri (using the <strong><a href="http://github.com/trapd00r/clipbored/blob/master/scripts/dmenurl">dmenuurl</a></strong> script from <a href="http://github.com/trapd00r/clipbored"> my clipbored project</a>), etc.

The ::Firefox subclass does not support all features of the main WWW::Mechanize
module yet, and therefore I'm using both. 

If you want to try it out, you'll need the modules first:

{% highlight bash %}
cpan install WWW::Mechanize WWW::Mechanize::Firefox
{% endhighlight %}

When cpan is ready, just clone my repository:

{% highlight bash %}
git clone git://github.com/trapd00r/firefox-remote.git
{% endhighlight %}

And like always: feel free to fork and/or patch!
