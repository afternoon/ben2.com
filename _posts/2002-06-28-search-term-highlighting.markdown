---
layout: post
title: Search term highlighting
date: '2002-06-28T06:30:36+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058145549/search-term-highlighting
---
<p>I added a regular expression to highlight search terms in matching entries, in the style of Google&rsquo;s cache. This is a nice thing, if a bit poncey. It has a known issue that it will match text in a tag.</p>
<p>E.g. a search for hypothetical will replace all instances of hypothetical with <code>&lt;span style="background-color:#9f0;"&gt;hypothetical&lt;/span&gt;</code>. If there is a link to hype it will go from:</p>
<p class="eg"><code>&lt;a href="http://hypothetical.co.uk/"&gt;hype!&lt;/a&gt;</code></p>
<p>to</p>
<p class="eg"><code>&lt;a href="http://&lt;span style="background-color:#9f0;"&gt;hypothetical&lt;/span&gt;.co.uk/"&gt;hype!&lt;/a&gt;</code></p>
<p>Which isn&rsquo;t valid HTML and will snap browsers like a twig. Well, nearly.</p>
