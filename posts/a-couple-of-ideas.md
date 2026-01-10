---
layout: post
title: A couple of ideas
date: '2003-03-07T18:19:38+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47973360660/a-couple-of-ideas
---
<ol>
<li>For Blanket, adding an URL base would prevent the need to rewrite relative links, which would certainly lighten the load a bit. Also, if this value is carried across to javascript that would mean some semblance of JS support.</li>
<li><p>In some of my recent projects I&rsquo;ve been lamenting PHP&rsquo;s lack of exceptions. I&rsquo;ve been writing blocks of code which perform three or four operations but have to clad those ops in 15 lines of error checking armour. I&rsquo;ve encapsulated most of my functionality in objects, so if those objects threw exceptions it would make much more sense. However, it may be possible to fudge a try-catch like system using the <code>trigger_error</code> function. A custom error handler could be created that would behave appropriately and clean up and this would be invoked in a similar manner, stepping out of all functions, to a try block. By defining different catcher functions for different scopes, it would be possible to actually do different things when an error comes in. Not that I do that. I always, always just dump the string into a template and push some HTML out of the door.</p><p>I found this <a href="http://zend.com/tips/tips.php?id=162&amp;single=1">Zend tip on simulating try-catch-throw</a>. It looks a bit in-depth for my purposes and I&rsquo;m not sure about the first argument for the try_catch function, but it&rsquo;s a proof of concept and I think I will try deploying this idea in my next project. Possibly with this <a href="http://zend.com/tips/tips.php?id=172&amp;single=1">method of triggering errors</a> employed in some way in the base classes that throw things.</p></li>
</ol>
