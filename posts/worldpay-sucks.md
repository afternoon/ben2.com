---
layout: post
title: WorldPay sucks
date: '2004-01-05T06:09:15+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880558365/worldpay-sucks
---
<p>Very bad customisation. I wanted the page to look like part of my application, WorldPay wanted me to use their design service! I&rsquo;m pretty good at HTML, but they gave me no tools to perform the required alterations. The result is ugly. Plus their documentation is out of date, so it didn&rsquo;t tell me that their advanced Java product wasn&rsquo;t supported on Tomcat. Grrr. Their support is pretty good though, but it&rsquo;s nothing to write home about.</p>
<p>When I create an application, consistency is vital. In future I will recommend to my clients that they go the full nine yards and get SSL hosting or a cert for their server and collect CC details themselves. I know some consider this a mugs game, but I wouldn&rsquo;t store those details. I would transmit them (via SSL again, of course) to the payment provider from my backend rather than with the client&rsquo;s frontend. I wrote something similar once, there was no payment provider however, and sending the details on involved GPG them and emailing them. I was careful to make sure nothing leaked out on to the server. As long as nothing unencrypted goes to disk or stays in RAM too long, I&rsquo;m happy.</p>
