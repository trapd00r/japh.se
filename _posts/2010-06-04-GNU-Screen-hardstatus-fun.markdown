---
layout: post
title: "gnu screen hardstatus fun"
date: 2010-06-04
tags: linux, cli, shell, screen
---

Today I decided to revisit the wonderful world of GNU Screen
hardstatus syntax.

The ones that I've used for a year or so wasn't ultimate since I cheated
quite a bit by changing the Xresources colors to match my screen
settings. Yesterday I hacked a bit on <a
href="http://github.com/trapd00r/utils/blob/master/scat">a cat with
syntax highlighting powers</a> and wasn't very happy with keyword and
function names in black and darkgrey colors - thanks to me cheating with
the Xresources color mappings as well.


Anyway, here's the results. Prepend for example <strong>hardstatus alwayslastline</strong>.

<img src="http://i.japh.se/gnuscreen.png">
<pre name="code" class="terminal"> "%?%{gk}%-Lw%?%{mk}%n*%f %t%?(%u)%?%?%{gk}%+Lw%?%{Yk} | %{yk}RPD: %{Bk}%1`" </pre>
<img src="http://i.japh.se/gnuscreen2.png">
<pre name="code" class="terminal">'%{= M} %H%{= B} %l %= %{= w}%-w%{+b r}%n*%t%{-b r}%{w}%+w %= %{c}%d %D %{B}%c '</pre>
<img src="http://i.japh.se/gnuscreen3.png">
<pre name="code" class="terminal">"%?%{rk}%-Lw%?%{Ck}%n*%f %t%?(%u)%?%?%{rk}% +Lw%?%{Yk} | %{mk}%1` %{yk}%=%2`"</pre>
