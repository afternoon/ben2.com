---
layout: post
title: Smart moves
date: '2002-05-13T09:09:09+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058154134/smart-moves
---
<p>Got a bit further with Smarty. I now have an excellently tangled web of templates creating a themeable page. One goal that&rsquo;s on my mind is template juggling of arrays. For example, I pass in an array describing the left hand portlet block of Hype (login, threads, etc). What if my template author wants to drop one of the portlets, include another or otherwise change the array? Smarty doesn&rsquo;t seem to cover these problems.</p>
<p>However, as with everything Smarty doesn&rsquo;t do, it should be possible to add support throught plug-ins. I could build plug-ins that manipulate the assigned variables in the style of PHP&rsquo;s own array functions, push, pop, sort etc. A wide library would be useful.</p>
