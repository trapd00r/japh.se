---
layout: post
title: "archlinux and perl, take two"
date: 2011-02-05
author: "Magnus Woldrich"
tags: linux, archlinux, perl
---

Today I had <a href="
http://aur.archlinux.org/packages.php?ID=39032">another user</a>
reporting issues where my packages wouldn't install the executables
somewhere in the users $PATH. I've written about this issue before,
and I've also created a ticket on the bug tracker, along with a
possible solution.


I haven't heard anything from the guys responsible yet, but things have
changed, yet again. This is how the
<strong>/etc/profile.d/perlbin.sh</strong> script looks now:


{%highlight bash%}

# Set path to perl scriptdirs if they exist
# https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_Scripts
# Added /usr/bin/*_perl dirs for scripts
# Remove /usr/lib/perl5/*_perl/bin in next release

[ -d /usr/bin/site_perl ] &&
    PATH=$PATH:/usr/bin/site_perl
[ -d /usr/lib/perl5/site_perl/bin ] &&
    PATH=$PATH:/usr/lib/perl5/site_perl/bin

[ -d /usr/bin/vendor_perl ] &&
    PATH=$PATH:/usr/bin/vendor_perl
[ -d /usr/lib/perl5/vendor_perl/bin ] &&
    PATH=$PATH:/usr/lib/perl5/vendor_perl/bin

[ -d /usr/bin/core_perl ] &&
    PATH=$PATH:/usr/bin/core_perl

export PATH

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2

{%endhighlight%}

So to make things clear; the paths went from (the working)
<i>/usr/bin/perlbin</i> to <i>/usr/lib/perl5/vendor_perl/bin</i> and
back to <i>/usr/bin/perlbin</i>. Keep in mind that this script still
fails for a lot of people <strong>since the directories DOES NOT
EXIST</strong>. The conversation that led up to this can be read <a
href="https://bugs.archlinux.org/task/13808">in this bug report</a>.

A 'solution', as pointed out in the bug report for the
<strong>pickyfont</strong> package, would be to create a symlink from
/usr/bin/vendor_perl/pickyfont to /usr/bin/pickyfont. But this is not a
solution. A solution would be to replace this shitty non-working script
with my patched version that I provided in the bug report.

Having to provide support for issues that I can't do something about is
frustrating. That's why I wrote that other post. I'm so fed up with
packaging stuff for Archlinux, I'll most likely stop and direct users to
<a href="http://github.com/trapd00r">the git repository</a> or <a
href="http://search.cpan.org/~woldrich/">the CPAN</a>.

The PKGBUILD system sure is nice and easy and fluffy and all that,
but it's even easier writing a simple Makefile and uploading the
stuff to CPAN.

But then again, if you use Archlinux, the executebles wont be found in your PATH...
