---
layout: post
title: Generate JSON Index Of Images With awk and identify
date: '2014-03-14T11:33:00+00:00'
tags:
- awk
- imagemagick
- unix
tumblr_url: https://aftnn.org/post/79547282738/generate-json-index-of-images-with-awk-and
---
<p>I maintain a manifest file for a Trigger.io mobile app which includes a set of images indexed by size. I&rsquo;ve taken to generating the JSON with <code>awk</code> and <a href="http://www.imagemagick.org/script/identify.php">Imagemagick&rsquo;s <code>identify</code></a> command:</p>

<p><code>identify</code> returns a wealth of information about an image file:</p>

<pre><code>$ identify Default~iphone.png
Default~iphone.png[6] PNG 320x480 320x480+0+0 8-bit sRGB 11.5KB 0.000u 0:00.000
</code></pre>

<p>I want to transform that into some JSON. <code>awk</code> is designed for exactly this kind
of text transformation problem.</p>

<pre><code>$ identify *.png | awk '{gsub("\.png.*$", ".png", $1); printf "\"%s\": \"%s\",\n", $3, $1}' | sort
"1024x748": "Default-Portrait@2x~ipad.png",
"1024x768": "Default-Landscape~ipad.png",
"2048x1496": "Default-Landscape@2x~ipad.png",
"320x480": "Default~iphone.png",
"640x1136": "Default-568h@2x~iphone.png",
"640x960": "Default@2x~iphone.png",
"768x1004": "Default-Portrait~ipad.png",
</code></pre>

<p>Copy and paste into manifest, remove trailing comma, make cup of tea.</p>

<p><strong>EDIT</strong>: Achieve the same effect with the <code>-format</code> parameter for <code>identify</code> (<a href="http://www.imagemagick.org/script/escape.php"><code>-format</code> docs here</a>):</p>

<pre><code>identify -format '"%wx%h": "%f",\n' *.png
</code></pre>
