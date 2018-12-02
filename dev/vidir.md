---
layout: default
permalink: /dev/vidir/
title: "vidir - file management using the power of vim in vim"
author: "Magnus Woldrich"
---


# NAME

vidir - edit directory

# SYNOPSIS

**vidir** \[--verbose\] \[directory|file|-\] ...

# DESCRIPTION

vidir allows editing of the contents of a directory in a text editor. If no
directory is specified, the current directory is edited.

When editing a directory, each item in the directory will appear on its own
numbered line. These numbers are how vidir keeps track of what items are
changed. Delete lines to remove files from the directory, or
edit filenames to rename files. You can also switch pairs of numbers to
swap filenames.

Note that if "-" is specified as the directory to edit, it reads a list of
filenames from stdin and displays those for editing. Alternatively, a list
of files can be specified on the command line.

# OPTIONS

- -v, --verbose

    Verbosely display the actions taken by the program.

# EXAMPLES

- vidir
- vidir \*.jpeg

    Typical uses.

- find | vidir -

    Edit subdirectory contents too. To delete subdirectories,
    delete all their contents and the subdirectory itself in the editor.

- find -type f | vidir -

    Edit all files under the current directory and subdirectories.

# ENVIRONMENT VARIABLES

- EDITOR

    Editor to use.

- VISUAL

    Also supported to determine what editor to use.

- VIDIR\_EDITOR\_ARGS

    Optional args for editor

# AUTHOR

Joey Hess <joey@kitenet.net> 2006-2010

Modifications by Magnus Woldrich  <m@japh.se> 2011

# COPYRIGHT

Copyright 2006-2011 the **vidir** ["AUTHOR"](#author)s as listed above.

Licensed under the GNU GPL.
