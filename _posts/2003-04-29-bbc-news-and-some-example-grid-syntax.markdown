---
layout: post
title: BBC News and some example grid syntax
date: '2003-04-29T18:40:05+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973224652/bbc-news-and-some-example-grid-syntax
---
<p>The BBC news site could in many ways be described as a bellwhether and a goal. It&rsquo;s intensely gridded and is a pretty nice layout. Also, it&rsquo;s very highly visited and needs to be compatible with everything. They&rsquo;re not going to be abandoning tables soon. Still, the page could be used as a test case for new syntax.</p>
<p>One thing that occurs to me about any new kind of grid layout is that it needs to have a much more flexible approach to columns and rows. Obviously it wouldn&rsquo;t be a grid if there wasn&rsquo;t some kind of consistency in sizes between blocks, but when layouts get more complex the table author has to rely on increasingly more cunning configurations of colspan and rowspan in order to get the right sized blocks into the layout.</p>
<p>I have been thinking that a good system might be one where the author can define a basic grid, perhaps like this:</p>
<pre class="eg">#g {
   display: grid;
   width: fit-viewport;
   height: fit-viewport;
   x-subdivisions: 3;
   y-subdivisions: 3;
}</pre>
<p>And then define how blocks interact with that grid (gu = grid units):</p>
<pre class="eg">#gc1 {
   display: grid-cell;
   top: 0;
   left: 0;
   width: 3gu;
   height: 1gu;
}

#gc2 {
   display: grid-cell;
   top: 1gu;
   left: 0;
   width: 3gu;
   height: 2gu;
}</pre>
<p>When applied to the following HTML:</p>
<pre class="eg">&lt;div id="g"&gt;
   &lt;div id="gc1"&gt;
      Hi mum!
   &lt;/div&gt;
   &lt;div id="gc2"&gt;
      Look at my page!
   &lt;/div&gt;
&lt;/div&gt;</pre>
<p>This stylesheet would provide a result similar to this table, filling the whole browser window:</p>
<table border="1" width="200">
<tr><td height="66">Hi mum!</td></tr>
<tr><td height="132">Look at my page!</td></tr>
</table>
<p>It also occurred to me that it might be possible to write a simple transformation engine for CSS that takes my suggested syntax and renders it in current HTML+CSS as best it can. Ideally the HTML would not need to be rewritten and the CSS could be translated easily by mapping fluid values on to a specified frame size, in the same way that a browser would eventually anyway. This would be a valuable resource for testing and experimenting. Maybe it&rsquo;s worth investigating SAC, but it might more useful just to implement it with REs.</p>
