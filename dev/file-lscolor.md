---
layout: default
permalink: /dev/file-lscolor
title: "File::LsColor - colorize input filenames like ls(1)"
author: Magnus Woldrich
---

# NAME

File::LsColor - Colorize input filenames just like ls does

# SYNOPSIS

{%highlight perl%}
use File::LsColor qw(:all);
# Is equal to:
use File::LsColor qw(
  ls_color
  ls_color_custom
  ls_color_default
  ls_color_internal
);

my @files = glob("$ENV{HOME}/*");

print ls_color($_), "\n" for(@files);

# or specify own pattern

@files = ls_color_custom('*.pl=38;5;196;1:*.pm=38;5;220', @files);

# or use the internal mappings

@files = ls_color_internal(@files);

# or use the defaults (only ANSI colors)

@files = ls_color_default(@files);

{%endhighlight%}

# DESCRIPTION

This module provides functionality for using the LS\_COLORS variable for
colorizing output in a way that's immediately recognized.

Say that you have a list of filenames that's the result of some complex
operation, and you wish to present the result to the user.

If said files have an extension and that extension is present in the users
LS\_COLORS variable, they will be colored just like they would have been if the
filenames were output from [ls(1)](http://man.he.net/man1/ls) or [tree(1)](http://man.he.net/man1/tree).

# EXPORTS

None by default.

# FUNCTIONS

## ls\_color()

Arguments: @files | \\@files

Returns:   $files | @files

Returns a list of filenames colored as specified by the environment `LS_COLORS`
variable. If the `LS_COLORS` variable is not set, throws an exception.
In this case, `ls_color_internal()` can be used.

In scalar context a string joined by '' is returned.

## ls\_color\_default()

The same thing as `ls_color()`, but uses the default LS\_COLORS values from GNU
ls. Those are only ANSI colors.

## ls\_color\_internal()

The same as `ls_color()`, with one minor difference; Instead of using the
LS\_COLORS variable from the environment, an internal specification is used.
This specification contains about 250 extensions as of this writing.

## ls\_color\_custom()

The first argument to `ls_color_custom()` should be a valid LS\_COLORS
definition, like so:

    ls_color_custom("*.pl=38;5;196:*.pm=38;5;197;1", @perl_files);

## get\_ls\_colors()

Returns a hash reference where a key is the extension and its value is the
attributes attached to it.

# AUTHOR

    Magnus Woldrich
    CPAN ID: WOLDRICH
    m@japh.se
    http://japh.se

# REPORTING BUGS

Report bugs on rt.cpan.org or to m@japh.se

# CONTRIBUTORS

None required yet.

# COPYRIGHT

Copyright 2011, 2018 the **File::LsColor** ["AUTHOR"](#author) and
["CONTRIBUTORS"](#contributors) as listed above.

# LICENSE

This library is free software; you may redistribute it and/or modify it under
the same terms as Perl itself.
