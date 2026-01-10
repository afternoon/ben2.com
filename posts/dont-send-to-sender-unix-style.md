---
layout: post
title: Don't send to sender, Unix-style
date: '2004-07-20T07:51:08+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880506896/dont-send-to-sender-unix-style
---
<p>Took a while to get this one right, but I set up a filter system whereby an email is routed to everyone but it&rsquo;s sender with only .qmail files and without need for Perl scripts etc.</p>

<p>It&rsquo;s a pretty limited solution, a proper mailing list one implemented by ezmlm or Miles&rsquo; <a href="http://www.samur41.org.uk/lad/hacks/lm2">lm2</a> would probably be loads better. But hey, there&rsquo;s more than one way to do it :-).</p>

<p>Make your .qmail file summat like this:</p>

<p class="eg"><code>
|/var/qmail/bin/condredirect notdude1@example.com /bin/test $SENDER = "dude1@example.com"<br/>
|/var/qmail/bin/condredirect notdude2@example.com /bin/test $SENDER = "notdude2@example.com"<br/>
|/var/qmail/bin/condredirect notdude3@example.com /bin/test $SENDER = "notdude3@example.com"
&amp;everyone@example.com</code></p>

<p>Then set up the not*@ email addresses to forward to the right parties and setup everyone@ to go them all.</p>
<p>As you can see, this will become a pain in the ass to maintain when you start adding more people to it. Should have just done it properly.</p>
<p>Actually, bollocks, I&rsquo;m going to use lm2 instead. This blows. Still worth documenting though. No idea is completely worthless, it can always serve as a bad example. :-)</p>
