---
layout: post
title: ISP fun
date: '2004-08-04T05:47:44+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880505351/isp-fun
---
<p>Had an interesting couple of hours today when Gradwell installed PHP 5 on a box they thought wasn&rsquo;t in the web cluster, but was. <a href="http://hypothetical.co.uk">Hypothetical2</a> and <a href="http://www.cohack.com/tools/infocms/">InfoCMS</a> emulate exceptions, so they have <code>throw</code> and <code>catch</code> functions and an <code>Exception</code> class. PHP 5 has real exceptions, so these words are sacred, the former being keywords and the latter being a built-in class. Needless to say some amount of chaos ensued. I rapidly updated all my live sites but in such way that I can be pretty sure I&rsquo;ve introduced bugs.</p>
<p>Then later on this evening I was trying to do some stuff with the <code><a href="http://docs.python.org/lib/module-smtplib.html">smtplib</a></code> Python module and couldn&rsquo;t get any mail to come through. After poking about for a bit I found that it was all jamming up in my MTA queue because my Mum&rsquo;s ISP, Tiscali, wouldn&rsquo;t return anything in reponse to an MX query. I guess this is their clever way of stopping worms from running riot, but it pissed me off, so now I&rsquo;m using <a href="http://www.zen.co.uk/">Zen</a>&rsquo;s servers instead :-).</p>
