---
layout: post
title: Hypothetical 2 proceeding quite well
date: '2001-09-25T07:27:07+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058182570/hypothetical-2-proceeding-quite-well
---
<p>Yesterday wasn&rsquo;t going so good, but today? Leaps and bounds, my friends.</p>
<p>I now have the three main theme functions, h_page, h_portlet and h_frame running. Frame reads a file which, on the surface, looks like any old normal .php file. However, because the string from using the portlet file has to be passed up the function chain I had to hack it so that the file is read into a variable and then anything looking like PHP is found and executed (eval&rsquo;d) in place. This means that everything behaves just like the files were being run in place, but the results can be messed around with later on. This is something that I scratched my brain about whilst working on The Forum at Soup and a solution that I&rsquo;m really happy with :-) :-) :-)! The only flaw is that if you use print or echo they produce text at the top of the page rather than in context. Oh well, just no printing or echoing. If you use &lt;?= ?&gt; instead h_frame picks up on that and inserts the text properly.</p>
