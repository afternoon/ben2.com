---
layout: post
title: Announcing aftnn.org version 2.0
date: '2009-03-06T12:16:50+00:00'
tags:
- django
- nginx
- byteflow
tumblr_url: https://aftnn.org/post/47880414966/announcing-aftnnorg-version-20
---
<p>Version 2.0 of <a href="http://aftnn.org/">aftnn.org</a> is here!</p>

<p>The new site is powered by the <a href="http://byteflow.su/">Byteflow</a> with a few some custom bits. Byteflow runs on top of <a href="http://djangoproject.com/">Django</a>.</p>

<p>Some of the features I&rsquo;m happiest about:</p>

<ul>
<li>My <a href="http://friendfeed.com/afternoon/">FriendFeed</a> collects all the stuff I&rsquo;ve been doing on the web and I re-use that feed here.</li>
<li>The vast majority of old urls still work. My nginx config contains a rewrite line for each blog post. Not pretty, but fast.</li>
<li>The Content and Photos sections are dynamically generated, making them easier to maintain.</li>
<li>I can finally write blog posts in <a href="http://daringfireball.net/projects/markdown/syntax">Markdown</a>, not raw HTML. Byteflow actually allows me to select a text renderer per-post, so I can write one post in Markdown, the next in MediaWiki markup.</li>
<li>Comments are hosted locally again, not by Intense Debate, and are protected by CAPTCHA. Alternatively, you can log in with your OpenID to comment.</li>
<li>nginx serves up static content very quickly and gzips everything too.</li>
</ul>

<p>There are always some down-sides though.</p>

<ul>
<li><a href="/blanket/">Blanket</a> is gone. It was a resource hog and I didn&rsquo;t want to port it to Python. Sorry.</li>
<li>Byteflow and Django don&rsquo;t play as nicely with caches as I would like. Byteflow doesn&rsquo;t provide <code>Last-Modified</code>, <code>Expires</code> or <code>ETag</code> headers for it&rsquo;s pages. Django sets cookies immediately, instead of when a session is actually used, so it&rsquo;s page are effectively uncacheable. Also, Django does not provide <code>Content-Length</code> headers for responses. All this degrades the performance of my site.</li>
<li>The Intense Debate comment import process lost the threading. I&rsquo;ll try to fix the relevant posts by hand some time.</li>
</ul>

<p>I hope you like the new site. Please post a comment if you find a bug or have any other feedback.</p>
