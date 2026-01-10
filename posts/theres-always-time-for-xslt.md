---
layout: post
title: There's always time for XSLT
date: '2003-12-18T22:00:50+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880560789/theres-always-time-for-xslt
---
<p>Was just perusing O'Reilly&rsquo;s <a href="http://www.oreilly.com/catalog/xsltckbk/">XSLT Cookbook</a> in Books Etc. The guy does some interesting stuff including generating lots of code, e.g. C++ program fragments from UML definitions, diagramming XML with SVG and much more. One thing that caught my eye was using XSLT to populate an HTML form with some data from an XML document.</p>
<p>He had some HTML that didn&rsquo;t look all that much like:</p>
<p class="eg"><code>
&lt;form&gt;<br/>
    &lt;input type="text" id="city" value=""/&gt;<br/>
&lt;/form&gt;
</code></p>
<p>The XML would then be something pretty simple. E.g.:</p>
<p class="eg"><code>
&lt;address&gt;<br/>
    &lt;city&gt;London&lt;/city&gt;<br/>
&lt;/address&gt;
</code></p>
<p>The XSLT to combine the two, which I can&rsquo;t recall exactly right now (it&rsquo;s in the <a href="http://examples.oreilly.com/xsltckbk/xsltckbk_examples.zip">examples zip file</a>), just copied the template HTML document to the output HTML document, but would apply a template to the element matching input[@id=&ldquo;city&rdquo;] which inserts the corresponding data from the XML.</p>
<p>This is slightly more effort in this case than a PHP solution:</p>
<p class="eg"><code>
&lt;form&gt;<br/>
    &lt;input type="text" id="city" value="&lt;?= $city ?&gt;"/&gt;<br/>
&lt;/form&gt;
</code></p>
<p>However, the advantage is that the input template is kept clean of any syntax other than plain vanilla HTML (or preferably XHTML). This is a tangible advantage. For all the simplicity claimed for server-side languages, particularly JSP custom tags, they are never going to match up to plain old HTML. A distinct bonus is just being able to use whatever editing tool you care for. Although Dreamweaver is very good, relying on it&rsquo;s abilities to manipulate server-side pages requires that designers understand why they need to use those capabilities and the ramifications of the elements they create. If you can say to someone, &ldquo;just make me an HTML page with demo data in, set the id&rsquo;s right&rdquo;, it&rsquo;s going to be much more straightforward, especially if the designers belong to another organisation, as is the case in my work sometimes.</p>
<p>This is all very well and dandy for forms, but what about a more general solution? This blog for example uses templates that have conditional and repeating sections as well as access to variables. What would be really nice would be to exploit the fact that CSS layout has lead to careful IDing and classification of many elements in HTML pages. Example:</p>
<p class="eg"><code>
&lt;div id="blogentry"&gt;<br/>
    &lt;div class="title"&gt;Title&lt;/div&gt;<br/>
    &lt;div class="date"&gt;Posted on &lt;span id="date"&gt;date&lt;/span&gt;&lt;/div&gt;<br/>
    &lt;div class="content"&gt;Content&lt;/div&gt;<br/>
    &lt;/div&gt;<br/>
&lt;/div&gt;
</code></p>
<p>For the purposes of your designers, you throw them some CSS that styles elements that will be replaced in red or with strikethough or something. Then they can see variables in the document. Then, you&rsquo;d use XSLT to find the elements they&rsquo;ve created by ID or class and replace them with the actual blog data, throwing out their demo data, even doing things like applying a template that loops over multiple entries to div[@id=&ldquo;blogentry&rdquo;]. As with the original XSLT cookbook example, the only requirement between the designer and the developer is that they agree on which IDs and classes are special. This doesn&rsquo;t even have to be done ahead of time if it&rsquo;s a simple project, the designer can just send over the page and the developer can pick out the IDs that the designer has used.</p>
