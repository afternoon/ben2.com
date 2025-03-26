---
layout: post
title: So cunning etc etc
date: '2002-03-20T21:08:49+00:00'
tags: []
tumblr_url: https://aftnn.org/post/48058161644/so-cunning-etc-etc
---
<p>Well, IE is having a crashy day so I&rsquo;m posting with NS6. It wouldn&rsquo;t be too bad except that I actually have some work to do.</p>
<p>This is the cunning bit, it&rsquo;s the javascript used by xiti.com to create stats:</p>
<code>
hsh = new Date();<br/>
hsd = document;<br/>
hsi = '&lt;a href="http://www.xiti.com/xiti.asp?s=12835"&gt;'<br/>
hsi += '&lt;img width=39 height=25 border=0 align=center hspace=5 vspace=10 src="http://loga.xiti.com/hit.xiti?s=12835'<br/>
hsi += '&amp;p=&amp;hl=' + hsh.getHours() + 'x' + hsh.getMinutes() + 'x' + hsh.getSeconds();
if(parseFloat(navigator.appVersion)&gt;=4)<br/>
{s=screen;hsi += '&amp;r=' + s.width + 'x' + s.height + 'x' + s.pixelDepth + 'x' + s.colorDepth;}<br/>
hsd.writeln(hsi + '&amp;ref=' + hsd.referrer.replace('&amp;', '$') + '" alt="Mesurez votre audience"&gt;&lt;/a&gt;');<br/>
</code>
<p>Note use of image tag to send the collected info back to the server.</p>
