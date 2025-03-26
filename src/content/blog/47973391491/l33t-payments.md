---
layout: post
title: l33t payments
date: '2002-09-10T10:34:44+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973391491/l33t-payments
---
<p>Well, I just sent my l33t points through the roof. I went to Greg&rsquo;s to fix his SuSE install. We fixed it and hadn&rsquo;t even spent five minutes discussing how evil KDE was before we decided to format his disk and install Debian. It took us all fucking night.</p>
<p>Why did Greg have SuSE in the first place when Debian is a far superior distro? Well, because Debian sucks to install. It asks too many challenging questions and it doesn&rsquo;t give the user enough context information during the dpkg-configure phase. Worst of all, if you manage to get a working base system installed you&rsquo;re suddenly left on your own! No networking, if you get networking there&rsquo;s no DHCP. There&rsquo;s no XFree, let alone GNOME. To fix all this you head to APT, Debian&rsquo;s killer app (it makes the OS, really). You try to install an app and it works, but this doesn&rsquo;t help. Greg and I tried installing a GNOME app or two to see if the dependency tree would require the install of a full system - a technique that has worked for me before. But not this time. We were forced to spend literally hours trawling through <a href="http://packages.debian.org">packages.debian.org</a>, finding packages, installing them, seeing what bits of the system came along.</p>
<p>In case you&rsquo;re wondering if you do something like:</p>
<p><code class="eg">apt-get install x-window-system-core sawfish gdm gnome-control-center gnome-session galeon nautilus evolution</code></p>
<p>You should get a fairly functional desktop system. But this won&rsquo;t give you a fully usable Linux system, just a GUI really. From there you&rsquo;ve still got to install the little things, like GIMP, Vim or sudo.</p>
<p>What was wrong with the task system? It served a purpose and I can&rsquo;t see what the problem was with it all. Woody (Debian 3) has a tasksel app but the only tasks included are useless. One was called desktop system, but this failed to installed the GUI components we desired.</p>
<p>Bad show Debian volunteers.</p>
<p>I can barely move my hands now&hellip;</p>
