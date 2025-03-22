---
layout: post
title: A new CMS is born
date: '2004-06-23T21:54:17+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880509557/a-new-cms-is-born
---
<p>I&rsquo;ve been making a new simple CMS for <a href="http://cohack.com">my new company&rsquo;s website</a>. It&rsquo;s based on the Hypothetical code, but instead of injecting portlets into templates, it creates simple XHTML output and offers you the chance to transform that with XSLT (and also decorate it with CSS of course). I wondered how quick doing an XSLT transform with Sablotron under PHP was.</p>

<pre>
InfoCMS
Parsed 20 files
Executed 1 database queries

Start	0.00
Init complete	0.15
Mapped request to view	0.01
Parsed VInfoRead.php and dependencies	0.00
VInfoRead constructed	0.02
Rendering page	0.00
Created initial representation	0.00
Transformed representation with XSLT	0.00

Total	0.19 seconds
</pre>

<p>Not too shabby! Although, to be honest, my XSLT is pretty simple:</p>

<pre>
&lt;xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;
    &lt;xsl:output method="xml" version="1.0"
            indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/&gt;

    &lt;xsl:template match="*"&gt;
        &lt;xsl:copy-of select="."/&gt;
	&lt;/xsl:template&gt;
&lt;/xsl:transform&gt;
</pre>

<p>InfoCMS will hopefully be released open source sometime soon. I&rsquo;ll extoll it&rsquo;s virtues further at some point. It&rsquo;s going to be quite good I reckon. Simple but easily extensible.</p>
