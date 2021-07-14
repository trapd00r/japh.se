---
layout: post
title: a better titlecase function for beets
date: 2021-07-14 06:48:08
author: "Magnus Woldrich"
tags: linux, beets, music
---

The builtin template function `%title{}` in beets has a number of
issues. It tries to titlecase whatever the first character in the given
string is, rendering results like this:

`
It's Raining Men (instrumental Version).flac
`

It's using `str.capwords` under the hood:

> string.capwords(s, sep=None)
> Split the argument into words using str.split(), capitalize each word
> using str.capitalize(), and join the capitalized words using str.join().

Let's try to use `str.title` instead:

`
It'S Raining Men (Instrumental Version).flac
`

That's even worse.

I found the [titlecase](https://pypi.org/project/titlecase/) python
package that's a conversion of the excellent perl script
[TitleCase.pl](https://gist.github.com/gruber/9f9e8650d68b13ce4d78).

Not only does it solve the issues mentioned above, it's also clever
about various corner cases, it does **not** titlecase small words like
'a', 'and', 'for' and so on as outlined in _The New York Times Manual of Style_.

I packaged this up in a simple beets plugin: [beets-titlecase_proper](https://github.com/trapd00r/beets-
titlecase_proper).

But there's more!

Sometimes there are acronyms that we do *not* want titlecased for one
reason or another. You can add those words to **~/beets.titlecase** and
they will always be returned as-is. Check this out:

```bash
$ cd "Dj Tcp the Reckless │2021│ So Much Drama in the Phd [CDR, MP3]"
$ for w in TCP DJ PhD; do echo $w; done >> ~/.beets_titlecase
$ beet import .
$ beet ls -a 'so much drama' -f \$path
DJ TCP the Reckless │2021│ So Much Drama in the PhD [CDR, MP3]
```

Much cleaner, eh?

[The post that started it all](https://github.com/beetbox/beets/discussions/3998)

[Announcement on beets/discussions](https://github.com/beetbox/beets/discussions/4007)

[Here's](https://github.com/trapd00r/configs/blob/master/beets/config.yaml) my beets configuration.
