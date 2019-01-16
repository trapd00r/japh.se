---
layout: post
title: "automatically fetch lyrics with mpd"
date: 2019-01-16
author: "Magnus Woldrich"
tags: lyrics, mpd, music, ncmpcpp
---

I have a decently sized music collection and I use mpd and
[pimpd2](https://github.com/trapd00r/pimpd2) to enjoy it. I rarely use ncmpcpp
myself, but I've found a very good use for it.

Autostart it when you start your screen session and forget about it:

**.screenrc**:
{%highlight bash%}

screen -t nc ncmpcpp
{%endhighlight%}

**$XDG\_CONFIG\_HOME/ncmpcpp/config**:
{%highlight bash%}
lyrics_directory                            = ~/dev/lyrics/
follow_now_playing_lyrics                   = yes
store_lyrics_in_song_dir                    = no
fetch_lyrics_for_current_song_in_background = yes
{%endhighlight%}

Now, whenever a song change occurs in mpd, the lyrics is automatically fetched
in the background.

Now we want a way to store the ever-expanding collection of lyrics and always
keep it up to date. It's all textual data so obviously we use git.

**lyrics\_update**:
{%highlight bash%}
#!/bin/sh
cd $HOME/dev/lyrics             &&
  git add .                     &&
  git commit -m 'update lyrics' && git push
{%endhighlight%}

and we stuff that in a crontab:

{%highlight bash%}
0 * * * * sh /home/scp1/dev/utils/lyrics_update
{%endhighlight%}

The update script will run once every hour.

As of this writing, I've collected a total of **510654** lines of lyrics and
they can be digested [here](https://github.com/trapd00r/lyrics).
