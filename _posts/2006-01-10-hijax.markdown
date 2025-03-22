---
layout: post
title: Hijax
date: '2006-01-10T06:06:45+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880466736/hijax
---
<p>Got back from Mobile Monday drunk, snoozed for an hour and now I&rsquo;m learning new hacking tricks! I surely do have the strangest working hours. I have an excuse, Louise started a new job working nights this week, she finishes at four and will be back in an hour. I wanted to stay up and wait for her.</p>

<p>Anyway, <a href="http://www.domscripting.com/blog/display/41">Hijax</a> is the combination of two very cool ideas: 1. Ajax, 2. Progressive enhancement. Progressive enhancement, advocated by Jeremy Keith, in his book <em><a href="http://www.domscripting.com/">DOM Scripting</a></em> (which I do not own and have not read), suggests that whizzy JavaScript functionality should be automatically added to a simple HTML page after the fact. So instead of building an app with a bunch of links that call JS functions, I&rsquo;d create a vanilla web app with links to new pages. Then I would write JS code that goes and finds those vanilla links and hijacks them, replacing them in the DOM with links to teh whizzy.</p>

<p>This idea doesn&rsquo;t just relate to Ajax of course, but it provides a foundation for building higher-quality Ajax apps. As Mr Keith so eloquently puts it: &ldquo;progressive enhancement automatically guarantees graceful degradation.&rdquo; Because the old links are still there for non-JS users (old browsers, browsers with no JS, search engines, etc) my app still works perfectly well, if less whizzily.</p>

<p>This is the single coolest JS trick I&rsquo;ve ever come across, way cooler than all that Ajax rubbish :-). Deployment of JS whizzitronics follows the same model as the deployment of CSS beauty. The underlying content is preserved, so you can have your cake and eat it too. I highly recommend reading <a href="http://www.domscripting.com/blog/">Jeremy&rsquo;s blog</a> and the <a href="http://www.domscripting.com/book/sample/">sample chapter</a> as he explains this stuff much better than me in my tired, post-booze state.</p>
