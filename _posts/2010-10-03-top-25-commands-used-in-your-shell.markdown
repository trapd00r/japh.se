---
layout: post
title: "top n commands used in your shell"
date: 2010-10-03
author: "Magnus Woldrich"
tags: linux, terminal, cli, bash, zsh
---

**Bash version for Bash**

{%highlight bash%}
history |
  awk '{print $2}'| 
  awk 'BEGIN {FS="|"} {print $1}' |
  sort | 
  uniq -c |
  sort -rn |
  head -25
{%endhighlight %}

**Bash version for Zsh**

{% highlight bash %}

\cat $HOME/.zsh-history |
  perl -pe 's/^: [0-9]+:[0-9]+;\s*//' |
  sort |
  uniq -c |
  sort -n -k1 |
  tail -25 |
  tac

{% endhighlight %}

**Perl version for Zsh**

{% highlight perl%}

#!/usr/bin/perl
use strict;

my $history = shift // "$ENV{HOME}/.zsh-history";
my $count   = shift // 25;

open(my $fh, '<', $history) or print STDERR "$!" and exit(1);
chomp(my @records = <$fh>);
close($fh);

my %commands = ();

for(@records) {
  s/^:\s+[0-9]+:[0-9]+;//;
  $commands{$_}++;
}

for(sort { $commands{$b} <=> $commands{$a} } keys(%commands)) {
  if($count == 0) {
    exit(0);
  }
  printf("% 4d => %s\n", $commands{$_}, $_);
  $count--;
}

{%endhighlight%}

**Example output**

{%highlight bash%}

 641 => :q
 314 => ls
 107 => scx
  84 => getmail
  83 => colorcoke --random -s 0 -e 15 && showcolors
  82 => p
  73 => clear
  72 => cc256
  72 => su
  56 => u
  54 => d
  53 => dvdc
  50 => t
  49 => perl pwc.pl
  49 => ..
  42 => top20
  37 => perl gitupd.pl /home/scp1/Git
  37 => lxappearance
  35 => pdf
  33 => perl pimpd -sh
  33 => c256
  31 => perl pimpd -cpl
  30 => jekyll --server
  30 => vim pimpd
  29 => perl gitupd.pl /home/scp1/Git/
{%endhighlight%}
