---
layout: post
title: More Vim hacks
date: '2003-11-25T05:58:52+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880572572/more-vim-hacks
---
<p class="eg"><code>:set keywordprg=google</code></p>
<p>Where <code>google</code> is a shell script that simply looks like:</p>
<p class="eg"><code>#!/bin/sh<br/>
/usr/bin/open <a href="http://www.google.com/search?q=%241">http://www.google.com/search?q=$1</a></code></p>
<p>The net effect is the whenever I hit K in Vim, I get a google search of the keyword under the cursor. By default Vim uses <code>man</code>, which is OK for C hackers, but not so good for Sun Certified Programmers for Java. :-)</p>
<p>BTW, <code>open</code> is a clever OS X program which uses OS X&rsquo;s database of applications to find the right application for whatever you tell it to open. In this case it will fire up Safari. Using it here means that this hack works from both the command line and GUI versions of Vim.</p>
