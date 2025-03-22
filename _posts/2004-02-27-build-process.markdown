---
layout: post
title: Build process
date: '2004-02-27T04:49:14+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880549435/build-process
---
<p>I have a build process! I&rsquo;ve been working on my own for so long I&rsquo;ve never needed one before, but now I&rsquo;m part of a team it&rsquo;s suddenly very much required. It&rsquo;s simple too. I edit the files, I try to compile them, when they work I check them into CVS. Then I have an Ant target which pulls the latest source from CVS and compiles it to the shared libs location for Tomcat. I then restart the server. All is full of love. Neat and it only took a day to setup! I&rsquo;ve got CVS integration in Vim and a menu item that triggers the build through SSH.</p>
