---
layout: post
title: special rule for live performances in beets
date: 2021-06-01
author: "Magnus Woldrich"
tags: linux, beets, music
---


Special rule for live performances in beets
----

I like to have the live performances by an artist somewhere else but
directly in the artist root directory, yet still nearby. I create a
label simply called `live` like this:


{% highlight yaml %}
{% raw %}
paths:
      label:live: %upper{%left{$albumartist,1}}/%title{$first_artist}/+live/%title{$albumartist}%if{$hasyear, │${year}│} %title{$album} [$alb_type$media_type$format]/${padded_tracknr} %title{$title}
      default:    %upper{%left{$albumartist,1}}/%title{$first_artist}/%title{$albumartist}%if{$hasyear, │${year}│} %title{$album} [$alb_type$media_type$format]/${padded_tracknr} %title{$title}
{% endraw %}
{% endhighlight %}

Now, whenever I specify the `live` label, the imported albums is moved
to +live/ in the artist root directory:

```
% tree -d
.
├── +live
│   ├── Melanie C │1999│ Live In Madrid 1999 [MP3]
│   ├── Melanie C │2000│ Live In Stockholm, Sweden 20-10-2000 Fm Broadcast [MP3]
│   ├── Melanie C │2006│ Live Hits [MP3]
│   ├── Melanie C │2007│ Live At The Mint 06-12-2007 [MP3]
│   └── Melanie C │2008│ Live At The Manhattan Center Ballroom, Nyc 09-02-2008 [MP3]
├── Melanie C │1999│ Northern Star [Single, CD, MP3]
├── Melanie C │2000│ I Turn To You [Single, CD, FLAC]
├── Melanie C │2000│ Never Be The Same Again [Single, CD, MP3]
├── Melanie C │2000│ Northern Star [CD, FLAC]
├── Melanie C │2000│ Northern Star [CD, MP3]
├── Melanie C │2003│ Reason [CD, MP3]
├── Melanie C │2005│ Beautiful Intentions [CD, FLAC]
├── Melanie C │2006│ Beautiful Intentions (new Version) [MP3]
├── Melanie C │2007│ This Time [CD, FLAC]
├── Melanie C │2011│ The Sea [CD, MP3]
└── Melanie C │2016│ Version Of Me [WEB, FLAC]
```

I import like this:

```
beet import --set label=live .
```

[Here's](https://github.com/trapd00r/configs/blob/master/beets/config.yaml) my beets configuration.
