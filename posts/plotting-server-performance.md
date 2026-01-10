---
layout: post
title: Plotting server performance
date: '2006-11-17T23:29:06+00:00'
tags:
- apache
- benchmarking
- ab
- r
- r-project
tumblr_url: https://aftnn.org/post/47880443570/plotting-server-performance
---
<p>After reading Zed Shaw&rsquo;s uncompromising <a href="http://zedshaw.com/rants/programmer_stats.html">Programmers Need To Learn Statistics Or I Will Kill Them All</a> I felt suitably chided and decided to serve my pennance by kicking some stuff around with <code>ab</code> and <a href="http://www.r-project.org/">R</a>. This is probably the kind of thing that Shaw was decrying, my statistical skills are terrible, but here&rsquo;s what I did.</p>
<h2>Gather some data</h2>
<p>First I wanted to gather some data about my server, so I used <code>ab</code> to benchmark the server several times, making 1,000 requests each time using either 5, 10 or 20 threads. I know this falling straight into the power of ten pitfall. I haven&rsquo;t read the working out the power of my test chapter of the <a href="http://www.cyclismo.org/tutorial/R/">R tutorial</a> (although I have read Joseph Tal&rsquo;s <cite><a href="http://www.amazon.com/Reading-Between-Numbers-Statistical-Thinking/dp/0071364005">Reading Between The Numbers</a></cite> so I shouldn&rsquo;t be able to hide for too long).</p>
<p>This command sets <code>ab</code> going and writes raw data about the requests to a tab-separated file. See <code><a href="http://www.annodex.net/cgi-bin/man/man2html?ab+8">man ab</a></code> for more info.</p>
<p class="eg"><code>ab -n 1000 -c 10 -g journal-n1000-c10.tsv <a href="http://aftnn.org/journal/">http://aftnn.org/journal/</a></code></p>
<p>To remove confounding elements, I guess I should do some or all of the following:</p>
<ul>
<li>Run the test from many different servers around the world to eliminate network and CPU power variations.</li>
<li>Run the same test at random times of the day to eliminate variation caused by the daily cycle of traffic to the site.</li>
<li>Instead of carpet bombing the server with 1,000 requests, I should introduce a random-length wait period between each request, this would (I assume) more accurately model real world traffic, as well as sneaking around any basic cache mechanism in play.</li>
</ul>
<h2>Plot the data with R</h2>
<p>This couldn&rsquo;t be simpler. The following R commands create a histogram of my request data.</p>
<p class="eg"><code>perfdata 
hist(perfdata$ttime)</code></p>
<p>And bingo, R displays this:</p>
<p><img src="http://aftnn.org/stuff/journal_src/aftnn.org-journal-perf.png"/></p>
<p>An abberation no doubt, Zed, but there you go.</p>
