---
layout: default
permalink: /dev/ls++/
title: "ls++ - colorized ls on steroids"
author: Magnus Woldrich
---


ls++ - colorized ls on steroids
-------------------------------

![ls++ screenshot](/assets/ls++.png)

ls++ is what GNU/BSD ls would look like with extensive makeup applied.

     OPTIONS
        Views
           --pf    permissions, file
           --psf   permissions, size, file
           --ptsf  permissions, time, size, file
           --potsf permissions, owner, time, size, file

     Documentation
        --help  show the help and exit
        --man   show the manpage and exit

Not known parameters will be passed through to ls, so to show hidden
files, "-a" or "-A" might be added. See ls(1) for more information.


History
-------

I wanted to re-arrange the ls output just like one can do with the
-printf option to GNU find. Sadly, there are no -printf option available
for ls, so I threw together a quick hack called 'pilsner' that did what
I wanted and nothing more, nothing less. Not very useful to others.

Mattias Svanström crafted together the 'l' application which did basicly
the same thing but more elegant and with a nice twist; it calculated
relative mtimes.

I really liked that idea, but there were a couple of annoyances, so I
forked the project and added a configuration file, support for flags
that'll control the different views and possiblity to ignore certain
files amongst other things.


Contributors
------------
The relative time calculations is made by Mattias Svanström.

crshd added optional user:group display.

See also
--------

[ls++ on git](https://github.com/trapd00r/ls--)

[l](http://github.com7mmso/scripts)

[Term::ExtendedColor](/dev/term-extendedcolor)


