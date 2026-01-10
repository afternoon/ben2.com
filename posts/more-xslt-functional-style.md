---
layout: post
title: 'More XSLT: functional style'
date: '2004-03-22T04:33:50+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880537887/more-xslt-functional-style
---
<p>Take one much-maligned transformation language and throw in some functional style. XSLT has functions, you may know them as templates, but that doesn&rsquo;t stop them being callable objects that have parameters and return values. You just have to know how to use them.</p>
<p>I have been convinced for some time that making brochureware sites should be reducible to making some images and an HTML template and using XSLT to combine those with a XML definition of the site structure and content. It&rsquo;s something I&rsquo;ve tried before and succeeded. The first time I did it it didn&rsquo;t take me any longer to write the XML and XSLT than it would have done to make the site, and changes are still easier to apply. This time I&rsquo;m making the XSLT more general with functional templates and cleaning it up a bit. I&rsquo;m also limiting the scope of the work done in XML/XSLT to the text processing part, rather than moving files around and that sort of thing.</p>
<p>A thought that just occured to me, this would be an interesting strategy to employ to power a basic CMS. Currently a CMS stores everything in a DB and uses scripts (PHP etc) to retrieve that data and make a page. An XSL-powered CMS would store content in XML files and whenever one was edited would use XSLT to transform that XML into an HTML file which would then be stored on the filesystem. Voila, instant caching. The file editing would involve a bit of script glue, but that&rsquo;s nothing special. Might be worth trying next time I do a CMS.</p>
