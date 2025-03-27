---
layout: post
title: Mo Hype, mo money
date: '2003-07-14T04:19:30+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973074312/mo-hype-mo-money
---
<p>Been doing a load more Hype hacking. I&rsquo;ve now got the new user signup process finished. This verifies you via email and is a bit more involved and sensible that the last version. It&rsquo;s good. It required more in the way of framework. I slightly reshaped the Controller object to allow an arbitrary set of parameters to be passed slash delimited on the request path. The argument parts are then separated from the URL part and passed into the view class as an array. This means the view doesn&rsquo;t need to know how deep it is into the &ldquo;folder&rdquo; hierarchy for it to access it&rsquo;s arguments.</p>
<p>It&rsquo;s getting a touch slow though so I decided to look into profiling. I found <a href="http://www.onlamp.com/pub/a/php/2002/02/28/profilingphp.html">this article at OnLamp.com</a> which describes the very useful <a href="http://pear.php.net/Benchmark">Benchmark_Timer</a> class, which is part of PEAR. I quickly got the output from Benchmark_Timer into CSV format and I&rsquo;m now graphing it in Excel. Job&rsquo;s a good &lsquo;un.</p>
<p>It looks like too much time is being spent on the getLinks() function from <a href="http://pear.php.net/manual/en/package.database.db-dataobject.php">DataObjects</a>. Whilst DO is a great framework, I did have a suspicion it wouldn&rsquo;t be the fastest thing ever. I suspect each getLinks() call results in a DB query. As getLinks() is run once per message displayed, ouch! There are ways to optimise though, even if it means going back to using a join for the core loops.</p>
