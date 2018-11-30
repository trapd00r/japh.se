---
layout: post
title: "use vim to cat files in style"
date: 2018-11-27
author: "Magnus Woldrich"
tags: vim, linux, cli
---

When I cat, chances are I cat code.

Even though the cat command is primarily meant to be used for
concatenation of files, people use it to quickly show the content
of a file, and so do I.

Wouldn't it be nice if you could get some kind of syntax highlighting
when you cat code? There is a few ways to achieve this, like using the
python library [pygments](http://pygments.org) or the [Syntax::Highlight::Engine::](https://metacpan.org/search?size=20&q=syntax%3A%3AHighligh-
t%3A%3Aengine) family of modules available on cpan. Back in the day I
wrote [skate](https://github.com/trapd00r/skate) that used the ::Kate
submodule which exposes syntax highlighting rules from the Kate editor.

Not what I **really** wanted, though...

# vimcat

Vim has an amazing syntax highlighting engine that offers unlimited
configurability. We can fully utilize it and all its features straight
in the terminal:

![image](/assets/vimcat.gif)

vimcat uses the AnsiHighlight vim plugin by Matthew Wozniski to do its
magic. No need to install anything extra, the plugin is inlined in the
bash script to do its magic.

**Pros**:

* The code is presented exactly as it is when you view it inside Vim as usual.
* Since it's vim, file type detection doesn't need any pesky file extension:
{% highlight bash %}
# vim:ft=sh:
# ^ top of the file
{% endhighlight %}
* You can easily configure it with any additional options you would like to have only when catting.
Maybe you want linenumbers to show, or you would prefer a different
background color? You could make an entirely different vimrc just
for vimcat.

**Cons**:

* It can be a little bit slow on very large files; but then again, why
  would you cat these in the first place?


[grab vimcat](https://github.com/trapd00r/vimcat)
