---
layout: post
title: Oh yeah...
date: '2004-01-12T05:21:03+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880555256/oh-yeah
---
<p>Look what happened to <a href="/blanket/">Blanket</a> the other day:</p>
<p><img src="/stuff/journal_src/blanket-012004-first10days.png" width="359" height="279" alt="Graph of requests for the blanket for the first ten days of January, 2004. The curve starts at 500, then steadily grows to 1710 on the 6th, then on the 7th and 8th the request spike rapidly to 250,000 then 900,000 requests, before falling back to 5000 then 1100 on the ninth and tenth"/></p>
<p>I had to take it offline, it was killing the server. I haven&rsquo;t got around to looking to see what caused such a spike, but it&rsquo;s definitely got something to do with search engines. I have moved the results page to a sub-url (/site/) and banned search engines from spidering that URL. It seems to have worked.</p>
<p>Hmmm, on second thoughts, a quick <code>grep | awk | sort | uniq</code> at the log files makes it look like all 1.2m of the hits in that spike came from 130.94.202.16, which is just a plain old box in Verio&rsquo;s network somewhere, one that is now down. Seems like whoever they are/were they requested some 812,802 unique pages through the blanket, some of them up to 300 times. Either they had a sudden Johnny-5 like thirst for knowledge or there&rsquo;s something going on&hellip;</p>
