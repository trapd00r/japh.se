---
layout: post
title: "the quest for the element"
date: 2010-06-30
author: "Magnus Woldrich"
tags: perl
---

Scenario: You have this data structure X, and need to know if string Y might be
hiding in there somewhere.

This happens all the time, and is probably what you will keep on repeating over
and over again, for different purposes.

Let's take a look at how we can do this in some interesting ways.

**There Is More Than One Way To Do It**

If you simply need to know if an element exists, you can use the smart-match
operator introduced in Perl 5.10:

{%highlight perl%}
my @array = qw(foo bar baz);
print 1 if 'bar' ~~ @c;
{%endhighlight%}

If you need to grab the first element that matches evaluated pattern, you can
use the 'first' function from the core List::Util module:

{%highlight perl%}
use List::Util 'first';
my @array = qw(foo bar baz);
print first{m/ba./} @array; # will print 'bar'
{%endhighlight%}

You are not limited to regular expressions, either:

{%highlight perl%}
use Data::Dumper;
use List::Util 'first';
my @array = (undef, 'foo', undef, 'bar');
print Dumper first{!defined($_)}; # $VAR1 = undef;
print Dumper first{defined($_)};  # $VAR1 = 'foo';

my @ints = (0..15);
print first{$_ > 10} @ints; # 11
{%endhighlight%}

The first function works on hashes as well, and maybe it's *first* here were we'll
see how useful it can be. 

Instead of manually looping through the hash if you're interested in the key for
a specific value, you can do it like this:

{%highlight perl%}
use List::Util 'first';
my %hash = (
  foo  => 'bar',
  perl => 'awesome',
);

# print the first key that responds to the value of 'awesome'
print first{$hash{$_} eq 'awesome'} @hash; # prints 'perl'
# print the first key which length is more or equal to four
print first{length($hash{$_}) >= 4} %hash; # prints 'perl'
{%endhighlight%}


So the **first** function is pretty useful, but it wont do any good if we're
interested in several values. Here is where **grep** comes in to play.

Those that are familiar with the **grep** command from Gnu/Linux and UNIX
environments  are probably using it everyday, and for good reason.

**grep()** in Perl is not the same, but similar in spirit. Let's take a look:

{%highlight perl%}
my @numbers = (0..15);
print "$_\n" for(grep($_ > 5, @numbers)); # prints 6..15

my @shuffled = qw(4 foo 593 bar 22);
# Grab the numbers
print "$_\n" for(grep{/\d+/} @shuffled;   # prints 4, 593, 22
{%endhighlight%}

*Sidenote*: \d matches a single character that's considered to be a digit.
Digits are not necessarily 0-9 - it depends on the encoding of the source string
and the LOCALE that's in effect. It'll happily match indian devanagardi numerals
as well; therefore it might be a good idea to use [0-9] if you suspect that you
might deal with more exotic things.






