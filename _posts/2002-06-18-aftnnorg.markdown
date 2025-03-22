---
layout: post
title: AFTNN.ORG!
date: '2002-06-18T04:59:20+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058149563/aftnnorg
---
<p>Well, this site has moved to <a href="http://aftnn.org/">aftnn.org</a>! I bought the domain a while ago. In intend to make heavy use of Smarty and mod_rewrite to meta-ise everything. Only problem is that mod_rewrite goes into an infinite loop if you rewrite all addresses in a per-directory config! Nuts!</p>
<p>Basically, if your .htaccess has something like</p>
<p class="eg"><code>RewriteRule ^.*$ index.php</code></p>
<p>Just make sure you add a RewriteCond to make sure this isn&rsquo;t applied to the clever script that&rsquo;s going to do all the work, index.php in the example. I use the one below, which basically negates the rewrite rule for all files that actually exist (handy for css and images too).</p>
<p class="eg"><code>RewriteCond /path/to/webroot%{REQUEST_URI} !-f</code></p>
<p>Doh!</p>
<p>Anyway, a new look for my weblog and lots more content to come, including the massive backlog of dreams I&rsquo;ve had since my last post!</p>
