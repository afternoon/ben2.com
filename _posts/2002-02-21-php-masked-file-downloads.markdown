---
layout: post
title: PHP masked file downloads
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
