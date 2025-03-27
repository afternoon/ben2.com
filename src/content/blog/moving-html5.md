---
layout: post
title: Moving to HTML5
date: '2010-07-29T22:26:45+01:00'
tags:
- html5
tumblr_url: https://aftnn.org/post/47880400975/moving-html5
---
<p><img src="http://aftnn.org/stuff/journal_src/abookapart_html5.jpg" alt="HTML5 book"/></p>

<p>I&rsquo;ve converted this site to HTML5. It took about 5 minutes.</p>

<p>The first step was to switch the doctype. The HTML5 doctype:</p>

<pre><code class="html">&lt;!DOCTYPE html&gt;</code></pre>

<p>And that&rsquo;s it. No more secret incantation.</p>

<p>The 2nd step was to remove the trailing slashes from void tags (<code>&lt;img&gt;</code>, <code>&lt;meta&gt;</code>, <code>&lt;br&gt;</code>, etc). These are optional in HTML5. I&rsquo;m not using the XML serialisation, so they&rsquo;re unnecessary.</p>

<h2>Next steps</h2>

<p>When I get another 5 minutes, I&rsquo;d like to use the new document structure tags - <code>&lt;header&gt;</code>, <code>&lt;nav&gt;</code>, <code>&lt;section&gt;</code>, <code>&lt;article&gt;</code> and <code>&lt;footer&gt;</code>. These expose the semantics of the document more clearly (useful for authors). They can also be styled with <code>display:block</code> to keep older browsers happy. Their introduction was based on a <a href="http://code.google.com/webstats/index.html">large-scale analysis of HTML document structure performed by Google</a>.</p>
