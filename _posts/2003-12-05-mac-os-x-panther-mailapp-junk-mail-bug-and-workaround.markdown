---
layout: post
title: Mac OS X Panther Mail.app Junk Mail bug and workaround
date: '2003-12-05T14:42:18+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880565599/mac-os-x-panther-mailapp-junk-mail-bug-and-workaround
---
<p>Panther&rsquo;s copy of Mail has a bug where junk email is recognised but not moved to the Junk folder, even when automatic mode is selected, if no other rules are present (i.e. non-junk rules). A workaround is to create a dummy rule. Mine says something like:</p>
<p class="eg">if from is equal to &ldquo;vdssb 1 3208222vb3vb33097&rdquo;<br/>
and from does not equal &ldquo;vdssb 1 3208222vb3vb33097&rdquo;<br/>
set the text colour to red
</p>
<p>Silly, but effective.</p>
<p>Thanks to &ldquo;Jon&rdquo; who <a href="http://www.digitalmediatree.com/jim/weblog/comment/23791/">posted</a> this workaround on <a href="http://www.digitalmediatree.com/jim/weblog/">Jim Bassett&rsquo;s weblog</a>.</p>
