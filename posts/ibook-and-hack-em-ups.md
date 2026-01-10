---
layout: post
title: iBook and hack-em-ups
date: '2001-12-03T03:51:27+00:00'
tags: []
tumblr_url: https://aftnn.org/post/48058175366/ibook-and-hack-em-ups
---
<p>Well, my new iBook is very sexy indeed. With all the grace and poise of Mac OS X I can&rsquo;t help but smirk somewhat.</p>
<p>As the h_button script is run every time a button is generated for a page, it should be in charge of maintaining the cache of button images. It outputs the urls and so would need to know about cached versions anyway. The script could check for the existence of an up to date cache item and use it or create it. Cache items should be stored in folders with theme name and button file time. If the time on the file changes then the cache will be thrown away and a new folder created. The new buttons would be rendered into the cache folder as the different pages are accessed.</p>
<p>Additionally, Hype 2 has gotten a lot slower recently with all the extra work going into generating the front page. I suspect that this will be the trend for the coming additions. When all of the functionality documented so far has been completed, a testing and optimisation phase would give me a chance to improve what&rsquo;s there within the structure of the 0.2 code. It will be difficult to optimise code that has been built as part of a development phase, but I think the only way to do it is to attack the whole system and then to find the slow parts of that with timing. If code is being changed to optimise then it will be changed to speed up the whole system. Speeding up invidual components seperately may lead into a speed decrease overall. Also, testing needs to ensure that the system doesn&rsquo;t have any wierd infinite loops or long slow thinks in interesting conditions, fixing these kinds of things will need extensive code modification.</p>
