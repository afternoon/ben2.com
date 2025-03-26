---
layout: post
title: Tests and hacks
date: '2003-11-07T00:18:52+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47972953361/tests-and-hacks
---
<p>Well, I&rsquo;ve been using it for a couple of hours now and Virtual PC is already making testing so much easier. I&rsquo;m confident that installing it will improve the quality of my work significantly.</p>
<p>Now that I can actually test properly on IE 5 instead of just happening by a copy every once in a while, I&rsquo;ve used my first CSS hack. A hack hides a property from an older browser, IE 5 in my case. You set the property to the old browser version and then use a hack to hide a second setting of the property. Simple. Ugly, IMHO. But I found one that&rsquo;s really very simple. The simplified box model hack preys on IE 5&rsquo;s lack of compatibility with escape characters in selector names. Old versions of Opera fall fowl of it too, but I&rsquo;m not supporting those because they&rsquo;re below my usage threshold.</p>
<p>For some good reading on CSS hacks, see the <a href="http://css-discuss.incutio.com/?page=CssHacks">hacks page</a> on the <a href="http://css-discuss.incutio.com/">CSS Discuss wiki</a>.</p>
