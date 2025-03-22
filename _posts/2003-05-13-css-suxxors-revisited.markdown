---
layout: post
title: CSS suxxors revisited
date: '2003-05-13T02:34:19+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973144951/css-suxxors-revisited
---
<p>A friend of mine, Rog, asked me what I thought of a design he was working on. He showed me a template page and I thought it was pretty nice. It was a pretty simple layout but he&rsquo;d done it all with tables. He had a lot of borders and blocks of colour which were ripe for CSSifying. I decided to rewrite his page to demonstrate how easy it would be to him.</p>
<p>An hour later I&rsquo;m furious. It wasn&rsquo;t supposed to be like this. It was a clean simple, bottom up design that is tailor made for HTML. Yet to achieve it all in CSS I have to go at the browser with a series of hacks and workarounds. Bollocks! I&rsquo;m not prepared to do it. I&rsquo;ve abandoned the project and mentioned it to him as an aside.</p>
<p>He has a set of navigation tabs with a border. They&rsquo;re on the right. I can&rsquo;t put them on the right with CSS, it has no support for right-aligning block elements. I positioned them absolutely, but they will move relative to the content if the font sizes are changed drastically.</p>
<p>He has two columns nested within a lot of thin borders which look nice, if I use absolute positioning I lose the borders, otherwise I have to put up with the browser trying to wrap the page content around the navigation which I don&rsquo;t want. I want two columns. If instead I float the larger content area, again the borders go AWOL.</p>
<p>Nothing I&rsquo;ve learned today has changed my opinion that CSS is not powerful enough to allow the development of genuinely flexible pages, ones that can be made to look great whatever happens to the browser or the fonts or the colours or anything. I should be able to ship a page that degrades progressively as you use less design-aware technology. Instead I get something that just about works on my browser and instantly looks horrible in anything else. Is that so fucking hard?!</p>
<blockquote>
<p>Look at our new car! It&rsquo;s the best!</p>
<p><em>Can I take it on the motorway?</em></p>
<p>Sure you can drive it on the roads as fast as you want!</p>
<p><em>Can I take it on the motorway?</em></p>
<p>Um, no.</p>
</blockquote>
<p>I wonder why nobody&rsquo;s buying&hellip;</p>
