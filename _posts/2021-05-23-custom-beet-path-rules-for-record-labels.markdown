---
layout: post
title: custom beet path rules for record labels
date: 2021-05-23
author: "Magnus Woldrich"
tags: linux, beets, music
---

I've been experimenting with
[beets](https://beets.readthedocs.io/en/latest/index.html) for the past
two weeks and it's awesome. 

When importing music, I started to notice that sometimes I don't want
albums grouped by the usual ```[a-z]/artist/artist - album``` structure.
There's 148 different artists in the [8bitpeoples](https://musicbrainz.-
org/search?query=8bitpeoples&type=release&limit=25&method=indexed)
collective and I thought it would be neater if I could group all of them
releases under a main directory, ```8/8bitpeoples```.

Turns out it's way easier than I thought, because we can use custom path
setups like so:

```
paths:
  label:8bitpeoples: 8/8bitpeoples/%title{$albumartist} %if{$hasyear,│${year}│} %title{$album} [$alb_type$media_type$format]/${padded_tracknr} %title{$title}
```

Which puts all releases from the 8bitpeoples record label inside the
main 8bitpeoples directory, while still keeping the individual
artist names.

```
$ beet move '8bitpeoples'

/mnt/music8/+TAGGED/Y/Yuppster/Yuppster │1999│ The Okinawa Campaign 1 [WEB, MP3]/10 Boomstick.mp3
  -> /mnt/music8/+TAGGED/8/8bitpeoples/Yuppster │1999│ The Okinawa Campaign 1 [WEB, MP3]/10 Boomstick.mp3

```


Check ```beet fields``` for all the available fields you can use in a
setup like this.
