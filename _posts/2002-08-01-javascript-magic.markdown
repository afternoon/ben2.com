---
layout: post
title: JavaScript Magic
date: '2002-08-01T07:40:27+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973396355/javascript-magic
---
<p>I haven&rsquo;t posted for a while. I&rsquo;ve been really busy, since Friday at least. I&rsquo;m doing a job that involves JavaScript like nothing I&rsquo;ve ever done before. It relies on the browser to do many of the things that I would always do in PHP: validation, persistence and selective content. But I&rsquo;m not paying, so you say jump&hellip;</p>
<p>Writing the validation and the session management was interesting. I have recently mastered the writing of JavaScript objects, having never really seen the point before I now tend to code as an object by default, whether in PHP, JavaScript or any other language. The objects I created are great, like all objects just include the file and call a couple of methods. The session management I particularly like, it apes PHP/ASP session code and to use is almost identical to JavaScript ASP, with <code>session.get(key)</code> and <code>session.set(key, value)</code> functions, the object also rips the values from a named form if you want it to.</p>
<p>The validation is a rip-off of the validation class I use in PHP, which came from a tutorial on <a href="http://www.devshed.com/">DevShed</a>. It too benefits from being a workalike of a tested solution.</p>
<p>Today I was messing around with window.open and started experimenting with interaction between windows. Because JavaScript is a so-called prototype language (I know of no others), any object can have properties and methods added at run-time. I found that by adding a popup property to the window object, opening a new window with window.open and then getting the content of the new window to refer to document.opener.popup I could transfer content for a popup window from the main window. This is quite useful as the work I&rsquo;m doing at the moment has a fairly large number of popup windows, all with similar content. This way I can use a single popup template and write the content in when I need it.</p>
