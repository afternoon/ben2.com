---
layout: post
title: BrightKite/GMaps auto-mashup
date: '2008-11-27T17:03:25+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880421515/brightkitegmaps-auto-mashup
---
<p>A sign that the mashup ecosystem is maturing fast. I was happy to see that creating an embeddable map of my BrightKite check-ins was as simple as feeding my BrightKite RSS url (which contains GeoRSS) info into the search box on <a href="http://maps.google.com/">maps.google.com</a> and then requesting the embed code.</p>

<p>Well, almost.</p>

<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=http:%2F%2Fbrightkite.com%2Fpeople%2Fafternoon%2Fobjects.rss&amp;ie=UTF8&amp;ll=42.410768,-61.238804&amp;spn=18.209215,122.361223&amp;output=embed&amp;s=AARTsJqJ9PJGUhvc6LgS08jymguYQWJYrw"></iframe><br/><small><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=http:%2F%2Fbrightkite.com%2Fpeople%2Fafternoon%2Fobjects.rss&amp;ie=UTF8&amp;ll=42.410768,-61.238804&amp;spn=18.209215,122.361223&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small>

<p>It all works, but the embedded map centres at the mid-point of the set of points, which shows no points at all. I tried to get it to start on London or SF by default, but no dice. Scroll over to see more useful stuff.</p>

<p>BrightKite RSS urls are of the form <a href="http://brightkite.com/people/">http://brightkite.com/people/</a>&lt;username&gt;/objects.rss. Have fun!</p>
