---
layout: post
title: drawFrame
date: '2001-09-12T06:32:01+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058184076/drawframe
---
<p>DrawFrame just draws the box, drawPortlet is responsible for generating content. That way all the content items that are part of a given site are reuseable. Portlets that just content static HTML may as well call drawFrame inline, depending e.g. nav html would be reuseable. In Hypothetical though, portlets would be going off all the place, especially with portlet groups, such as a bunch of messages. A call to drawPortlet(PT_MESSAGES) would yield the central column of Hypothetical&rsquo;s home page, whereas drawPortlet(PT_MESSAGELIST) would draw the archive page main content, or some search results, depending, conceivably, on a passed SQL query.</p>
