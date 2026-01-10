---
layout: post
title: MultiInfoCMS
date: '2004-11-18T02:55:50+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880500280/multiinfocms
---
<p>An <a href="http://www.hut.fi/u/hsivonen/cms/te.html">InfoCMS-alike</a>.</p>

<p>The InfoCMS-alike is multi-site which is a neat idea. I&rsquo;ve deployed about four sites on InfoCMS now and I&rsquo;m getting bored of <code>cvs update</code>-ing them. I&rsquo;m only going to have more, since we&rsquo;re using it for all our in-house web projects. Handling multiple sites on one install would require extensive changes to the codebase. There would need to be a concept of sites at the model level. Secondarily there would need to be a way to split assets and configuration files (sitemap.xml, transform.xsl, application.ini). Finally, how would a site be defined from the point of view of the controller? Are <a href="http://server1.com/">http://server1.com/</a> and <a href="http://server2.com">http://server2.com</a> different sites? Almost certainly. But what about <a href="http://server3.com/afternoon/">http://server3.com/afternoon/</a> and <a href="http://server3.com/someoneelse/?">http://server3.com/someoneelse/?</a> How could these differences be accomodated within a system that depends on mod_rewrite? Certainly the rewrite rules would have to be quite potent.</p>
<p>One way to do it would be to use rewrite rules to pass requests to the same code but adding query string flags. <a href="http://server2.com/">http://server2.com/</a> could be rewritten to <a href="http://server1.com/?site=2.">http://server1.com/?site=2.</a> However, mod_rewrite is optional for InfoCMS, though very strongly recommended. The alternative is to incorporate some kind of similar functionality into InfoCMS itself, adding a sites table with a regex column used for sorting the wheat from the chaff. That&rsquo;s not ideal though, regexs can be very complex to debug, what if two overlap? What should InfoCMS serve in that case?</p>

<p>For the site configuration the answer has to be on the filesystem. For one the information about how to get to the database is in there, though that would be site non-specific. Secondly there&rsquo;s the assets. Thirdly however, InfoCMS currently has no web configuration mechanism. Moving the config to the DB would require one, as hacking the DB with the MySQL client or something similar is a right pain in the ass. I guess the solution would have to be a set of folders, but how would defaults be handled? How could it be kept simple for the most common case, which is that InfoCMS is only used to serve one site?</p>

<p>Also, a recipe for the <a href="http://www.hut.fi/u/hsivonen/blog-server.html">ultimate blog</a></p>
