---
layout: post
title: Auto-links refinements
date: '2001-07-31T04:08:12+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058206296/auto-links-refinements
---
<p>Database has id, title, url, points. When page is added to the db the url is checked and the title retrieved for the database. Each link is pre-allocated a number of points, points are awarded when the link is clicked. When points are removed is interesting. Should it be every time the page is viewed or should it be after x minutes have ticked by? If the post form is on the main page then demoting after page views may lead the system to slightly more load friendly. Hypothetical is not load friendly, it is load agnostic/stupid. I think I will implement page views first and maybe see how it goes&hellip;</p>
