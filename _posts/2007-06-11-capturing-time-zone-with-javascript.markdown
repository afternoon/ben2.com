---
layout: post
title: Capturing time zone with JavaScript
date: '2007-06-11T04:23:13+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880430446/capturing-time-zone-with-javascript
---
<p>Facebook detects a user&rsquo;s timezone through JavaScript. A Date object is created, the timezone offset and sent back to the server via an Ajax request. This is done on every home page view, so at least every login and generally much more often. It&rsquo;s a simple technique and reliable, because it uses the value set by the visitor on their current computer, dates and times are consistent with the system clock in the corner.</p>
