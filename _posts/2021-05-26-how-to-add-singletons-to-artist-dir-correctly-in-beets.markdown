---
layout: post
title: how to add singletons to artist directory correctly in beets
date: 2021-05-26
author: "Magnus Woldrich"
tags: linux, beets, music
---

Here's how to properly add singletons to the correct artist dir using
the quick import functionality in beets. We don't care for tagging or
musicbrainz lookups for these, we just want to add them to the beets
database and move them to to corresponding directory.

Add this to config.yml:


{% highlight yaml %}
{% raw %}
plugins: ['fromfilename']

extrafiles:
  patterns:
    single_tracks:
      - '+tracks/'
  paths:
    single_tracks: $artist/+tracks

paths:
  singleton: %upper{%left{$artist,1}}/$artist/+tracks/$artist - $title
{% endraw %}
{% endhighlight %}


When we import single tracks to beets we don't use the autotagger, so
it's important that the artist field is populated in the files, or else
beets doesn't know where to put the files. To quickly add the artist
field on a bunch of files, we can utilize [id3shit](https://github.com/trapd00r/id3shit):

`id3shit -w artist 'Anna Ternheim' *`

*Edit 2021-05-28*:
We can also use beets directly like this:

`beet import --set artist=Anna\ Ternheim`

The import command to beets for single tracks is `beet import -sA "$@"`.
I find it hard to remember all the commands so I saved it as `beet-import-tracks`.

Use it like this:

`beet-import-tracks *(.) # import every file in cwd`

Now, since we made sure that the artist field was populated prior to
running the import command, we can find the imported singletons at
`A/Anna Ternheim/+tracks/`.

My current beets configuration can be found [here](https://github.com/trapd00r/configs/blob/master/beets/config.yaml).

