---
layout: post
title: jump to function definitions in vim
date: 2022-05-21
author: "Magnus Woldrich"
tags: perl, vim, tags
---

I've been looking for a solution to simply jump to where a function is defined
for some time. There's all sorts of ways that doesn't work well for the gigantic
perl codebase I'm working with.

I've known about tags and ctags all this time, but I thought it would involve
a ton of configuration and maintenance to get it functional.

Turns out, I was wrong.

This is all there is to get perl tags and vim working together.

First, tell vim where to look for a tag file. This can be adjusted in an
autocommand for a flexible tag setup depending on project location.

```vim
set tags=./tags,tags,~/dev/tags,~/dev/askas/utils-askas/vim/tags
```

Next we need to generate the tags, and ctags is really fast:

```
2116 files, 1433894 lines (43984 kB) scanned in 0.7 seconds (64208 kB/s)
36621 tags added to tag file
36621 tags sorted in 0.00 seconds
```

```shell
#!/bin/sh
ctags -f ~/dev/tags --recurse --totals \
  --exclude=blib --exclude=.svn  --exclude=CLEAN             \
  --exclude=.git --exclude='*~'                              \
  --extras=q                                                 \
  --languages=Perl,Vim                                       \
  --langmap=Perl:+.t                                         \
  ~/dev/
```

Since I'll be doing this a lot, I'm mapping keys to go to tag definition and
back to where I was prior to jumping like this:

```vim
nnoremap <backspace> <C-]>
nnoremap <tab>       <C-T>
```

Now, we can use tags for much more than this and I'll be exploring this in the
next couple of weeks.
