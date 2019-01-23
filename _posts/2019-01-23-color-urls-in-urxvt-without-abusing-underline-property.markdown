---
layout: post
title: color urls in urxvt without abusing underline property
date: 2019-01-23
author: "Magnus Woldrich"
tags: urxvt, colors, terminal
---

The url-select perl addon for urxvt is awesome for mouseless opening of urls.

Without it, you have to select the url with your mouse, and remember which
clipboard buffer it ends up in prior to pasting it in your browser (unless you
[use something that'll sync your buffers](https://github.com/trapd00r/clipboard_to_primary)).
If you're anything like me, nine times out of ten you'll end up pasting
from the wrong buffer.

It would be nice if we could have the urls stand out a bit from the rest of the
text on the screen, and here's how to do it properly.

One way to color URLs in urxvt is to set the properties:

    url-select.underline: true
    colorUL: #ff0000

A couple of downsides to this method:
 <img src="/assets/urxvt_underline_red.png" align="right">
* You have to underline the urls, which can look ugly
* You effectively change the properties for **all** underlined text.
This is most probably not what you want.


Instead, make sure to set properties for only the matched data, like so:

    matcher.rend.0: Bold fg5

![urls](/assets/urxvt_urls.png)


The relevant bits from my Xresources:

    URxvt.perl-lib:              /home/scp1/dev/urxvt-extensions
    URxvt.perl-ext-common:       default,clipboard,url-select,keyboard-select,bell-command,matcher
    URxvt.keysym.C-u:            perl:url-select:select_next
    URxvt.perl-ext:              selection,mark-yank-urls
    URxvt.url-select.launcher:   /usr/lib/firefox/firefox
    URxvt.urlLauncher:           /usr/lib/firefox/firefox
    URxvt.url-select.underline:  false
    URxvt.keysym.C-Up:           perl:keyboard-select:activate
    URxvt.keysym.M-s:            perl:keyboard-select:search

    URxvt.matcher.rend.0:        Italic fg5

And as always, my ~/etc is [available on github](https://github.com/trapd00r/configs)
