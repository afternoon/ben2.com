---
layout: post
title: Mmm, rsync
date: '2004-03-29T22:53:46+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880536730/mmm-rsync
---
<p>Sync a folder to a server to which you have SSH access (and which has rsync installed). The options include compressing, checksumming, being verbose and archving, which does a bunch of stuff. Also, I don&rsquo;t want to put Vim&rsquo;s swapfiles up to the server, so by excluding them here I can run this command while editing. Excluding .DS_Store is a must for OS X users. Pesky .DS_Store files.</p>
<p class="eg"><code>rsync -cavz --exclude=\*.swp --exclude=.DS_Store --rsh=/usr/bin/ssh folder server.com:dest</code></p>
