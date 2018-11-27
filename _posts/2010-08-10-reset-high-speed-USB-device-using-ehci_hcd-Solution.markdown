---
layout: post
title: "reset high speed USB device using ehci hcd"
date: 2010-08-10
tags: linux, usb
---

Finally a solution.
Enable CONFIG_USB_EHCI_TT_NEWSCHED and recompile the kernel.

{%highlight perl%}
-> Device Drivers
  -> USB support
    -> Support for Host-side USB
      -> EHCI HCD (USB 2.0) support
{%endhighlight%}
