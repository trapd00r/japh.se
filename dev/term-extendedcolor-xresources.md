---
layout: default
permalink: /dev/term-extendedcolor-xresources/
title: "Term::ExtendedColor::Xresources - Query and set various X resources"
author: Magnus Woldrich
---

Term::ExtendedColor::Xresources provides functions for changing and
querying the underlying X terminal emulator for various X resources.


{%highlight perl%}
use Term::ExtendedColor::Xresources qw(
  get_xterm_color
  set_xterm_color
  set_foreground_color
  set_background_color
);

# make color index 220 represent red instead of yellow
set_xterm_color({ 220 => 'ff0000'});

# get RGB values for all defined colors
my $colors = get_xterm_color({
  index => [0 .. 255], # default
  type  => 'hex',      # default is base 10
});

# change the background color to red...
set_background_color('ff0000');

# .. and the foreground color to yellow
set_foreground_color('ffff00');
{%endhighlight%}


SEE ALSO
-------
[Term::ExtendedColor](/dev/term-extendedcolor/)

AUTHOR
------
    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se
