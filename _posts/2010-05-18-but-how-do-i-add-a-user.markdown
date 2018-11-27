---
layout: post
title: "but, how do I add a user?"
date: 2010-05-18
tags: linux, bash, shell, perl
---

Yesterday I was approached with a interesting problem.
This guy simply couldn't write the 'd' char anymore. To see if it was software
or hardware related, he was about to add a new user to try with. 
He was confused how to add a new user though, since *adduser*, *useradd* and
*/etc/passwd* all have the 'd' char in it.

There's a couple more or less interesting ways to solve this.

{% highlight bash %}
usera + [tab]
{% endhighlight %}

{% highlight bash %}
/usr/sbin/usera??
{% endhighlight %}

And the little more interesting way...

{% highlight bash %}
$(perl -e 'printf("a%s%suser\n",  chr('100') x 2);')
{% endhighlight %}

What this does is actually pretty simple.
We print a 'a', two 'd' using the chr() function, 'user', and since we wrapped it
all in $(), it executes in the shell, and voilá!

