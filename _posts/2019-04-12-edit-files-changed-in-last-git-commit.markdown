---
layout: post
title: edit files changed in last git commit
date: 2019-04-12
author: "Magnus Woldrich"
tags: git, vim
---

Git is one of the tools where you can learn new things everyday.


I've created two new aliases in my shellrc:

show modified files in the last commit:
```
alias gdd='git diff --name-only HEAD~1..HEAD | ls_color'
```
![img](/assets/vimlast.png)

and edit them instead:
```
alias   vimlast='vim $(git diff --name-only HEAD~1..HEAD)'
```

Great way to quickly pick up where I left off yesterday!

(The ls_color tool is part of
[File::LsColor](https://metacpan.org/pod/File::LsColor)).
