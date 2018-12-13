---
layout: post
title: "make perl distribution making automatic"
date: 2018-12-13
author: "Magnus Woldrich"
tags: perl, cpan
---



Making a cpan distribution isn't hard, but I've noticed that I sometimes
hesitate;

* What files should go in the tarball and what files do I leave out?

During development, it's not unusual for a bunch of temp files to reside in the
current working directory. Short temp scripts to test functionality, old build
files and maybe a README that's aimed for i.e github and not for distribution.
Simply adding everything in cwd ain't gonna cut it.

* What was the proper command to make said tarball again?

The command to untar a file is forever stuck in my brain, but the command for
creating a gzipped tarball is not. Not to mention the fact that I feel the
options and file argument order are messed up.

* What's the proper way to name the finished tarball?

If I'm about to upload a non-library distribution to cpan, should I add the
App:: prefix or not? What did I do on the previous release? I can't remember!

Was it an underscore, a hyphen or a dot between the distribution name and the
version number? And it should be .tar.gz or was it just .tar? .gz?



makedist
--------

![makedist](/assets/makedist.png)

Because of outlined reasons I decided to [hack something](https://github.com/trapd00r/makedist) together to aid
me in this process. A few other things I wanted to implement:

* I want to copy the finished distribution to a local directory for archiving purposes.
* I want to copy the finished distribution to a remote directory for archiving purposes.
* I want to automatically upload the finished distribution to cpan.


### Integrity of files

There's no point in doing anything if there's missing files from the
distribution. Therefore, we iterate the MANIFEST file and make sure that
every file that's supposed to go into the distribution tarball actually
does exist.




### Building the distribution filename

A perl distribution tarball filename consists of two dynamic objects;
the distribution name and the version number.

We can simply use a regex to extract the package name from a perl module like so:

{%highlight perl%}

my $str = 'package Foo::Bar::Baz;';
my ($package) = $str =~ m/^package\s+(.+);/;

{%endhighlight%}

The regular expression isn't perfect, but it works in most cases.

However, what if what we're trying to make a distribution out of isn't a
perl module, but an application? There might not exist any lib/
directory, no perl module and no package declaration.


{%highlight perl%}

sub get_package_name {
  my $file = shift;
  my $package;

  open(my $fh, '<',  $file) or die "Can't open '$file': $!\n";
  while(<$fh>) {
    chomp;

    # looks like a perl module
    if($_ =~ m/^package\s+(.+);/) {
      $package = $1;

      # each two : replaced by a single hyphen for the filename
      $package =~ s/::/-/g;

      # all good
      last;
    }
  }
  return (defined $package ? $package : 'App-' . basename(getcwd()));
}

{%endhighlight%}

If it doesn't look like a perl module we assume it's an application,
so we use the basename of the current working directory and add the
App- prefix:

    App-makedist
    File-LsColor

#### Extracting the version number

brian d foy wrote a module way back in 1999 called [Module::Extract::VERSION](https://metacpan.org/pod/Module::Extract::VERSION). It does
exactly what it claims to do and works great. It can return a bunch of
information, but we only need the version number so we call the method
in scalar context and build the final filename:

{%highlight perl%}

Use File::Find::Rule;

sub build_filename {
  my $file;
  my $rule = File::Find::Rule->new;

  $rule->file;
  $rule->name(qr/[.]pm$/);

  $file = ($rule->in(getcwd()))[0];

  if(!$file) {
    $file = (glob('./bin/*'))[0];
  }

  # Here we glue the actual filename together
  my $dist = get_package_name($file);
  my $version = scalar Module::Extract::VERSION->parse_version_safely($file);

  my $dist_name = sprintf("%s-%s.tar.gz", $dist, $version);
  return $dist_name;
}

{%endhighlight%}

We use File::Find::Rule to traverse the directory for perl module files
(I had no luck with using glob('\*\*/*.pm')). If we find any, we use the
first one; else, we look for content in the bin/ directory.



Now we've made sure that all the files does exist, and we've created the
dynamic tarball filename.


We create the actual tarball using a system call, which I kinda not like,
but I found no good module for it on the cpan.

{%highlight perl%}

system('tar', 'czf', $tarball, @files_in_dist);
if($? == 0) {
  printf("- Distribution created: %s\n", $tarball);
}

{%endhighlight%}

What about those extra features I wanted, like auto-uploading to the cpan?
[makedist](https://github.com/trapd00r/makedist) can make use of a configuration file:

    makedist.conf:

{%highlight perl%}

use File::Copy qw(cp);

my $cpan_dist_dir = "$ENV{HOME}/dev/_cpan_releases";


our $command_on_success = sub {
  printf("'%s' -> '%s'\n",
    ls_color($finished_product), $cpan_dist_dir) if(copy()
  );
  scp();
  upload();
};

sub scp { system('scp', $finished_product, qw(pi@pi:)); }
sub copy {
  cp($finished_product, $cpan_dist_dir) or die "Copy failed: $!";
}

sub upload {
  system('cpan-upload', '-u', $pause_id, $finished_product);
}

{%endhighlight%}

The $command_on_success and $finished_product variables are available in the
configuration file.

* $finished_product    

The basename of the gzipped tarball, i.e. File-LsColor-0.192.tar.gz

*    $command_on_success

A coderef that's executed upon success; that is, if we created the tarball
successfully.

### Uploading distribution to cpan

The upload to cpan is handled by the example script cpan-upload that comes
with the CPAN::Uploader distribution. We can use the distribution interface
directly, but we would need to handle logic for supplying PAUSE credentials;
cpan-upload already handles this nicely.

![makedist upload](/assets/makedist_upload.png)

makedist uploads itself to [cpan](https://metacpan.org/pod/release/WOLDRICH/App-makedist-0.012/makedist) :).
