---
layout: post
title: It's a long road to Psion
date: '2001-08-13T13:39:19+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058202638/its-a-long-road-to-psion
---
<p>I spent a lot of time this weekend hacking about with the Psion. I found the whole thing a bit wierd because some stuff was mind-numbingly easy and other bits well tricky. My 64mb Compact Flash card does not work, so I will have to return it and ask Dabs for one that does. Pending that I have had no storage space and so nowhere to actually install Linux to properly.</p>
<p>This is is a big issue, the Psion itself only has 300k free after loading the PsiLinux ramdisk image. Maybe I should try the non-CF one as it may be smaller.</p>
<p>The ramdisk image is interesting. It contains busybox, a single binary responsible for many of Unix&rsquo;s traditional little commands, like sh. It also contains a custom init, one that doesn&rsquo;t seem to want to use an inittab. This has so far prevented me from setting the Psion up as a serial terminal, which would be really useful. More useful still would be SLIP across the PC connection. Then I could just plug it into any machine (assuming Windoze boxes can do SLIP fairly easily) and telnet into a Unix box.</p>
<p>My main focus is comms stuff at the mo as I have no space to bother doing anything. I don&rsquo;t even have space for a compiler, which sucks ass as I need to build loads of stuff.</p>
<p>I want to get Microwindows up and running, and a hundred thousand other things, but they all take disk space. One thing that did occur: If I get SLIP up I might be able to export some of my desktop&rsquo;s disk space to the Psion through NFS, or any other sharing platform, which would be dead handy.</p>
<p>Guess I&rsquo;ll phone Dabs for now though&hellip;</p>
