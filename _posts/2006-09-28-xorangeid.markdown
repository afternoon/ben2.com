---
layout: post
title: X_ORANGE_ID
date: '2006-09-28T22:05:48+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880449035/xorangeid
---
<p>Anyone seen this HTTP header? I get it on a mobile web application when a browser on Orange UK&rsquo;s network hits my site. It&rsquo;s interesting if it&rsquo;s some kind of unique ID. Googling for it returns absolutely no results, which is kind of scary! The value is a base64 encoded string of 16 bytes of binary, so it&rsquo;s not giving much away. On the same requests I see other proprietary headers from the Nokia WAP Gateway software (version 4.0 in this case). I need to do more testing to see if a) it varies between different handsets/SIMs and b) it&rsquo;s consistent for a given handset/SIM.</p>
<p><em>EDIT: Seems like the ID changes between hits from the same phone. Perhaps it&rsquo;s more like a session identifier than a unique device/SIM/user ID.</em></p>
