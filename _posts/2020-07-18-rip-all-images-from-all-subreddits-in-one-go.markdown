---
layout: post
title: rip all images from all subreddits in one go
date: 2020-07-18
author: "Magnus Woldrich"
tags: reddit, linux
---

Have you ever wanted to download all the high resolution images in a
particular subreddit, or perhaps from all the subreddits in a particular
category? Turns out, it's easier than one would imagine, using standard
Linux tools.

**Prerequisites**

- A list of subreddits to download images (or other data) from.
We can work with some wallpaper subreddits for this example:

subreddits.txt:
```
wallpapers
wallpaper
Offensive_Wallpapers
```

I've tried this approach on a category consisting of 350+ subreddits,
and ran into zero issues.

- This [reddit-dl](https://github.com/trapd00r/utils/blob/master/reddit-dl) script by Nicola.

- The command-line JSON processor jq.

- A loop.


```
for x in $(/bin/cat subreddits.txt); do mkdir -p ~/wallpapers/$x; cd ~/wallpapers/$x && reddit-dl $x; done
```

It's quite fast as well, and soon your directory structure will look like this:

```
3.7G	.
2.1G	./wallpapers
1.2G	./wallpaper
424M	./Offensive_Wallpapers
```

That's **1714** high resolution wallpapers downloaded in a few minutes.
