---
layout: post
title: Blanket
date: '2002-07-03T06:07:57+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058144423/blanket
---
<p>I felt so sorry for my friends getting banned from Hype because we use the word fuck so often that I wrote a <a href="/blanket/">nasty words filter</a> that they can use to view pages.</p>
<p>This was relatively simple to write in PHP (<a href="/blanket/source/">view the source</a>), just a file() instruction and a bunch of regular expressions really. The RE processing makes it quite slow on big pages (Hype for example). It has no support for cookies or HTTP post either, which handicaps it a bit. However, I&rsquo;m hoping the semi-experienced web user should be able to work around this. It has an issue with links to binary files as well, it tries to read and sanitise them like normal HTML. Getting around this would mean using CURL to grab the Content-type header. This would provide a framework to solve the cookies/post issue as well though.</p>
<p>At some point I will knock out a version 2 using CURL, but for now I have other (more lucrative) fish to fry.</p>
