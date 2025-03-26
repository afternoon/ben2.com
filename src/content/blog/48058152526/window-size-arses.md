---
layout: post
title: Window size arses
date: '2002-05-28T16:30:19+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058152526/window-size-arses
---
<p>Browsers insist on rendering content at different sizes, popup windows are either inadequate or too large. The simple answer is to make window.open wrapper functions that adjust window sizes based on browser detection. They only need a few pixels:</p>
<pre>
function nicewindow(url, x, y) {
    var scroll = "auto";
    var n = navigator.appName.toLowerCase();
    if (n.indexOf("internet explorer") != -1 || n.indexOf("msie") != -1) scroll = "yes";
    if (document.layers) { x += 161; }
    else if (n.indexOf("netscape") != -1 &amp;&amp; parseInt(navigator.appVersion) &gt; 4)
        { x -= 100; y -= 70; }
    else if (n.indexOf("mac") != -1) { x -= 100; y -= 40; }
    return window.open(url, "sometitle",
        "width="+x+",height="+y+",scrollbars="+scroll+",menubar=no,toolbar=no");
}
</pre>
