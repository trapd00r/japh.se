---
layout: post
title: "Expand function calls in a string"
date: 2010-05-18
tags: perl
---

Normally when one wants to add a function call to a string variable,
the concatation operator '.' is used;

{% highlight perl %}
my $foo = 'the time is ->'.scalar(localtime).' <- the time is';
{% endhighlight %}

Little known is the fact that you can expand calls directly in a string:

{% highlight perl%}
my $foo = "the time is -> @{[scalar(localtime)]} <- the time is";
{% endhighlight %}
