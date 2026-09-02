---
layout: post
title: Strip Tags in a Vim Buffer
description: "Before I forget this, here’s a simple Vim command to strip XML or HTML tags from a buffer. The expression is non greedy and catches tags that span multiple lines. :%s/<\ .{ 1,} //g"
date: '2006-11-24T13:34:52+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880443079/strip-tags-in-a-vim-buffer
---
Before I forget this, here&rsquo;s a simple Vim command to strip XML or HTML tags from a buffer. The expression is non-greedy and catches tags that span multiple lines.

<p class="eg"><code>:%s/&lt;\_.\{-1,\}&gt;//g</code></p>
