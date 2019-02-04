---
layout: post
title: clone all github repos and gists in one go
date: 2019-02-04
author: "Magnus Woldrich"
tags: github, cli, git
---

At times I find myself wanting to clone every repository I have on
github. Additionally, today I wanted to check out all the forgotten
gists I've made over the years.

I whipped up these two scripts:

**clone_all_repos**:
{%highlight bash%}

#!/bin/sh
# abstract: clone all github repos from GITHUB_USER

CNTX='users';
NAME=$GITHUB_USER
# a maximum of 100 repos per page
END_PAGE=3

for PAGE in {1..$END_PAGE}; do
  curl -s "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
    grep -e 'git_url*' |
    cut -d \" -f 4     |
    xargs -L1 git clone
done
{%endhighlight%}

**clone_all_gists**:

{%highlight bash%}
#!/bin/sh
# abstract: clone all gists from GITHUB_USER

NAME=$GITHUB_USER

for gist in $( \
  curl -s https://api.github.com/users/$NAME/gists \
    | grep git_pull_url \
    | grep -Po 'https:.+[.]git'
); do
  git clone $gist
done
{%endhighlight%}

Remember to set your GITHUB_USER environment variable, and adjust the
END_PAGE variable in the clone_all_repos script if necessary.

They are both available [here](https://github.com/trapd00r/github-clone-all).
