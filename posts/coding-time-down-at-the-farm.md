---
layout: post
title: Coding time down at the farm
date: '2002-09-14T21:38:04+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973387338/coding-time-down-at-the-farm
---
<p>Well, I applied for a job that might involve some assembler. I haven&rsquo;t really done much assemler, aside from polling devices on a Motorola 68k. I had a look at assembler on the PowerPC, hence my Mac (and the GameCube!). I came to the conclusion that no-one should ever write assembler. Fast as it may be it does not fit into projects and is uselessly hard to repurpose. Give me C++, a good optimizing compiler and some profiling tools anyday. That way of developing will probably yield code that is just as fast and will certainly leave you with a manageable project.</p>
<p>So instead I thought about having another go with Objective-C. Finding those renders that I posted yesterday made me think that it would be cool to revive that project under OS X. Turns out that it&rsquo;s actually quite easy to do. The Objective-C OO Api for OS X, Cocoa, provides a hierarchy of classes. To get something done you just subclass one. So I subclassed NSOpenGLView into BasicRenderer and implemented a drawRect function with a handful of OpenGL calls in it. Trouble is, it doesn&rsquo;t seem to work. Yet&hellip;</p>
