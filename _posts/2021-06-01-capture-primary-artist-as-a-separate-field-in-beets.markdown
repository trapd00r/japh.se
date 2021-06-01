---
layout: post
title: capture primary artist as a separate field in beets
date: 2021-06-01
author: "Magnus Woldrich"
tags: linux, beets, music
---

Ever since I started using beets I've struggled with the fact that it
creates directories based on the entire artist/albumartist tag when
there's more than one artist specified. This means my filesystem looked
like this:

![britney](/assets/britney.png)

Not desirable. I thought the [ftintitle](https://beets.readthedocs.io/e-
n/stable/plugins/ftintitle.html) plugin would help me sort this out, but
it only does what I expect for single tracks.

I tried a solution as outlined in [this](https://github.com/beetbox/beets/issues/3176#issuecomment-
632227610) github issue, but it only catches the cases where the
different artists is separated by a comma:

{% highlight yaml %}
{% raw %}
item_fields:
  first_artist: albumartist.split(', ',1)[0:1][0]
{% endraw %}
{% endhighlight %}

So, time to learn some python! Turns out there's a very handy
`re.split()` method available, so here's what I came up with:

{% highlight yaml %}
{% raw %}
item_fields:
  first_artist: |
    import re
    return re.split(',|\s+(feat(.?|uring)|&|(Vs|Ft).)', albumartist, 1, flags=re.IGNORECASE)[0]
{% endraw %}
{% endhighlight %}

This can handle not only comma delimiters, but also:

- Artist,
- Artist &
- Artist feat
- Artist feat.
- Artist featuring
- Artist ft.
- Artist vs
- Artist vs.
- Artist &

It **will** screw up things like Earth, Wind & Fire, but that's not a
major issue.

The idea is to use `$first_artist` in the beginning of the path
format like so:

```
%title{$first_artist}/%title{$albumartist}
```

which will put `Jennifer Lopez feat. Pitbull` inside the main Jennifer
Lopez directory, but still keep the feat. part in the directory name
inside it. If you don't want that, use `$first_artist` everywhere.

```
$ beet move artist:feat jennifer\ lopez

J/Jennifer Lopez Feat. Pitbull/Jennifer Lopez Feat. Pitbull │2012│ Dance Again [Single, WEB, MP3]/01 Dance Again.mp3
-> J/Jennifer Lopez/Jennifer Lopez Feat. Pitbull │2012│ Dance Again [Single, WEB, MP3]/01 Dance Again.mp3
```

If I were to use `$first_artist` instead of `$albumartist` all the way, I would end up with

```
J/Jennifer Lopez Feat. Pitbull/Jennifer Lopez Feat. Pitbull │2012│ Dance Again [Single, WEB, MP3]/01 Dance Again.mp3
-> J/Jennifer Lopez/Jennifer Lopez │2012│ Dance Again [Single, WEB, MP3]/01 Dance Again.mp3
```

I haven't decided yet which one I prefer, but I know that I'm very happy
not clobbering my directories with a ton of 'X feat Y' entries.

This is how I use it:

{% highlight yaml %}
{% raw %}
%upper{%left{$albumartist,1}}/%title{$first_artist}/%title{$albumartist}%if{$hasyear, │${year}│} %title{$album} [$alb_type$media_type$format]/${padded_tracknr} %title{$title}
{% endraw %}
{% endhighlight %}

[Here's](https://github.com/trapd00r/configs/blob/master/beets/config.yaml) my beets configuration.
