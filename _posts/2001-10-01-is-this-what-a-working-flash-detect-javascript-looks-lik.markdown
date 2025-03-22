---
layout: post
title: Is this what a working flash detect javascript looks like?
date: '2001-10-01T05:31:43+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058180445/is-this-what-a-working-flash-detect-javascript-looks-lik
---
<p><code>&lt;!--<br/>
  var plugin = (navigator.mimeTypes &amp;&amp; navigator.mimeTypes["application/x-shockwave-flash"] ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0);<br/>

  if (plugin &amp;&amp; parseInt(plugin.description.substring(plugin.description.indexOf(".")-1)) &gt;= 4) {<br/>
    document.write('&lt;EMBED src="detec.swf" quality=high bgcolor=#ffffff ');<br/>
    document.write(' swLiveConnect=FALSE WIDTH=80 HEIGHT=72');<br/>
    document.write(' TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"&gt;');<br/>
  } else {<br/>
    document.write('&lt;IMG SRC="images/animation.gif" WIDTH=80 HEIGHT=72 BORDER=0&gt;');<br/>
  }<br/>

//--&gt;</code></p>
