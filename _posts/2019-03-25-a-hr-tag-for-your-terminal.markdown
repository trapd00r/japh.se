---
layout: post
title: a <hr> tag for your terminal
date: 2019-03-25
author: "Magnus Woldrich"
tags: perl, terminal
---

At times when living my life in the terminal I run many commands in
quick succession that might produce a lot of output. Differencing where
the output actually comes from can be tiresome. Previously I've done
simple things like

{%highlight bash%}
command1; echo --; command2
{%endhighlight%}

but it's not exactly visually striking, is it?

So I crafted a little tool that solves this problem in a better way, and
it tries to be smart about it, too. By default, we try to determine the
size of the terminal window to make sure the hr spans across nicely.
The size of the bar can be configurable; maybe you don't want the bar to span the entire terminal:

{%highlight bash%}
hr -s 10
{%endhighlight%}

or maybe you want it to span the entire window, but you'd like some padding:

{%highlight bash%}
hr --pre 10
{%endhighlight%}

wouldn't it be nice to have padding on both sides, though?

{%highlight bash%}
hr --pre 10 --post 10
{%endhighlight%}

We can add a bit of color to it as well, to make it stand out more from the rest of the data on screen:

{%highlight bash%}
hr --pre 10 --post 10 -fg 196
{%endhighlight%}

and of course the actual character that's used to create the bar is configurable:

{%highlight bash%}

hr --pre 10 --post 10 -fg 196 -c #

{%endhighlight%}

[hr](https://github.com/trapd00r/hr) supports foreground and background colors, as well as all attributes available in [Term::ExtendedColor](https://metacpan.org/pod/Term::ExtendedColor) (well, except blink...).




Here's a screenshot of what it can look like in a chain of commands (more screenshots in the examples section, below):

![img](/assets/hr.png)


# Options

    -c,    --char       Character to use
    -s,    --size       Number of columns
    -pre,  --pre        Pad the left side with whitespace n
    -post, --post       Pad the right side with whitespace n
    -fg,   --fg         Foreground color to use, int 0-255
    -bg,   --bg         Background color to use, int 0-255
    -b,    --bold       Use bold
    -i,    --italic     Use italics
    -u,    --underline  Use underline
    -r,    --reverse    Use reverse video

    -h,    --help       Display this help and exit
    -m,    --man        Display the manual and exit
    -v,    --version    Display version info and exit

# Examples

Due to the configurability of hr, differencing different hr invocations
from each other is no problem.

{%highlight bash%}
    # display a yellow underlined bar using the default '=' character
    hr -fg 220 --underline
{%endhighlight%}

![example01.png](/assets/example01.png)


{%highlight bash%}
    # display a red solid bar padded by 10 columns from right and left
    hr -fg 160 -c ▀ --pre 10 --post 10
{%endhighlight%}

![example02.png](/assets/example02.png)

{%highlight bash%}
    # display a solid grey, thick bar using ascii character _ and the bold,
    # underline and reverse video attributes

    hr -fg 240 -c_ -bur
{%endhighlight%}

![example03.png](/assets/example03.png)

{%highlight bash%}
    # display a bar made of dots, with 5 column spacing one each size
    # and 20 columns wide.

    hr -fg 197 -c· -pre 5 -post 5 -size 20
{%endhighlight%}

![example04.png](/assets/example04.png)

{%highlight bash%}
    # use all options at once, because why not?
    hr -c ! -fg 52 -bg 196 -biur -s 70 -pre 5 -post 5
{%endhighlight%}

![example05.png](/assets/example05.png)

**Bonus**: advanced example using arithmetics, because math is hard.
{%highlight bash%}
    # use several characters to form a bar using arithmetics
    hr -c "  japh  " -fg 1 -bg 0 -b -s $(($COLUMNS / 8))
{%endhighlight%}

![example06.png](/assets/example06.png)

# LINKS

hr is available on [github](https://github.com/trapd00r/hr) as well as
on the [cpan](https://metacpan.org/pod/App::term::hr), of course.

