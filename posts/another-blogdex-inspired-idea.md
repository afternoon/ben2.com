---
layout: post
title: Another blogdex inspired idea
date: '2001-07-31T03:50:30+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058206777/another-blogdex-inspired-idea
---
<p>Auto-links system. Real simple see. PHP + MySQL. Links can be added and are stored with a time. Links are displayed on a simple page, however many you want.</p>
<p>The interesting bit is in how the system selects the &ldquo;top&rdquo; links, the ones to display. The first implementation would have two metrics of &ldquo;topness&rdquo;: link age and number of clicks. Both would be sliding scales: 2 days old beats 10 clicks and so on. The db should store link data, each link having a tally of page renders it can be used in, the tally should be demoted after 24 hours and when pages are loaded and promoted when the user clicks through. Something along these lines anyway.</p>
<p>It would be nice to test the links before putting them in the database as well. Either simple test on doc returned, or advanced and spots 404&rsquo;s etc.</p>
