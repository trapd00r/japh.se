---
layout: post
title: advanced LS_COLORS rules with ls++
date: 2021-05-14
author: "Magnus Woldrich"
tags: linux, LS_COLORS, ls++
---

![colors](/assets/color_directories_differently_with_patterns.png)

It's possible to define a few rules outside of simple extension-based
ones using [LS_COLORS](https://github.com/trapd00r/LS_COLORS). You can
for example match literal filenames with no extension or simple globs:

```
*README 38;5;220;1
*rc     38;5;204  # matches rtorrent.rc as well as .zshrc
```

![lscolors_literal](/assets/lscolors_literal.png)


A few days ago I started using
[beets](https://beets.readthedocs.io/en/latest/index.html) to once and
for all organize my music collection. It's great. While organizing, I
wanted to get a quick sense of what my mp3:flac ratio looks like. I like
to keep both mp3 and flac versions of albums if possible.

Turns out, simply matching ```*FLAC*``` in ```LS_COLORS```
doesn't work. What you can't do in LS_COLORS, you can however do
with [ls++](https://github.com/trapd00r/ls--).


```ls++.conf```:

```
%ls_colors = (
  '(?i)\(FLAC\)' => '204',
  '(?i)\(MP3\)'  => '137',
);
```

The (?i) tells ls++ to match case insensitive. Here, I've chosen color
index 204 for FLAC and index 137 for MP3, the same colors that I use to
list files with these extensions:


```$LS_COLORS```:

```
.flac 38;5;204
.mp3  38;5;137
```

Though the patterns above are very simple, we can use the full power of
perl regex to add attributes to whatever we want, or how about matching seasons premieres:

```
%ls_colors = (
  '(?i)(s[0-9]{2}-s[0-9]{2}|s([0-9]{1,2})[eEx]01)|([Ss]?([0-9]{1,2}))[Eex]01' => 'bold reverse italic 196',
);
```

![premiere](/assets/season_premiere.png)

