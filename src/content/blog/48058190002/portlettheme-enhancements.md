---
layout: post
title: Portlet/theme enhancements
date: '2001-08-29T05:00:52+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058190002/portlettheme-enhancements
---
<p>Export portlets to pt files. That way portlets can be:</p>
<ul>
<li>More advanced: They can have PHP in them and make better use of the supplied data.</li>
<li>More accessible: All nastiness is kept inside the portlet() function.</li>
<li>Fast(ish): More file reads, but these are fast as fuck anyway (wrong attitood I know). This can be tweaked to do less reads by fgetting all the pt files into the portlet function file once only. Mix &lsquo;n&rsquo; blen of trad hypo and forum approaches.</li>
<li>Vastly extensible: a label hook would be good, when a portlets function is known a label is passed, this can be used by theme designers to draw different portlets (using an if statement).</li>
<li>Secure: pt files can be checked by me before being added. This will make testing trickier, but I can give a little on various submissions.</li>
</ul>
