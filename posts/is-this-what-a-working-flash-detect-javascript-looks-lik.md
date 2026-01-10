---
layout: post
title: Is this what a working flash detect javascript looks like?
date: '2001-10-01T05:31:43+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058180445/is-this-what-a-working-flash-detect-javascript-looks-lik
---
```js
<!--
  var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"] ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0);

  if (plugin && parseInt(plugin.description.substring(plugin.description.indexOf(".")-1)) >= 4) {
    document.write('<EMBED src="detect.swf" quality=high bgcolor=#ffffff ');
    document.write(' swLiveConnect=FALSE WIDTH=80 HEIGHT=72');
    document.write(' TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">');
  } else {
    document.write('<IMG SRC="images/animation.gif" WIDTH=80 HEIGHT=72 BORDER=0>');
  }<br/>
//-->
```
