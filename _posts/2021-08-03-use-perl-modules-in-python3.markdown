---
layout: post
title: use perl modules in python3
date: 2021-08-03
author: "Magnus Woldrich"
tags: perl, python
---

Imagine this:

You're a seasoned perl veteran that for one reason or another needs to
write some python. You're not very good at it, though you're enjoying it
more than what you initially thought. Some things in python are easier,
some things are harder, and many things are just different.

You've done a fair amount of work on your perl modules over at [metacpan](https://metacpan.org/author/WOLDRICH),
and you **use** functionality imported from them in many new projects.

While learning the language by writing [plugins](https://github.com/trapd00r/beets-tcp) for
[beets](https://github.com/beetbox/beets/), you stumble upon a whole
bunch of open issues on that project regarding [UI
overhaul](https://github.com/beetbox/beets/issues/1593).

During long music import sessions there's so much info spewed out in the
terminal; it would really help with a sprinkle of color and
reformatting. 

I've written [quite](https://metacpan.org/pod/Term::ExtendedColor) a
[few](https://metacpan.org/pod/Term::ExtendedColor::Xresources) perl
modules [dealing with colors](https://metacpan.org/pod/File::LsColor) in
different ways and I know all there is to know about escape sequences,
terminal emulators and various quirks.

A first step to add some color to the beets import process could be to
color the imported filenames according to the users
[LS_COLORS](https://github.com/trapd00r/LS_COLORS) environment variable.
That would add familiarity and remove the need to watch out for file
extensions in the long outputs beets produces.

I've seen my [File::LsColor](https://metacpan.org/pod/File::LsColor)
project cloned in a variety of languages such as
[rust](https://github.com/sharkdp/lscolors) and ruby, so I went over to [pypi](https://pypi.org/search/?q=ls+colors) for something
similar.

**There's no such thing.**

Well. I could rewrite File::LsColor in python3 myself, but that's not
what I wanted to spend time on **right now**.
### What if I could mix perl and python...

Now, there's all kinds of
[Inline::](https://metacpan.org/search?size=20&q=inline%3A%3A) modules
on cpan that gives the ability to write perl subroutines in
another language, such as [C](https://metacpan.org/dist/Inline-C/view/lib/Inline/C.pod) or [python](https://metacpan.org/dist/Inline-Python/view/Python.pod).
But what about writing **python functions in perl**? 

There's a [note](https://metacpan.org/dist/Inline-Python/view/Python.pod#Using-
Perl-inside-Python-(inside-Perl)) in Inline::Python but to me, it's not
very clear whether this actually works…

However; there is a thing called [pyperl/perlmodule](https://github.com-
/shlomif/pyperl/blob/master/perlmodule.pod) that was originally created
by ActiveState in the early 2000's. There's loads of (mis)information
regarding it not functioning with python3, but let's try it out.

**Install the pyperl package:**
```bash
$ cpan pyperl
```

Start by importing the perl module, here aptly named japh.
Let's also grab some arguments from python:
```python
import perl as japh
import sys

filenames = sys.argv
```

Create a perl subroutine using **perl.eval()**. For a return to work
properly, you need to omit the actual return.

```python
basename_and_colorize = japh.eval("""
  sub {
    use File::Basename;
    use File::LsColor qw(ls_color);

    my $file = shift;
    ls_color(basename($file));
  }
""")
```

Use python to iterate over the given argments, and for each argument,
call the perl subroutine using **perl.call()**, and store it in a
python variable.

```python
for f in filenames:
  base = japh.call(basename_and_colorize, f)
  print(base)
```

![perlinpython](/assets/perlinpython3.png)

Well, look at that!

Now, I guess I must say one shouldn't be doing this in production,
yadda, yadda, but remember, the question shouldn't be _why_, but
always _how_. If nothing else, this could enable faster proofs of concepts.

Here's a [link](https://github.com/trapd00r/perlinpython3) to the example code repository.
