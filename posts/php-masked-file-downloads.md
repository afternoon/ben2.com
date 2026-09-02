---
layout: post
description: "This post reflects on php masked file downloads, drawing together the author’s observations, context, and conclusions across the article. It records a specific experience or technical idea and preserves the author’s informal perspective on what happened and why it mattered."
title: PHP Masked File Downloads
date: '2002-02-21T11:44:23+00:00'
tags: []
tumblr_url: https://aftnn.org/post/48058167611/php-masked-file-downloads
---
<p><code>
if(strstr($HTTP_USER_AGENT,"MSIE"))$attachment="";<br/>
else$attachment=" attachment;";<br/>
header("Content-type: application/octet-stream");<br/>
header("Content-disposition:$attachmentfilename=$file");<br/>
header("Content-length: ".filesize($file));<br/>
header("Content-name: ".$file);<br/>
readfile("/*********/web/$file");<br/>
</code></p>
