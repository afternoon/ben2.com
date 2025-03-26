---
layout: post
title: More discussion
date: '2003-04-28T07:25:02+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973231108/more-discussion
---
<p>After I replied, I got quite a bit of feedback. Hixie explained himself a bit more and pointed me in the direction of a few things in CSS 3. Nothing startling. He confessed that he agreed that CSS may require some extra bits. The problem is that the layouts desired are not simple to specify and nobody, least of all me, has gone far towards solving the problem of condensing the required knowledge into syntax.</p>
<p>Then a proposal from academia for a system called <a href="http://www.cs.washington.edu/homes/gjb/papers/css-uist99.pdf">Constraint CSS</a> emerged. In the proposal the authors discuss the additions of rules that describe relationships mathematically. For example, that the first column in a table should be twice as wide as the second, with syntax something like:</p>
<p class="eg"><code>#col2[width] = #col1[width] * 2</code></p>
<p>It looks like a very powerful system, although I have only read the specification briefly. I asked the WG members to feed back on what consideration, if any, they&rsquo;ve given this proposal, how tricky it would be to add to the current specification and how serious the effect would be on browser code. If a proposal for a change to CSS is to be serious, it has to be incredibly easy for the buffoons responsible for IE PC to code. Preferably it should be done for them.</p>
