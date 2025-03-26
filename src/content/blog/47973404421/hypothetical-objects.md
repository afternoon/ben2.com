---
layout: post
title: Hypothetical Objects
date: '2002-07-07T21:21:06+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973404421/hypothetical-objects
---
<p>Hype 2 will be object oriented. Here are some of the objects:</p>
<ul>
<li>Core</li>
<li>Validator</li>
<li>Database (PEAR::DB)</li>
<li>Autolinker</li>
<li>Backlinker</li>
<li>Renderer? A wrapper layer around Smarty, similar to WAPHype and the h_drawframe functions from v0.2.</li>
</ul>
<p>It might be worth using objects to manage the various areas of the site, e.g. one to manage the filestore, one which is the core message handler and another that builds pages with portlets. One thing that would be good about splitting off the renderer would be that this can be used to keep track of all the natural language used, making it much easier to change these strings.</p>
<p>Validator, Autolinker and Backlinker should be totally separate to Hype. Backlinker will basically be an implementation of some of the things suggested for Red Herring by Bluefire on Hypothetical (thanks Bluef!), by keeping it separate it should be possible to grow it until it implements all of Red Herring&rsquo;s ideas.</p>
