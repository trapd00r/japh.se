---
layout: post
title: "issues with cpan indexing"
date: 2018-12-17
author: "Magnus Woldrich"
tags: perl, cpan
---

While getting back to the wonderful world of perl I've been updating some of my
old distributions on cpan, and also adding new content. Some things seem to have
changed over the last few years, though, and I've had a number of issues getting
my distributions to actually index.

### Adding an App:: distribution on cpan

I discovered that a large number of App:: dists of mine were missing from the cpan, so
I started investigating. Here's what I've found:

#### (Meta)cpan won't index a distribution that doesn't have a package declaration.

Solution: Create a stub pm file:

    lib/App/Foo.pm

{%highlight perl%}

package App::Foo;

our $VERSION = '0.001';

1;

{%endhighlight%}

    bin/foo

{%highlight perl%}

use App::Foo;
...

{%endhighlight%}

**OR**

Add a provides field to the META file by adding this to Makefile.PL:

{%highlight perl%}

META_ADD => {
  provides => {
    'App::foo' => {
      file => 'bin/foo',
    },
  },
},

{%endhighlight%}


### Index failed: decreasing version number

* Make sure to NOT include any MYMETA.json or MYMETA.yml in your MANIFEST!

When you run

      perl Makefile.PL
      make
      makedist

META.json and META.yml files are generated for you, and added to the
distribution tarball.

* Make sure to declare your $VERSION like this:

our $VERSION = '0.020';

It's important to stringify your version number; if you represent it using a
floating point number, version number comparison can fail in various ways.

Also make sure that the declaration is on a single line.
